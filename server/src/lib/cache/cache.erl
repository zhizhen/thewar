-module(cache).

-export ([
    init/1,
    add/1,
    find/1,
    update/1,
    delete/1,
    destroy/1
    ]).

-export ([
    insert_other/2,
    find_other/2,
    destory_other/2,
    cleanup_other/0]).

-export ([
    lock/1,
    unlock/1,
    is_locked/1,
    freeze/1,
    is_frozen/1
    ]).

% -ifdef(DEBUG).
-export ([test/0]).
% -endif.

% -include("records.hrl").
-record(foo, {v}).
-record(bar, {v}).


%% test
op(K, V) ->
    add(V),
    true  = update(V),
    V     = find(K),
    lock(K),
    false = update(V),
    unlock(K),
    true  = update(V),

    freeze(K),
    false = update(V),

    false = delete(K),
    true  = destroy(K),

    false = find(K).

    
test() ->
    init(1001),
    Opt = [named_table, set, public, 
          {write_concurrency, true},
          {read_concurrency, true}],

    ets:new(foo, Opt),
    op(foo, #foo{}),  % process dict
    op(bar, #bar{}),  % ets

    % other test
    add(#foo{}), update(#foo{v=1}), 
    add(#bar{}), update(#bar{v=2}),

    % add or update use same funtion
    % only use process dict save others' data
    insert_other(1002, #foo{}),
    insert_other(1002, #foo{v=1002}),
    
    insert_other(1003, #bar{}),
    insert_other(1003, #bar{v=1002}),
    
    insert_other(1004, #bar{}),
    insert_other(1004, #bar{v=1002}),

    #foo{} = find_other(1002, foo),
    #bar{} = find_other(1003, bar),
    #bar{} = find_other(1004, bar),

    error_logger:info_msg("~p ~n", [lists:sort(get())]),

    % delete one 
    destory_other(1002, foo),

    % cleanup all the other
    cleanup_other(),

    error_logger:info_msg("~p ~n", [lists:sort(get())]).

%% ==========================================================================
%% api
%% ==========================================================================

init(Identity) -> cache_core:init(Identity).

add(Record) ->
    RecordName = element(1, Record),
    case cache_cfg:cfg(RecordName) of
        pd -> cache_core:add(Record);
        et -> cache_core:add_ets(Record)
    end.

find(RecordName) ->
    case cache_cfg:cfg(RecordName) of
        pd -> cache_core:find(RecordName);
        et -> cache_core:find_ets(RecordName)
    end.


update(Record) ->
    RecordName = element(1, Record),
    case cache_cfg:cfg(RecordName) of
        pd -> cache_core:update(Record);
        et -> cache_core:update_ets(Record)
    end.

delete(RecordName) ->
    case cache_cfg:cfg(RecordName) of
        pd -> cache_core:delete(RecordName);
        et -> cache_core:delete_ets(RecordName)
    end.

destroy(RecordName) ->
    case cache_cfg:cfg(RecordName) of
        pd -> cache_core:destroy(RecordName);
        et -> cache_core:destroy_ets(RecordName)
    end.

lock(RecordName) -> 
    cache_core:lock(RecordName).

unlock(RecordName) -> 
    cache_core:unlock(RecordName).

is_locked(RecordName) -> 
    cache_core:is_locked(RecordName).

freeze(RecordName) -> 
    cache_core:freeze(RecordName).

is_frozen(RecordName) -> 
    cache_core:is_frozen(RecordName).


%% other
insert_other(Identity, Record)  -> 
    cache_core:insert_other(Identity, Record).

find_other(Identity, RecordName)  -> 
    cache_core:find_other(Identity, RecordName).

destory_other(Identity, RecordName) -> 
    cache_core:destory_other(Identity, RecordName).

cleanup_other() -> 
    cache_core:cleanup_other().
