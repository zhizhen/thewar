-ifndef(GAME_PB_HRL).
-define(GAME_PB_HRL, true).
-record(m__proto__test__c2s, {msg_id=998,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10}).
-record(m__action__ready_to_start__s2c, {msg_id=7001,role_id}).
-record(m__role__info__s2c, {msg_id=1107,role_info}).
-record(m__system__heartbeat__c2s, {msg_id=1000}).
-record(m__action__confirm__s2c, {msg_id=7007,turn_id,role_id}).
-record(m__arena__match__c2s, {msg_id=6000}).
-record(p_test, {v1,v2}).
-record(p_pos, {role_id,role_name,job,level,pos_x=0,pos_y=0,dest_x,dest_y,weapon,armor,wing,title_id}).
-record(m__proto__test__s2c, {msg_id=999,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10}).
-record(m__role__create__c2s, {msg_id=1102,name}).
-record(m__action__confirm__c2s, {msg_id=7006,turn_id,role_id}).
-record(m__account__login__c2s, {msg_id=1100,account_id,ticket,platform,server_id}).
-record(m__role__info__c2s, {msg_id=1106,id}).
-record(p_role, {id}).
-record(m__role__login__s2c, {msg_id=1105,role_info}).
-record(m__role__list__s2c, {msg_id=1101,role_list}).
-record(m__role__create__s2c, {msg_id=1103,id}).
-record(m__scene__neighbours__s2c, {msg_id=5001,roles}).
-record(m__action__sync__c2s, {msg_id=7004,turn_id,role_id,action}).
-record(m__role__login__c2s, {msg_id=1104,id}).
-record(m__action__ready_to_start__c2s, {msg_id=7000,role_id}).
-record(m__scene__enter__c2s, {msg_id=5009,scene_id}).
-record(m__arena__match__s2c, {msg_id=6001,seed}).
-record(m__action__sync__s2c, {msg_id=7005,turn_id,role_id,action}).
-record(m__system__notify__s2c, {msg_id=1001,code}).
-endif.