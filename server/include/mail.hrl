-define(MAIL_READ_TIME_LINE, 7*24*60*60).      %% 读取邮件最长时间
-define(MAIL_DELETE_TIME_LINE, 10*24*60*60).   %% 邮件超时删除
-define(MAIL_MAX_ATTACHMENTS_COUNT, 5).        %% 邮件最大附件个数

-define(MAILING_NEW, 1).                       %% 新邮件
-define(MAILING_READ, 2).                      %% 已读邮件
-define(MAILING_ALREADY_GET, 3).               %% 已提取附件
-define(MAILING_DELETE, 4).                    %% 已删除邮件
-define(MAILING_TYPE_BULLETIN, 1).             %% 邮件类型（公告）
-define(MAILING_TYPE_AWARD, 2).                %% 邮件类型（附件奖励）


