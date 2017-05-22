
%% ===========================================================================
%% Act Config
%% ===========================================================================
-define(ACT_RELEASE1,   2).  % 冲级运动会
-define(ACT_RELEASE2,   3).  % 欢乐七天送
-define(ACT_RELEASE3,   4).  % 等级有好礼
-define(ACT_RELEASE4,   5).  % 奔跑吧兄弟
-define(ACT_RELEASE4_ID,  1005).  % 奔跑吧兄弟
-define(ACT_RELEASE5,   6).  % 限时大礼包

-define(ACT_RECHARGE_FIRST,     7).      % 首次充值
-define(ACT_RECHARGE_ACC_REC,   8).      % 累积充值
-define(ACT_RECHARGE_CONTINUE,  9).      % 限时连续充值
-define(ACT_RECHARGE_ACC_CON,   10).     % 限时累计消费
-define(ACT_RECHARGE_BACK,  	12).     % 充值返回元宝
-define(ACT_RECHARGE_GIFT,  	13).     % 充值领奖

-define(ACT_RELEASE6,  11).  % 7天擂台领奖活动


-define(ACT_BACK_RATE, 			1).		 % 充值返回元宝比例

-define(RECHARGE_TRIGGER, 1).
-define(CONSUME_TRIGGER, 2).

-define(ACT_AWARDED, 2).


-define(ACTIVITY_NOT_OPEN, 0). 	% 未开启 
-define(ACTIVITY_OPEN, 1).	% 进行中
-define(ACTIVITY_CLOSED, 2). % 已结束

-define(ACTIVITY_EXPIRED, 0).	% 已失效
-define(ACTIVITY_LIVING, 1).	% 有效期
-define(ACTIVITY_AWARDED, 2).	% 发奖阶段
