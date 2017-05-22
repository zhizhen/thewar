-module(cache_core).
-export ([
    init/1,
    add/1,
    find/1,
    update/1,
    delete/1,
    destroy/1
    ]).

-export ([
    add_ets/1,
    find_ets/1,
    update_ets/1,
    delete_ets/1,
    destroy_ets/1
    ]).

-export ([
    insert_other/2,
    find_other/2,
    destory_other/2,
    cleanup_other/0
    ]).

-export ([
    lock/1,
    unlock/1,
    is_locked/1,
    freeze/1,
    is_frozen/1
    ]).

-ifdef(DEBUG).
-compile(export_all).
-endif.

% -type update_fun() :: fun((term()) -> term()).

%%===================================================================
%% api
%%===================================================================

%% @doc just like init/0, make process identity for cache by yourself
-spec init(term()) -> boolean().
init(Identity) ->
    case get('$process$identity$') of
        undefined ->
            put('$process$identity$', Identity),
            true;
        _Other -> false
    end.

%%% process dict

%% @doc save k v
-spec add(tuple()) -> boolean().
add(Value) ->
    Key = element(1, Value),
    case find(Key) of
        false -> execute_put(Key, Value);
        _Value -> false
    end.

%% @doc fetch value corresponded to key
-spec find(term()) -> term().
find(Key) -> execute_get(Key).

%% @doc brute to overlap the value, when the key is exist
-spec update(tuple()) -> boolean().
update(Value) ->
    Key = element(1, Value), 
    case find(Key) == undefined orelse is_locked(Key) of
        true -> false;
        false -> execute_put(Key, Value)
    end.

%% @doc delete key when not locked or frozen
-spec delete(term()) -> boolean().
delete(Key) ->
    case is_locked(Key) of
        true -> false;
        false -> destroy(Key)
    end.

%% @doc delete key by force, always return true.
-spec destroy(term()) -> true.
destroy(Key) -> 
    erlang:erase({Key, lock}),
    erlang:erase({Key, freeze}),
    erlang:erase(realkey(Key)),
    true.

%% @doc insert by Identity
insert_other(Identity, Value) ->
    Key = element(1, Value),  
    put({other, Identity, Key}, Value).

%% @doc get by Identity
find_other(Identity, Key) ->
    case get({other, Identity, Key}) of
        undefined -> false;
        Value -> Value
    end.

%% @doc destory by Identity
destory_other(Identity, Key) ->
    erase({other, Identity, Key}).

cleanup_other() ->
    F = fun({{other, _, _} = Key, _}) ->
            erase(Key);
           (_) -> ok
        end,
    [F(Item) || Item <- get()].

%%% ets

%% @doc add new key to ets
-spec add_ets(tuple()) -> boolean().
add_ets(Value) ->
    TabName = element(1, Value),
    ets:insert_new(TabName, {realkey(TabName), Value}).

%% @doc update key to ets
-spec update_ets(tuple()) -> boolean().
update_ets(Value) ->
    TabName = element(1, Value),
    case ets:member(TabName, realkey(TabName)) of
        false -> false;
        true -> 
            case is_locked(TabName) of
                true -> false;
                false -> ets:insert(TabName, {realkey(TabName), Value})
            end
    end.

%% @doc fetch key
-spec find_ets(term) -> false | term().
find_ets(Key) ->
    case ets:lookup(Key, realkey(Key)) of
        [{_RealKey, Value}] -> Value;
        [] -> false
    end.

%% @doc delete 
-spec delete_ets(term()) -> true.
delete_ets(Key) ->
    case is_locked(Key) of
        true -> false;
        false -> destroy_ets(Key)
    end.

destroy_ets(Key) ->
    ets:delete(Key, realkey(Key)).

%%% common

%% @doc can't modify this key after lock
-spec lock(term()) -> boolean().
lock(Key) -> 
    case is_frozen(Key) of
        true -> true;
        false -> put({Key, lock}, true), true
    end.

%% @doc unlock the key, then can modify this key.
-spec unlock(term()) -> boolean().
unlock(Key) -> 
    case is_frozen(Key) of
    true -> false;
    _ -> put({Key, lock}, false), true
    end.

%% @doc return the lock state of key
-spec is_locked(term()) -> boolean().
is_locked(Key) -> is_frozen(Key) orelse get({Key, lock}) == true.

%% @doc freeze key, can't modify forever
-spec freeze(term()) -> already_frozen | boolean().
freeze(Key) -> put({Key, freeze}, true), true.

%% @doc return the freeze state of key
-spec is_frozen(term()) -> boolean().
is_frozen(Key) -> get({Key, freeze}) == true.


%% ==========================================================================
%% internal
%% ==========================================================================

%% @private
-spec realkey(term()) -> term().
realkey(Key) ->
    case get('$process$identity$') of
        undefined -> false;
        Identity -> {self, Identity, Key}
    end.


%% @private
-spec execute_put(term(), term()) -> boolean().
execute_put(Key, Value) ->
    case realkey(Key) of
        false -> false;
        RealKey ->
            put(RealKey, Value), 
            true
    end.

%% @private
-spec execute_get(term()) -> boolean().
execute_get(Key) ->
    case realkey(Key) of
        false -> false;
        RealKey -> 
            case get(RealKey) of
                undefined -> false;
                Value -> Value
            end
    end.
