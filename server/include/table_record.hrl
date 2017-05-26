%%%-------------------------------------------------------------------
%%% @author goddess <goddess@rekoo.com>
%%% @copyright (C) 2013, goddess.rekoo.com
%%% @doc auto generated, don't modify!!!!
%%% @date 2017-05-27 02:32:24
%%% 
%%% @end
%%%-------------------------------------------------------------------
%%

-record(account, {
    account_id = "",                          %% 角色编号
    create_time = 0,                          %% 注册时间
    login_time = 0                            %% 登录时间
}).

-define(select_account_sql, <<"select * from accounts where account_id='~ts'">>).
-define(update_account_sql, <<"insert into accounts(account_id,create_time,login_time) values('~ts',~p,~p) on duplicate key update account_id=values(account_id),create_time=values(create_time),login_time=values(login_time)">>).

-record(role, {
    role_id = 0,                              %% 角色编号
    role_name = "",                           %% 角色名字
    account_id = "",                          %% 平台id
    create_time = 0,                          %% 角色创建时间
    login_time = 0                            %% 角色登陆时间
}).

-define(select_role_sql, <<"select * from roles where role_id=~p">>).
-define(update_role_sql, <<"insert into roles(role_id,role_name,account_id,create_time,login_time) values(~p,'~ts','~ts',~p,~p) on duplicate key update role_id=values(role_id),role_name=values(role_name),account_id=values(account_id),create_time=values(create_time),login_time=values(login_time)">>).

