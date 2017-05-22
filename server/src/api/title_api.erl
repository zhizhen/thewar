%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2015, goddess.rekoo.com
%%% @doc
%%%
%%% @end
%%% Created : 2015-2-9 by goddess <goddess@rekoo.com>
%%%-------------------------------------------------------------------
-module(title_api).

% -include("common.hrl").
% -include("logger.hrl").
% -include("msg_code.hrl").
% -include("cfg_record.hrl").
% -include("game_pb.hrl").
% -include("table_record.hrl").
% -include("table_etc.hrl").

% %% API
% -export([
%     info/2,
% 	change/2,
% 	add/2,
%     check_valid/2,
%     check_valid1/2,
%     title_valid_time/1,
%     active/2,
%     handle_throw/1
% ]).

% %%process
% -export([
%     athen_rank1/1,
%     athen_rank2/1,
%     fight_rank1/1,
%     internal_test/1,
%     god_war1/1,
%     god_war2/1,
%     god_war3/1
% ]).

% %%%===================================================================
% %%% API
% %%%===================================================================
% info(#m__title__info__c2s{}, Sender) ->
%     F = fun() ->
%         #game_info{role = Role, titles = Titles} = role_api:get_user_data(),
%         TitleIds =[#p_title{title_id = X#title.title_id, hold_time = X#title.hold_time} || X <- Titles#titles.all, filter(X) == true],
%         Data = #m__title__info__s2c{
%             titles = TitleIds,
%             title_id = Role#role.title_id  
%         },
%         Sender ! {send, Data}
%     end,
%     ?PERFORM(F).

% change(#m__title__change__c2s{title_id = TitleId}, Sender) ->
%     F = fun() -> 
%         #game_info{role = Role, titles = Titles}  = role_api:get_user_data(),
%         if TitleId =/= 0 ->
%             #title{ hold_time = HoldTime } = lists:keyfind(TitleId, #title.title_id, Titles#titles.all),
%             Title_Cfg = title_cfg:get(TitleId),
%             cfg_guard(Title_Cfg, Sender),
%             case Title_Cfg#title_cfg.status =:= 1 andalso ?NOW - HoldTime > 0 of
%                 true -> throw({msg, ?TITLE_EQUIP_FAILED, Sender});
%                 false -> ok
%             end;
%             true -> ok
%         end,

%         UpdateRole = Role#role{title_id = TitleId},
%         game_info:update(UpdateRole),
%         notify(?TITLE_EQUIP_SUCCESS, Sender)
%     end,
%     ?PERFORM(F).
    
% active(#m__title__active__c2s{fight = Fight}, Sender) ->
%     TitleIds = title_cfg:get_all(),
%     FightTitleCfgs = lists:map(fun(Id) -> Cfg = title_cfg:get(Id), if Cfg#title_cfg.check_fight =/= 0 -> Cfg; true -> ok end end, TitleIds),
%     Fights = [Cfg#title_cfg.check_fight || Cfg <- FightTitleCfgs, Cfg =/= ok],
%     case lists:keyfind(lists:min([X || X <- Fights, X =< Fight]), #title_cfg.check_fight, FightTitleCfgs) of 
%         #title_cfg{title_id = TitleId} -> add(TitleId, Sender);
%         false -> ok
%     end.

% %%%===================================================================
% %%% process api
% %%%===================================================================
% athen_rank1(Sender) -> add(?ATHEN_RANK1, Sender).              % 猛将排行第一名
% athen_rank2(Sender) -> add(?ATHEN_RANK2, Sender).              % 猛将排行第二至第十名
% fight_rank1(Sender) -> add(?FIGHT_RANK1, Sender).              % 战力排行第一名
% internal_test(Sender) -> add(?INTERNAL_TEST, Sender).          % 参与过第一次内测的玩家
% god_war1(Sender) -> add(?GOD_WAR1, Sender).                 % 战神活动第一名
% god_war2(Sender) -> add(?GOD_WAR2, Sender).                 % 战神活动第二名
% god_war3(Sender) -> add(?GOD_WAR3, Sender).                 % 战神活动第三名

% add(Id, Sender) ->
%     F = fun() ->
%         #game_info{role = Role, titles = Titles} = role_api:get_user_data(),
%         All = Titles#titles.all,
%         Title_Cfg = title_cfg:get(Id),
%         cfg_guard(Title_Cfg, Sender),
%         IsHave = lists:keyfind(Id, #title.title_id, All),
%         ValidTime = 
%             case Title_Cfg#title_cfg.status > 0 of
%                 true -> ?NOW + Title_Cfg#title_cfg.valid_time;
%                 false -> 0
%             end,
%         Title = #title{role_id = Role#role.role_id, title_id = Id, hold_time = ValidTime},
        
%         case IsHave of
%             false -> 
%                 title_db:add(Title),
%                 game_info:update(Titles#titles{all = All ++ [Title]}),
%                 Sender ! {send, #m__title__add__s2c{title = #p_title{title_id = Id, hold_time = ValidTime}}};
%             _ -> 
%                 Titles1 = Titles#titles{all=lists:keyreplace(Id, #title.title_id, All, Title)},
%                 game_info:update(Titles1),
%                 if  Title_Cfg#title_cfg.status > 0 ->
%                     Sender ! {send, #m__title__add__s2c{ title = #p_title{title_id = Id, hold_time = ValidTime}}};
%                     true -> ok
%                 end
%         end
%     end,
%     ?PERFORM(F).
% %%%===================================================================
% %%% Internal functions
% %%%===================================================================
% check_valid(Role, Titles) ->
%     IsLost = check_valid1(Role, Titles),
%     if not IsLost -> 
%         false;
%         true ->
%             game_info:update(Role#role{title_id = 0}),
%             self() ! {send, #m__system__notify__s2c{code=?TITLE_INVALID}}
%     end.

% check_valid1(Role, Titles) ->
%     CurId = Role#role.title_id,
%     if CurId =:= 0 -> 
%         false;
%         true ->  
%             #title{hold_time = HoldTime} = lists:keyfind(CurId, #title.title_id, Titles#titles.all),
%             Cfg = title_cfg:get(CurId),
%             Cfg#title_cfg.status =:= 1 andalso ?NOW - HoldTime > 0
%     end.

% %%获取称号的有效时间
% title_valid_time(0) -> 0;
% title_valid_time(undefined) -> 0;
% title_valid_time(Id) ->
%     #game_info{role = Role, titles = Titles} = role_api:get_user_data(),
%     case lists:keyfind(Id, #title.title_id, Titles#titles.all) of 
%         false -> ?ERROR_MSG("role_id:~p, title_id:~p Id:~p", [Role#role.role_id, Role#role.title_id, Id]),
%             0;
%         Title ->  Title#title.hold_time
%     end.

% filter(Title) ->
%     case Title#title.hold_time of
%         0 -> true;
%         T -> ?NOW - T < 0
%     end.


% cfg_guard(false, Sender) -> throw({msg, ?TITLE_INVALID, Sender});
% cfg_guard(_, _) -> ok.

% handle_throw({msg, Code, ClientSender}) ->
%     notify(Code, ClientSender);
% handle_throw(Reason) ->
%     throw(Reason).

% notify(Code, ClientSender) ->
%     ClientSender ! {send, #m__system__notify__s2c{code=Code}}.
