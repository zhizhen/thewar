%% Copyright
-module(feedback_db).
-include("table_record.hrl").
-include("common.hrl").

%% %% API
%% %% -export([get/1, get_role/1, get_reply/1]).
%% -export([get/1, get_last/1, get_reply_data/1, update_reply/1, update_reply/3, delete_reply/1, save/1]).
%%
%% get_last(RoleId) ->
%%     Start = ?NOW - 604800,
%%     Sql = <<"select * from feedback where role_id=? and time > ? order by time desc ">>,
%%     Rows = mysql_db:select(Sql, [RoleId, Start]),
%%     build_all_feedback(Rows).
%%
%% get_reply_data(Id) ->
%%     Sql = <<"select id,role_id,reply_content from feedback where id=? and state=? and reply_time !=0">>,
%%     mysql_db:select(Sql, [Id, ?NO]).
%%
%% get(Id) ->
%%     Sql = <<"select * from feedback where id=? and state=? and reply_time=0">>,
%%     case mysql_db:select(Sql, [Id, ?NO]) of
%%         [] -> [];
%%         [Rows] -> #feedback{} = erlang:list_to_tuple([feedback|Rows])
%%     end.
%%
%%
%% %% @doc 状态设置为已经发送邮件
%% update_reply(Id) ->
%% %%     Sql = <<"replace into feedback (id, state) values(?, ?)">>,
%%     Sql = <<"update feedback set state=? where id=?">>,
%%     mysql_db:update(Sql, [?YES, Id]).
%%
%% update_reply(Id, Content, Time) ->
%%     Sql = ["update feedback set state=1, reply_content=?, reply_time=? where id=?"],
%%     mysql_db:update(erlang:iolist_to_binary(Sql), [Content, Time, Id]).
%%
%% delete_reply(Id) ->
%%     Sql = <<"delete feedback where id=?">>,
%%     mysql_db:delete(Sql, [Id]).
%%
%%
%% save(#feedback{
%%     id=Id,
%%     type=Type,
%%     server_id=ServerId,
%%     role_id=RoleId,
%%     role_name=RoleName,
%%     content=Content,
%%     time=Time,
%%     date=Date,
%%     state=State,
%%     reply_content=ReplyContent,
%%     reply_time=ReplyTime
%% }) ->
%%     case Id of
%%         undefined ->
%%             Sql = <<"insert into feedback(type, server_id ,role_id ,role_name ,content ,time,date) values(?,?,?,?,?,?,?)">>,
%%             Param = [Type, ServerId, RoleId, RoleName, Content, Time, Date],
%%             mysql_db:insert(Sql, Param);
%%         Id ->
%% %%             Sql = <<"replace into feedback(id,type,server_id ,role_id ,role_name ,content ,time,date,state,reply_content,reply_time) values(?,?,?,?,?,?,?,?,?,?,?)">>,
%%             Param = [Id, Type, ServerId, RoleId, RoleName, Content, fTime, Date, State, ReplyContent, ReplyTime],
%%             mysql_db:update(?update_feedback_sql, Param)
%%     end.
%%
%%
%% build_all_feedback(L) ->
%%     [build_feedback(I) || I <- L].
%% build_feedback([Id, Type, ServerId, RoleId, RoleName, Content, Time, Date, State, ReplyContent, ReplyTime]) ->
%%     #feedback{
%%             id=Id,
%%             type=Type,
%%             server_id=ServerId,
%%             role_id=RoleId,
%%             role_name=RoleName,
%%             content=Content,
%%             time=Time,
%%             date=Date,
%%             state=State,
%%             reply_content=ReplyContent,
%%             reply_time=ReplyTime
%%     }.

