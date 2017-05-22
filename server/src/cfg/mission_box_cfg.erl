-module(mission_box_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get({30001,6}) ->
    #mission_box_cfg{
        mission_id=30001,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-83"]},#mission_box_item{chance=100,awards=["4-150"]},#mission_box_item{chance=100,awards=["4-218"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30001,5}) ->
    #mission_box_cfg{
        mission_id=30001,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-90"]},#mission_box_item{chance=100,awards=["4-160"]},#mission_box_item{chance=100,awards=["4-230"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30001,4}) ->
    #mission_box_cfg{
        mission_id=30001,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-97"]},#mission_box_item{chance=100,awards=["4-170"]},#mission_box_item{chance=100,awards=["4-243"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30001,3}) ->
    #mission_box_cfg{
        mission_id=30001,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-104"]},#mission_box_item{chance=100,awards=["4-180"]},#mission_box_item{chance=100,awards=["4-256"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30001,2}) ->
    #mission_box_cfg{
        mission_id=30001,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-112"]},#mission_box_item{chance=100,awards=["4-190"]},#mission_box_item{chance=100,awards=["4-268"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30001,1}) ->
    #mission_box_cfg{
        mission_id=30001,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-120"]},#mission_box_item{chance=100,awards=["4-200"]},#mission_box_item{chance=100,awards=["4-280"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30002,6}) ->
    #mission_box_cfg{
        mission_id=30002,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-104"]},#mission_box_item{chance=100,awards=["4-170"]},#mission_box_item{chance=100,awards=["4-236"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30002,5}) ->
    #mission_box_cfg{
        mission_id=30002,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-112"]},#mission_box_item{chance=100,awards=["4-180"]},#mission_box_item{chance=100,awards=["4-248"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30002,4}) ->
    #mission_box_cfg{
        mission_id=30002,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-120"]},#mission_box_item{chance=100,awards=["4-190"]},#mission_box_item{chance=100,awards=["4-260"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30002,3}) ->
    #mission_box_cfg{
        mission_id=30002,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-128"]},#mission_box_item{chance=100,awards=["4-200"]},#mission_box_item{chance=100,awards=["4-272"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30002,2}) ->
    #mission_box_cfg{
        mission_id=30002,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-137"]},#mission_box_item{chance=100,awards=["4-210"]},#mission_box_item{chance=100,awards=["4-284"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30002,1}) ->
    #mission_box_cfg{
        mission_id=30002,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-145"]},#mission_box_item{chance=100,awards=["4-220"]},#mission_box_item{chance=100,awards=["4-295"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30003,6}) ->
    #mission_box_cfg{
        mission_id=30003,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-127"]},#mission_box_item{chance=100,awards=["4-190"]},#mission_box_item{chance=100,awards=["4-253"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30003,5}) ->
    #mission_box_cfg{
        mission_id=30003,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-136"]},#mission_box_item{chance=100,awards=["4-200"]},#mission_box_item{chance=100,awards=["4-264"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30003,4}) ->
    #mission_box_cfg{
        mission_id=30003,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-145"]},#mission_box_item{chance=100,awards=["4-210"]},#mission_box_item{chance=100,awards=["4-275"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30003,3}) ->
    #mission_box_cfg{
        mission_id=30003,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-154"]},#mission_box_item{chance=100,awards=["4-220"]},#mission_box_item{chance=100,awards=["4-286"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30003,2}) ->
    #mission_box_cfg{
        mission_id=30003,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-163"]},#mission_box_item{chance=100,awards=["4-230"]},#mission_box_item{chance=100,awards=["4-297"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30003,1}) ->
    #mission_box_cfg{
        mission_id=30003,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-173"]},#mission_box_item{chance=100,awards=["4-240"]},#mission_box_item{chance=100,awards=["4-307"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30004,6}) ->
    #mission_box_cfg{
        mission_id=30004,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-153"]},#mission_box_item{chance=100,awards=["4-210"]},#mission_box_item{chance=100,awards=["4-267"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30004,5}) ->
    #mission_box_cfg{
        mission_id=30004,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-163"]},#mission_box_item{chance=100,awards=["4-220"]},#mission_box_item{chance=100,awards=["4-277"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30004,4}) ->
    #mission_box_cfg{
        mission_id=30004,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-173"]},#mission_box_item{chance=100,awards=["4-230"]},#mission_box_item{chance=100,awards=["4-288"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30004,3}) ->
    #mission_box_cfg{
        mission_id=30004,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-182"]},#mission_box_item{chance=100,awards=["4-240"]},#mission_box_item{chance=100,awards=["4-298"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30004,2}) ->
    #mission_box_cfg{
        mission_id=30004,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-193"]},#mission_box_item{chance=100,awards=["4-250"]},#mission_box_item{chance=100,awards=["4-308"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30004,1}) ->
    #mission_box_cfg{
        mission_id=30004,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-203"]},#mission_box_item{chance=100,awards=["4-260"]},#mission_box_item{chance=100,awards=["4-317"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30005,6}) ->
    #mission_box_cfg{
        mission_id=30005,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-182"]},#mission_box_item{chance=100,awards=["4-230"]},#mission_box_item{chance=100,awards=["4-278"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30005,5}) ->
    #mission_box_cfg{
        mission_id=30005,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-192"]},#mission_box_item{chance=100,awards=["4-240"]},#mission_box_item{chance=100,awards=["4-288"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30005,4}) ->
    #mission_box_cfg{
        mission_id=30005,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-203"]},#mission_box_item{chance=100,awards=["4-250"]},#mission_box_item{chance=100,awards=["4-298"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30005,3}) ->
    #mission_box_cfg{
        mission_id=30005,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-213"]},#mission_box_item{chance=100,awards=["4-260"]},#mission_box_item{chance=100,awards=["4-307"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30005,2}) ->
    #mission_box_cfg{
        mission_id=30005,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-224"]},#mission_box_item{chance=100,awards=["4-270"]},#mission_box_item{chance=100,awards=["4-316"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30005,1}) ->
    #mission_box_cfg{
        mission_id=30005,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-235"]},#mission_box_item{chance=100,awards=["4-280"]},#mission_box_item{chance=100,awards=["4-325"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30006,6}) ->
    #mission_box_cfg{
        mission_id=30006,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-213"]},#mission_box_item{chance=100,awards=["4-250"]},#mission_box_item{chance=100,awards=["4-288"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30006,5}) ->
    #mission_box_cfg{
        mission_id=30006,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-224"]},#mission_box_item{chance=100,awards=["4-260"]},#mission_box_item{chance=100,awards=["4-296"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30006,4}) ->
    #mission_box_cfg{
        mission_id=30006,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-235"]},#mission_box_item{chance=100,awards=["4-270"]},#mission_box_item{chance=100,awards=["4-305"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30006,3}) ->
    #mission_box_cfg{
        mission_id=30006,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-246"]},#mission_box_item{chance=100,awards=["4-280"]},#mission_box_item{chance=100,awards=["4-314"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30006,2}) ->
    #mission_box_cfg{
        mission_id=30006,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-258"]},#mission_box_item{chance=100,awards=["4-290"]},#mission_box_item{chance=100,awards=["4-322"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30006,1}) ->
    #mission_box_cfg{
        mission_id=30006,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-270"]},#mission_box_item{chance=100,awards=["4-300"]},#mission_box_item{chance=100,awards=["4-330"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30007,6}) ->
    #mission_box_cfg{
        mission_id=30007,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-240"]},#mission_box_item{chance=100,awards=["4-270"]},#mission_box_item{chance=100,awards=["4-300"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30007,5}) ->
    #mission_box_cfg{
        mission_id=30007,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-246"]},#mission_box_item{chance=100,awards=["4-280"]},#mission_box_item{chance=100,awards=["4-314"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30007,4}) ->
    #mission_box_cfg{
        mission_id=30007,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-252"]},#mission_box_item{chance=100,awards=["4-290"]},#mission_box_item{chance=100,awards=["4-328"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30007,3}) ->
    #mission_box_cfg{
        mission_id=30007,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-258"]},#mission_box_item{chance=100,awards=["4-300"]},#mission_box_item{chance=100,awards=["4-342"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30007,2}) ->
    #mission_box_cfg{
        mission_id=30007,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-264"]},#mission_box_item{chance=100,awards=["4-310"]},#mission_box_item{chance=100,awards=["4-357"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30007,1}) ->
    #mission_box_cfg{
        mission_id=30007,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-269"]},#mission_box_item{chance=100,awards=["4-320"]},#mission_box_item{chance=100,awards=["4-371"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30008,6}) ->
    #mission_box_cfg{
        mission_id=30008,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-241"]},#mission_box_item{chance=100,awards=["4-290"]},#mission_box_item{chance=100,awards=["4-339"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30008,5}) ->
    #mission_box_cfg{
        mission_id=30008,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-246"]},#mission_box_item{chance=100,awards=["4-300"]},#mission_box_item{chance=100,awards=["4-354"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30008,4}) ->
    #mission_box_cfg{
        mission_id=30008,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-251"]},#mission_box_item{chance=100,awards=["4-310"]},#mission_box_item{chance=100,awards=["4-369"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30008,3}) ->
    #mission_box_cfg{
        mission_id=30008,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-256"]},#mission_box_item{chance=100,awards=["4-320"]},#mission_box_item{chance=100,awards=["4-384"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30008,2}) ->
    #mission_box_cfg{
        mission_id=30008,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-261"]},#mission_box_item{chance=100,awards=["4-330"]},#mission_box_item{chance=100,awards=["4-399"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30008,1}) ->
    #mission_box_cfg{
        mission_id=30008,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-265"]},#mission_box_item{chance=100,awards=["4-340"]},#mission_box_item{chance=100,awards=["4-415"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30009,6}) ->
    #mission_box_cfg{
        mission_id=30009,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-239"]},#mission_box_item{chance=100,awards=["4-310"]},#mission_box_item{chance=100,awards=["4-381"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30009,5}) ->
    #mission_box_cfg{
        mission_id=30009,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-243"]},#mission_box_item{chance=100,awards=["4-320"]},#mission_box_item{chance=100,awards=["4-397"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30009,4}) ->
    #mission_box_cfg{
        mission_id=30009,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-248"]},#mission_box_item{chance=100,awards=["4-330"]},#mission_box_item{chance=100,awards=["4-413"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30009,3}) ->
    #mission_box_cfg{
        mission_id=30009,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-252"]},#mission_box_item{chance=100,awards=["4-340"]},#mission_box_item{chance=100,awards=["4-428"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30009,2}) ->
    #mission_box_cfg{
        mission_id=30009,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-256"]},#mission_box_item{chance=100,awards=["4-350"]},#mission_box_item{chance=100,awards=["4-445"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30009,1}) ->
    #mission_box_cfg{
        mission_id=30009,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-259"]},#mission_box_item{chance=100,awards=["4-360"]},#mission_box_item{chance=100,awards=["4-461"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30010,6}) ->
    #mission_box_cfg{
        mission_id=30010,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-234"]},#mission_box_item{chance=100,awards=["4-330"]},#mission_box_item{chance=100,awards=["4-426"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30010,5}) ->
    #mission_box_cfg{
        mission_id=30010,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-238"]},#mission_box_item{chance=100,awards=["4-340"]},#mission_box_item{chance=100,awards=["4-442"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30010,4}) ->
    #mission_box_cfg{
        mission_id=30010,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-242"]},#mission_box_item{chance=100,awards=["4-350"]},#mission_box_item{chance=100,awards=["4-459"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30010,3}) ->
    #mission_box_cfg{
        mission_id=30010,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-245"]},#mission_box_item{chance=100,awards=["4-360"]},#mission_box_item{chance=100,awards=["4-475"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30010,2}) ->
    #mission_box_cfg{
        mission_id=30010,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-248"]},#mission_box_item{chance=100,awards=["4-370"]},#mission_box_item{chance=100,awards=["4-492"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30010,1}) ->
    #mission_box_cfg{
        mission_id=30010,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-251"]},#mission_box_item{chance=100,awards=["4-380"]},#mission_box_item{chance=100,awards=["4-509"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30011,6}) ->
    #mission_box_cfg{
        mission_id=30011,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-228"]},#mission_box_item{chance=100,awards=["4-350"]},#mission_box_item{chance=100,awards=["4-473"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30011,5}) ->
    #mission_box_cfg{
        mission_id=30011,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-230"]},#mission_box_item{chance=100,awards=["4-360"]},#mission_box_item{chance=100,awards=["4-490"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30011,4}) ->
    #mission_box_cfg{
        mission_id=30011,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-233"]},#mission_box_item{chance=100,awards=["4-370"]},#mission_box_item{chance=100,awards=["4-507"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30011,3}) ->
    #mission_box_cfg{
        mission_id=30011,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-236"]},#mission_box_item{chance=100,awards=["4-380"]},#mission_box_item{chance=100,awards=["4-524"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30011,2}) ->
    #mission_box_cfg{
        mission_id=30011,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-238"]},#mission_box_item{chance=100,awards=["4-390"]},#mission_box_item{chance=100,awards=["4-542"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30011,1}) ->
    #mission_box_cfg{
        mission_id=30011,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-240"]},#mission_box_item{chance=100,awards=["4-400"]},#mission_box_item{chance=100,awards=["4-560"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30012,6}) ->
    #mission_box_cfg{
        mission_id=30012,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-218"]},#mission_box_item{chance=100,awards=["4-370"]},#mission_box_item{chance=100,awards=["4-522"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30012,5}) ->
    #mission_box_cfg{
        mission_id=30012,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-220"]},#mission_box_item{chance=100,awards=["4-380"]},#mission_box_item{chance=100,awards=["4-540"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30012,4}) ->
    #mission_box_cfg{
        mission_id=30012,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-222"]},#mission_box_item{chance=100,awards=["4-390"]},#mission_box_item{chance=100,awards=["4-558"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30012,3}) ->
    #mission_box_cfg{
        mission_id=30012,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-224"]},#mission_box_item{chance=100,awards=["4-400"]},#mission_box_item{chance=100,awards=["4-576"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30012,2}) ->
    #mission_box_cfg{
        mission_id=30012,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-226"]},#mission_box_item{chance=100,awards=["4-410"]},#mission_box_item{chance=100,awards=["4-595"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30012,1}) ->
    #mission_box_cfg{
        mission_id=30012,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-227"]},#mission_box_item{chance=100,awards=["4-420"]},#mission_box_item{chance=100,awards=["4-613"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30013,6}) ->
    #mission_box_cfg{
        mission_id=30013,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-207"]},#mission_box_item{chance=100,awards=["4-390"]},#mission_box_item{chance=100,awards=["4-573"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30013,5}) ->
    #mission_box_cfg{
        mission_id=30013,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-208"]},#mission_box_item{chance=100,awards=["4-400"]},#mission_box_item{chance=100,awards=["4-592"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30013,4}) ->
    #mission_box_cfg{
        mission_id=30013,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-209"]},#mission_box_item{chance=100,awards=["4-410"]},#mission_box_item{chance=100,awards=["4-611"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30013,3}) ->
    #mission_box_cfg{
        mission_id=30013,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-210"]},#mission_box_item{chance=100,awards=["4-420"]},#mission_box_item{chance=100,awards=["4-630"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30013,2}) ->
    #mission_box_cfg{
        mission_id=30013,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-211"]},#mission_box_item{chance=100,awards=["4-430"]},#mission_box_item{chance=100,awards=["4-649"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30013,1}) ->
    #mission_box_cfg{
        mission_id=30013,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-211"]},#mission_box_item{chance=100,awards=["4-440"]},#mission_box_item{chance=100,awards=["4-669"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30014,6}) ->
    #mission_box_cfg{
        mission_id=30014,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-201"]},#mission_box_item{chance=100,awards=["4-410"]},#mission_box_item{chance=100,awards=["4-619"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30014,5}) ->
    #mission_box_cfg{
        mission_id=30014,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-210"]},#mission_box_item{chance=100,awards=["4-420"]},#mission_box_item{chance=100,awards=["4-630"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30014,4}) ->
    #mission_box_cfg{
        mission_id=30014,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-219"]},#mission_box_item{chance=100,awards=["4-430"]},#mission_box_item{chance=100,awards=["4-641"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30014,3}) ->
    #mission_box_cfg{
        mission_id=30014,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-229"]},#mission_box_item{chance=100,awards=["4-440"]},#mission_box_item{chance=100,awards=["4-651"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30014,2}) ->
    #mission_box_cfg{
        mission_id=30014,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-239"]},#mission_box_item{chance=100,awards=["4-450"]},#mission_box_item{chance=100,awards=["4-662"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30014,1}) ->
    #mission_box_cfg{
        mission_id=30014,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-248"]},#mission_box_item{chance=100,awards=["4-460"]},#mission_box_item{chance=100,awards=["4-672"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30015,6}) ->
    #mission_box_cfg{
        mission_id=30015,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-237"]},#mission_box_item{chance=100,awards=["4-430"]},#mission_box_item{chance=100,awards=["4-624"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30015,5}) ->
    #mission_box_cfg{
        mission_id=30015,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-246"]},#mission_box_item{chance=100,awards=["4-440"]},#mission_box_item{chance=100,awards=["4-634"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30015,4}) ->
    #mission_box_cfg{
        mission_id=30015,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-257"]},#mission_box_item{chance=100,awards=["4-450"]},#mission_box_item{chance=100,awards=["4-644"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30015,3}) ->
    #mission_box_cfg{
        mission_id=30015,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-267"]},#mission_box_item{chance=100,awards=["4-460"]},#mission_box_item{chance=100,awards=["4-653"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30015,2}) ->
    #mission_box_cfg{
        mission_id=30015,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-277"]},#mission_box_item{chance=100,awards=["4-470"]},#mission_box_item{chance=100,awards=["4-663"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30015,1}) ->
    #mission_box_cfg{
        mission_id=30015,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-288"]},#mission_box_item{chance=100,awards=["4-480"]},#mission_box_item{chance=100,awards=["4-672"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30016,6}) ->
    #mission_box_cfg{
        mission_id=30016,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-275"]},#mission_box_item{chance=100,awards=["9-61"]},#mission_box_item{chance=100,awards=["12-135"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30016,5}) ->
    #mission_box_cfg{
        mission_id=30016,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-285"]},#mission_box_item{chance=100,awards=["9-62"]},#mission_box_item{chance=100,awards=["12-138"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30016,4}) ->
    #mission_box_cfg{
        mission_id=30016,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-296"]},#mission_box_item{chance=100,awards=["9-64"]},#mission_box_item{chance=100,awards=["12-142"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30016,3}) ->
    #mission_box_cfg{
        mission_id=30016,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-307"]},#mission_box_item{chance=100,awards=["9-64"]},#mission_box_item{chance=100,awards=["12-142"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30016,2}) ->
    #mission_box_cfg{
        mission_id=30016,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-319"]},#mission_box_item{chance=100,awards=["9-66"]},#mission_box_item{chance=100,awards=["12-146"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30016,1}) ->
    #mission_box_cfg{
        mission_id=30016,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-330"]},#mission_box_item{chance=100,awards=["9-67"]},#mission_box_item{chance=100,awards=["12-149"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30017,6}) ->
    #mission_box_cfg{
        mission_id=30017,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-315"]},#mission_box_item{chance=100,awards=["9-64"]},#mission_box_item{chance=100,awards=["12-142"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30017,5}) ->
    #mission_box_cfg{
        mission_id=30017,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-326"]},#mission_box_item{chance=100,awards=["9-64"]},#mission_box_item{chance=100,awards=["12-142"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30017,4}) ->
    #mission_box_cfg{
        mission_id=30017,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-338"]},#mission_box_item{chance=100,awards=["9-66"]},#mission_box_item{chance=100,awards=["12-146"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30017,3}) ->
    #mission_box_cfg{
        mission_id=30017,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-350"]},#mission_box_item{chance=100,awards=["9-67"]},#mission_box_item{chance=100,awards=["12-149"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30017,2}) ->
    #mission_box_cfg{
        mission_id=30017,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-362"]},#mission_box_item{chance=100,awards=["9-69"]},#mission_box_item{chance=100,awards=["12-153"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30017,1}) ->
    #mission_box_cfg{
        mission_id=30017,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-374"]},#mission_box_item{chance=100,awards=["9-70"]},#mission_box_item{chance=100,awards=["12-156"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30018,6}) ->
    #mission_box_cfg{
        mission_id=30018,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-358"]},#mission_box_item{chance=100,awards=["9-66"]},#mission_box_item{chance=100,awards=["12-146"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30018,5}) ->
    #mission_box_cfg{
        mission_id=30018,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-370"]},#mission_box_item{chance=100,awards=["9-67"]},#mission_box_item{chance=100,awards=["12-149"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30018,4}) ->
    #mission_box_cfg{
        mission_id=30018,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-383"]},#mission_box_item{chance=100,awards=["9-69"]},#mission_box_item{chance=100,awards=["12-153"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30018,3}) ->
    #mission_box_cfg{
        mission_id=30018,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-395"]},#mission_box_item{chance=100,awards=["9-70"]},#mission_box_item{chance=100,awards=["12-156"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30018,2}) ->
    #mission_box_cfg{
        mission_id=30018,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-408"]},#mission_box_item{chance=100,awards=["9-72"]},#mission_box_item{chance=100,awards=["12-160"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30018,1}) ->
    #mission_box_cfg{
        mission_id=30018,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-421"]},#mission_box_item{chance=100,awards=["9-72"]},#mission_box_item{chance=100,awards=["12-160"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30019,6}) ->
    #mission_box_cfg{
        mission_id=30019,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-403"]},#mission_box_item{chance=100,awards=["9-69"]},#mission_box_item{chance=100,awards=["12-153"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30019,5}) ->
    #mission_box_cfg{
        mission_id=30019,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-416"]},#mission_box_item{chance=100,awards=["9-70"]},#mission_box_item{chance=100,awards=["12-156"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30019,4}) ->
    #mission_box_cfg{
        mission_id=30019,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-429"]},#mission_box_item{chance=100,awards=["9-72"]},#mission_box_item{chance=100,awards=["12-160"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30019,3}) ->
    #mission_box_cfg{
        mission_id=30019,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-443"]},#mission_box_item{chance=100,awards=["9-72"]},#mission_box_item{chance=100,awards=["12-160"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30019,2}) ->
    #mission_box_cfg{
        mission_id=30019,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-457"]},#mission_box_item{chance=100,awards=["9-74"]},#mission_box_item{chance=100,awards=["12-164"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30019,1}) ->
    #mission_box_cfg{
        mission_id=30019,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-470"]},#mission_box_item{chance=100,awards=["9-75"]},#mission_box_item{chance=100,awards=["12-167"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30020,6}) ->
    #mission_box_cfg{
        mission_id=30020,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-451"]},#mission_box_item{chance=100,awards=["9-72"]},#mission_box_item{chance=100,awards=["12-160"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30020,5}) ->
    #mission_box_cfg{
        mission_id=30020,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-464"]},#mission_box_item{chance=100,awards=["9-72"]},#mission_box_item{chance=100,awards=["12-160"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30020,4}) ->
    #mission_box_cfg{
        mission_id=30020,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-479"]},#mission_box_item{chance=100,awards=["9-74"]},#mission_box_item{chance=100,awards=["12-164"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30020,3}) ->
    #mission_box_cfg{
        mission_id=30020,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-482"]},#mission_box_item{chance=100,awards=["9-75"]},#mission_box_item{chance=100,awards=["12-167"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30020,2}) ->
    #mission_box_cfg{
        mission_id=30020,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-485"]},#mission_box_item{chance=100,awards=["9-77"]},#mission_box_item{chance=100,awards=["12-171"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30020,1}) ->
    #mission_box_cfg{
        mission_id=30020,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-487"]},#mission_box_item{chance=100,awards=["9-79"]},#mission_box_item{chance=100,awards=["12-175"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30021,6}) ->
    #mission_box_cfg{
        mission_id=30021,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-457"]},#mission_box_item{chance=100,awards=["9-74"]},#mission_box_item{chance=100,awards=["12-164"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30021,5}) ->
    #mission_box_cfg{
        mission_id=30021,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-459"]},#mission_box_item{chance=100,awards=["9-75"]},#mission_box_item{chance=100,awards=["12-167"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30021,4}) ->
    #mission_box_cfg{
        mission_id=30021,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-462"]},#mission_box_item{chance=100,awards=["9-77"]},#mission_box_item{chance=100,awards=["12-171"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30021,3}) ->
    #mission_box_cfg{
        mission_id=30021,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-464"]},#mission_box_item{chance=100,awards=["9-79"]},#mission_box_item{chance=100,awards=["12-175"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30021,2}) ->
    #mission_box_cfg{
        mission_id=30021,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-466"]},#mission_box_item{chance=100,awards=["9-80"]},#mission_box_item{chance=100,awards=["12-178"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30021,1}) ->
    #mission_box_cfg{
        mission_id=30021,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-468"]},#mission_box_item{chance=100,awards=["9-80"]},#mission_box_item{chance=100,awards=["12-178"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30022,6}) ->
    #mission_box_cfg{
        mission_id=30022,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-439"]},#mission_box_item{chance=100,awards=["9-77"]},#mission_box_item{chance=100,awards=["12-171"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30022,5}) ->
    #mission_box_cfg{
        mission_id=30022,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-441"]},#mission_box_item{chance=100,awards=["9-79"]},#mission_box_item{chance=100,awards=["12-175"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30022,4}) ->
    #mission_box_cfg{
        mission_id=30022,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-443"]},#mission_box_item{chance=100,awards=["9-80"]},#mission_box_item{chance=100,awards=["12-178"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30022,3}) ->
    #mission_box_cfg{
        mission_id=30022,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-444"]},#mission_box_item{chance=100,awards=["9-80"]},#mission_box_item{chance=100,awards=["12-178"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30022,2}) ->
    #mission_box_cfg{
        mission_id=30022,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-445"]},#mission_box_item{chance=100,awards=["9-82"]},#mission_box_item{chance=100,awards=["12-182"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30022,1}) ->
    #mission_box_cfg{
        mission_id=30022,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-446"]},#mission_box_item{chance=100,awards=["9-84"]},#mission_box_item{chance=100,awards=["12-186"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30023,6}) ->
    #mission_box_cfg{
        mission_id=30023,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-419"]},#mission_box_item{chance=100,awards=["9-80"]},#mission_box_item{chance=100,awards=["12-178"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30023,5}) ->
    #mission_box_cfg{
        mission_id=30023,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-420"]},#mission_box_item{chance=100,awards=["9-80"]},#mission_box_item{chance=100,awards=["12-178"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30023,4}) ->
    #mission_box_cfg{
        mission_id=30023,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-421"]},#mission_box_item{chance=100,awards=["9-82"]},#mission_box_item{chance=100,awards=["12-182"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30023,3}) ->
    #mission_box_cfg{
        mission_id=30023,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-422"]},#mission_box_item{chance=100,awards=["9-84"]},#mission_box_item{chance=100,awards=["12-186"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30023,2}) ->
    #mission_box_cfg{
        mission_id=30023,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-422"]},#mission_box_item{chance=100,awards=["9-85"]},#mission_box_item{chance=100,awards=["12-189"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30023,1}) ->
    #mission_box_cfg{
        mission_id=30023,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-422"]},#mission_box_item{chance=100,awards=["9-87"]},#mission_box_item{chance=100,awards=["12-193"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30024,6}) ->
    #mission_box_cfg{
        mission_id=30024,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-397"]},#mission_box_item{chance=100,awards=["9-82"]},#mission_box_item{chance=100,awards=["12-182"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30024,5}) ->
    #mission_box_cfg{
        mission_id=30024,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-397"]},#mission_box_item{chance=100,awards=["9-84"]},#mission_box_item{chance=100,awards=["12-186"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30024,4}) ->
    #mission_box_cfg{
        mission_id=30024,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-397"]},#mission_box_item{chance=100,awards=["9-85"]},#mission_box_item{chance=100,awards=["12-189"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30024,3}) ->
    #mission_box_cfg{
        mission_id=30024,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-397"]},#mission_box_item{chance=100,awards=["9-87"]},#mission_box_item{chance=100,awards=["12-193"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30024,2}) ->
    #mission_box_cfg{
        mission_id=30024,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-397"]},#mission_box_item{chance=100,awards=["9-89"]},#mission_box_item{chance=100,awards=["12-197"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30024,1}) ->
    #mission_box_cfg{
        mission_id=30024,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-396"]},#mission_box_item{chance=100,awards=["9-89"]},#mission_box_item{chance=100,awards=["12-197"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30025,6}) ->
    #mission_box_cfg{
        mission_id=30025,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-372"]},#mission_box_item{chance=100,awards=["9-85"]},#mission_box_item{chance=100,awards=["12-189"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30025,5}) ->
    #mission_box_cfg{
        mission_id=30025,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-371"]},#mission_box_item{chance=100,awards=["9-87"]},#mission_box_item{chance=100,awards=["12-193"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30025,4}) ->
    #mission_box_cfg{
        mission_id=30025,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-371"]},#mission_box_item{chance=100,awards=["9-89"]},#mission_box_item{chance=100,awards=["12-197"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30025,3}) ->
    #mission_box_cfg{
        mission_id=30025,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-370"]},#mission_box_item{chance=100,awards=["9-89"]},#mission_box_item{chance=100,awards=["12-197"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30025,2}) ->
    #mission_box_cfg{
        mission_id=30025,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-369"]},#mission_box_item{chance=100,awards=["9-90"]},#mission_box_item{chance=100,awards=["12-200"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30025,1}) ->
    #mission_box_cfg{
        mission_id=30025,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-367"]},#mission_box_item{chance=100,awards=["9-92"]},#mission_box_item{chance=100,awards=["12-204"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30026,6}) ->
    #mission_box_cfg{
        mission_id=30026,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-345"]},#mission_box_item{chance=100,awards=["9-89"]},#mission_box_item{chance=100,awards=["12-197"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30026,5}) ->
    #mission_box_cfg{
        mission_id=30026,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-343"]},#mission_box_item{chance=100,awards=["9-89"]},#mission_box_item{chance=100,awards=["12-197"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30026,4}) ->
    #mission_box_cfg{
        mission_id=30026,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-342"]},#mission_box_item{chance=100,awards=["9-90"]},#mission_box_item{chance=100,awards=["12-200"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30026,3}) ->
    #mission_box_cfg{
        mission_id=30026,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-340"]},#mission_box_item{chance=100,awards=["9-92"]},#mission_box_item{chance=100,awards=["12-204"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30026,2}) ->
    #mission_box_cfg{
        mission_id=30026,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-338"]},#mission_box_item{chance=100,awards=["9-94"]},#mission_box_item{chance=100,awards=["12-208"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30026,1}) ->
    #mission_box_cfg{
        mission_id=30026,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-336"]},#mission_box_item{chance=100,awards=["9-95"]},#mission_box_item{chance=100,awards=["12-211"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30027,6}) ->
    #mission_box_cfg{
        mission_id=30027,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-315"]},#mission_box_item{chance=100,awards=["9-90"]},#mission_box_item{chance=100,awards=["12-200"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30027,5}) ->
    #mission_box_cfg{
        mission_id=30027,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-313"]},#mission_box_item{chance=100,awards=["9-92"]},#mission_box_item{chance=100,awards=["12-204"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30027,4}) ->
    #mission_box_cfg{
        mission_id=30027,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-311"]},#mission_box_item{chance=100,awards=["9-94"]},#mission_box_item{chance=100,awards=["12-208"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30027,3}) ->
    #mission_box_cfg{
        mission_id=30027,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-308"]},#mission_box_item{chance=100,awards=["9-95"]},#mission_box_item{chance=100,awards=["12-211"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30027,2}) ->
    #mission_box_cfg{
        mission_id=30027,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-320"]},#mission_box_item{chance=100,awards=["9-97"]},#mission_box_item{chance=100,awards=["12-215"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30027,1}) ->
    #mission_box_cfg{
        mission_id=30027,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-331"]},#mission_box_item{chance=100,awards=["9-97"]},#mission_box_item{chance=100,awards=["12-215"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30028,6}) ->
    #mission_box_cfg{
        mission_id=30028,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-324"]},#mission_box_item{chance=100,awards=["9-94"]},#mission_box_item{chance=100,awards=["12-208"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30028,5}) ->
    #mission_box_cfg{
        mission_id=30028,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-336"]},#mission_box_item{chance=100,awards=["9-95"]},#mission_box_item{chance=100,awards=["12-211"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30028,4}) ->
    #mission_box_cfg{
        mission_id=30028,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-348"]},#mission_box_item{chance=100,awards=["9-97"]},#mission_box_item{chance=100,awards=["12-215"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30028,3}) ->
    #mission_box_cfg{
        mission_id=30028,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-360"]},#mission_box_item{chance=100,awards=["9-97"]},#mission_box_item{chance=100,awards=["12-215"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30028,2}) ->
    #mission_box_cfg{
        mission_id=30028,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-372"]},#mission_box_item{chance=100,awards=["9-99"]},#mission_box_item{chance=100,awards=["12-219"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30028,1}) ->
    #mission_box_cfg{
        mission_id=30028,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-385"]},#mission_box_item{chance=100,awards=["9-100"]},#mission_box_item{chance=100,awards=["12-222"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30029,6}) ->
    #mission_box_cfg{
        mission_id=30029,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-376"]},#mission_box_item{chance=100,awards=["9-97"]},#mission_box_item{chance=100,awards=["12-215"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30029,5}) ->
    #mission_box_cfg{
        mission_id=30029,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-389"]},#mission_box_item{chance=100,awards=["9-97"]},#mission_box_item{chance=100,awards=["12-215"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30029,4}) ->
    #mission_box_cfg{
        mission_id=30029,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-402"]},#mission_box_item{chance=100,awards=["9-99"]},#mission_box_item{chance=100,awards=["12-219"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30029,3}) ->
    #mission_box_cfg{
        mission_id=30029,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-414"]},#mission_box_item{chance=100,awards=["9-100"]},#mission_box_item{chance=100,awards=["12-222"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30029,2}) ->
    #mission_box_cfg{
        mission_id=30029,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-428"]},#mission_box_item{chance=100,awards=["9-102"]},#mission_box_item{chance=100,awards=["12-226"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30029,1}) ->
    #mission_box_cfg{
        mission_id=30029,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-441"]},#mission_box_item{chance=100,awards=["9-103"]},#mission_box_item{chance=100,awards=["12-229"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30030,6}) ->
    #mission_box_cfg{
        mission_id=30030,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-431"]},#mission_box_item{chance=100,awards=["9-99"]},#mission_box_item{chance=100,awards=["12-219"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30030,5}) ->
    #mission_box_cfg{
        mission_id=30030,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-444"]},#mission_box_item{chance=100,awards=["9-100"]},#mission_box_item{chance=100,awards=["12-222"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30030,4}) ->
    #mission_box_cfg{
        mission_id=30030,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-458"]},#mission_box_item{chance=100,awards=["9-102"]},#mission_box_item{chance=100,awards=["12-226"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30030,3}) ->
    #mission_box_cfg{
        mission_id=30030,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-471"]},#mission_box_item{chance=100,awards=["9-103"]},#mission_box_item{chance=100,awards=["12-229"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30030,2}) ->
    #mission_box_cfg{
        mission_id=30030,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-485"]},#mission_box_item{chance=100,awards=["9-105"]},#mission_box_item{chance=100,awards=["12-233"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30030,1}) ->
    #mission_box_cfg{
        mission_id=30030,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-499"]},#mission_box_item{chance=100,awards=["9-105"]},#mission_box_item{chance=100,awards=["12-233"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30031,6}) ->
    #mission_box_cfg{
        mission_id=30031,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-488"]},#mission_box_item{chance=100,awards=["9-102"]},#mission_box_item{chance=100,awards=["12-226"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30031,5}) ->
    #mission_box_cfg{
        mission_id=30031,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-502"]},#mission_box_item{chance=100,awards=["9-103"]},#mission_box_item{chance=100,awards=["12-229"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30031,4}) ->
    #mission_box_cfg{
        mission_id=30031,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-516"]},#mission_box_item{chance=100,awards=["9-105"]},#mission_box_item{chance=100,awards=["12-233"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30031,3}) ->
    #mission_box_cfg{
        mission_id=30031,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-530"]},#mission_box_item{chance=100,awards=["9-105"]},#mission_box_item{chance=100,awards=["12-233"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30031,2}) ->
    #mission_box_cfg{
        mission_id=30031,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-545"]},#mission_box_item{chance=100,awards=["9-107"]},#mission_box_item{chance=100,awards=["12-237"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30031,1}) ->
    #mission_box_cfg{
        mission_id=30031,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-560"]},#mission_box_item{chance=100,awards=["9-108"]},#mission_box_item{chance=100,awards=["12-240"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30032,6}) ->
    #mission_box_cfg{
        mission_id=30032,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-547"]},#mission_box_item{chance=100,awards=["9-105"]},#mission_box_item{chance=100,awards=["12-233"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30032,5}) ->
    #mission_box_cfg{
        mission_id=30032,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-562"]},#mission_box_item{chance=100,awards=["9-105"]},#mission_box_item{chance=100,awards=["12-233"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30032,4}) ->
    #mission_box_cfg{
        mission_id=30032,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-577"]},#mission_box_item{chance=100,awards=["9-107"]},#mission_box_item{chance=100,awards=["12-237"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30032,3}) ->
    #mission_box_cfg{
        mission_id=30032,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-592"]},#mission_box_item{chance=100,awards=["9-108"]},#mission_box_item{chance=100,awards=["12-240"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30032,2}) ->
    #mission_box_cfg{
        mission_id=30032,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-608"]},#mission_box_item{chance=100,awards=["9-110"]},#mission_box_item{chance=100,awards=["12-244"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30032,1}) ->
    #mission_box_cfg{
        mission_id=30032,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-623"]},#mission_box_item{chance=100,awards=["9-112"]},#mission_box_item{chance=100,awards=["12-248"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30033,6}) ->
    #mission_box_cfg{
        mission_id=30033,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-608"]},#mission_box_item{chance=100,awards=["9-107"]},#mission_box_item{chance=100,awards=["12-237"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30033,5}) ->
    #mission_box_cfg{
        mission_id=30033,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-624"]},#mission_box_item{chance=100,awards=["9-108"]},#mission_box_item{chance=100,awards=["12-240"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30033,4}) ->
    #mission_box_cfg{
        mission_id=30033,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-640"]},#mission_box_item{chance=100,awards=["9-110"]},#mission_box_item{chance=100,awards=["12-244"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30033,3}) ->
    #mission_box_cfg{
        mission_id=30033,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-656"]},#mission_box_item{chance=100,awards=["9-112"]},#mission_box_item{chance=100,awards=["12-248"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30033,2}) ->
    #mission_box_cfg{
        mission_id=30033,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-672"]},#mission_box_item{chance=100,awards=["9-113"]},#mission_box_item{chance=100,awards=["12-251"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30033,1}) ->
    #mission_box_cfg{
        mission_id=30033,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-689"]},#mission_box_item{chance=100,awards=["9-113"]},#mission_box_item{chance=100,awards=["12-251"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30034,6}) ->
    #mission_box_cfg{
        mission_id=30034,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-672"]},#mission_box_item{chance=100,awards=["9-110"]},#mission_box_item{chance=100,awards=["12-244"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30034,5}) ->
    #mission_box_cfg{
        mission_id=30034,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-689"]},#mission_box_item{chance=100,awards=["9-112"]},#mission_box_item{chance=100,awards=["12-248"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30034,4}) ->
    #mission_box_cfg{
        mission_id=30034,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-706"]},#mission_box_item{chance=100,awards=["9-113"]},#mission_box_item{chance=100,awards=["12-251"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30034,3}) ->
    #mission_box_cfg{
        mission_id=30034,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-722"]},#mission_box_item{chance=100,awards=["9-113"]},#mission_box_item{chance=100,awards=["12-251"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30034,2}) ->
    #mission_box_cfg{
        mission_id=30034,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-723"]},#mission_box_item{chance=100,awards=["9-115"]},#mission_box_item{chance=100,awards=["12-255"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30034,1}) ->
    #mission_box_cfg{
        mission_id=30034,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-722"]},#mission_box_item{chance=100,awards=["9-117"]},#mission_box_item{chance=100,awards=["12-259"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30035,6}) ->
    #mission_box_cfg{
        mission_id=30035,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-689"]},#mission_box_item{chance=100,awards=["9-113"]},#mission_box_item{chance=100,awards=["12-251"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30035,5}) ->
    #mission_box_cfg{
        mission_id=30035,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-689"]},#mission_box_item{chance=100,awards=["9-113"]},#mission_box_item{chance=100,awards=["12-251"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30035,4}) ->
    #mission_box_cfg{
        mission_id=30035,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-689"]},#mission_box_item{chance=100,awards=["9-115"]},#mission_box_item{chance=100,awards=["12-255"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30035,3}) ->
    #mission_box_cfg{
        mission_id=30035,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-688"]},#mission_box_item{chance=100,awards=["9-117"]},#mission_box_item{chance=100,awards=["12-259"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30035,2}) ->
    #mission_box_cfg{
        mission_id=30035,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-687"]},#mission_box_item{chance=100,awards=["9-118"]},#mission_box_item{chance=100,awards=["12-262"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30035,1}) ->
    #mission_box_cfg{
        mission_id=30035,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-686"]},#mission_box_item{chance=100,awards=["9-120"]},#mission_box_item{chance=100,awards=["12-266"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30036,6}) ->
    #mission_box_cfg{
        mission_id=30036,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-655"]},#mission_box_item{chance=100,awards=["9-115"]},#mission_box_item{chance=100,awards=["12-255"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30036,5}) ->
    #mission_box_cfg{
        mission_id=30036,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-654"]},#mission_box_item{chance=100,awards=["9-117"]},#mission_box_item{chance=100,awards=["12-259"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30036,4}) ->
    #mission_box_cfg{
        mission_id=30036,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-653"]},#mission_box_item{chance=100,awards=["9-118"]},#mission_box_item{chance=100,awards=["12-262"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30036,3}) ->
    #mission_box_cfg{
        mission_id=30036,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-651"]},#mission_box_item{chance=100,awards=["9-120"]},#mission_box_item{chance=100,awards=["12-266"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30036,2}) ->
    #mission_box_cfg{
        mission_id=30036,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-650"]},#mission_box_item{chance=100,awards=["9-122"]},#mission_box_item{chance=100,awards=["12-270"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30036,1}) ->
    #mission_box_cfg{
        mission_id=30036,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-648"]},#mission_box_item{chance=100,awards=["9-122"]},#mission_box_item{chance=100,awards=["12-270"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30037,6}) ->
    #mission_box_cfg{
        mission_id=30037,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-618"]},#mission_box_item{chance=100,awards=["9-118"]},#mission_box_item{chance=100,awards=["12-262"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30037,5}) ->
    #mission_box_cfg{
        mission_id=30037,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-616"]},#mission_box_item{chance=100,awards=["9-120"]},#mission_box_item{chance=100,awards=["12-266"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30037,4}) ->
    #mission_box_cfg{
        mission_id=30037,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-614"]},#mission_box_item{chance=100,awards=["9-122"]},#mission_box_item{chance=100,awards=["12-270"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30037,3}) ->
    #mission_box_cfg{
        mission_id=30037,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-612"]},#mission_box_item{chance=100,awards=["9-122"]},#mission_box_item{chance=100,awards=["12-270"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30037,2}) ->
    #mission_box_cfg{
        mission_id=30037,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-610"]},#mission_box_item{chance=100,awards=["9-123"]},#mission_box_item{chance=100,awards=["12-273"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30037,1}) ->
    #mission_box_cfg{
        mission_id=30037,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-607"]},#mission_box_item{chance=100,awards=["9-125"]},#mission_box_item{chance=100,awards=["12-277"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30038,6}) ->
    #mission_box_cfg{
        mission_id=30038,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-579"]},#mission_box_item{chance=100,awards=["9-122"]},#mission_box_item{chance=100,awards=["12-270"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30038,5}) ->
    #mission_box_cfg{
        mission_id=30038,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-576"]},#mission_box_item{chance=100,awards=["9-122"]},#mission_box_item{chance=100,awards=["12-270"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30038,4}) ->
    #mission_box_cfg{
        mission_id=30038,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-573"]},#mission_box_item{chance=100,awards=["9-123"]},#mission_box_item{chance=100,awards=["12-273"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30038,3}) ->
    #mission_box_cfg{
        mission_id=30038,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-570"]},#mission_box_item{chance=100,awards=["9-125"]},#mission_box_item{chance=100,awards=["12-277"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30038,2}) ->
    #mission_box_cfg{
        mission_id=30038,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-567"]},#mission_box_item{chance=100,awards=["9-127"]},#mission_box_item{chance=100,awards=["12-281"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30038,1}) ->
    #mission_box_cfg{
        mission_id=30038,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-564"]},#mission_box_item{chance=100,awards=["9-128"]},#mission_box_item{chance=100,awards=["12-284"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30039,6}) ->
    #mission_box_cfg{
        mission_id=30039,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-537"]},#mission_box_item{chance=100,awards=["9-123"]},#mission_box_item{chance=100,awards=["12-273"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30039,5}) ->
    #mission_box_cfg{
        mission_id=30039,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-534"]},#mission_box_item{chance=100,awards=["9-125"]},#mission_box_item{chance=100,awards=["12-277"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30039,4}) ->
    #mission_box_cfg{
        mission_id=30039,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-530"]},#mission_box_item{chance=100,awards=["9-127"]},#mission_box_item{chance=100,awards=["12-281"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30039,3}) ->
    #mission_box_cfg{
        mission_id=30039,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-526"]},#mission_box_item{chance=100,awards=["9-128"]},#mission_box_item{chance=100,awards=["12-284"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30039,2}) ->
    #mission_box_cfg{
        mission_id=30039,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-523"]},#mission_box_item{chance=100,awards=["9-130"]},#mission_box_item{chance=100,awards=["12-288"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30039,1}) ->
    #mission_box_cfg{
        mission_id=30039,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-518"]},#mission_box_item{chance=100,awards=["9-130"]},#mission_box_item{chance=100,awards=["12-288"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30040,6}) ->
    #mission_box_cfg{
        mission_id=30040,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-493"]},#mission_box_item{chance=100,awards=["9-127"]},#mission_box_item{chance=100,awards=["12-281"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30040,5}) ->
    #mission_box_cfg{
        mission_id=30040,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-489"]},#mission_box_item{chance=100,awards=["9-128"]},#mission_box_item{chance=100,awards=["12-284"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30040,4}) ->
    #mission_box_cfg{
        mission_id=30040,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-485"]},#mission_box_item{chance=100,awards=["9-130"]},#mission_box_item{chance=100,awards=["12-288"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30040,3}) ->
    #mission_box_cfg{
        mission_id=30040,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-480"]},#mission_box_item{chance=100,awards=["9-130"]},#mission_box_item{chance=100,awards=["12-288"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30040,2}) ->
    #mission_box_cfg{
        mission_id=30040,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-475"]},#mission_box_item{chance=100,awards=["9-132"]},#mission_box_item{chance=100,awards=["12-292"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30040,1}) ->
    #mission_box_cfg{
        mission_id=30040,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-470"]},#mission_box_item{chance=100,awards=["9-133"]},#mission_box_item{chance=100,awards=["12-295"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30041,6}) ->
    #mission_box_cfg{
        mission_id=30041,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-447"]},#mission_box_item{chance=100,awards=["9-130"]},#mission_box_item{chance=100,awards=["12-288"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30041,5}) ->
    #mission_box_cfg{
        mission_id=30041,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-442"]},#mission_box_item{chance=100,awards=["9-130"]},#mission_box_item{chance=100,awards=["12-288"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30041,4}) ->
    #mission_box_cfg{
        mission_id=30041,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-437"]},#mission_box_item{chance=100,awards=["9-132"]},#mission_box_item{chance=100,awards=["12-292"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30041,3}) ->
    #mission_box_cfg{
        mission_id=30041,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-431"]},#mission_box_item{chance=100,awards=["9-133"]},#mission_box_item{chance=100,awards=["12-295"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30041,2}) ->
    #mission_box_cfg{
        mission_id=30041,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-426"]},#mission_box_item{chance=100,awards=["9-135"]},#mission_box_item{chance=100,awards=["12-299"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30041,1}) ->
    #mission_box_cfg{
        mission_id=30041,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-420"]},#mission_box_item{chance=100,awards=["9-136"]},#mission_box_item{chance=100,awards=["12-302"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30042,6}) ->
    #mission_box_cfg{
        mission_id=30042,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-417"]},#mission_box_item{chance=100,awards=["9-132"]},#mission_box_item{chance=100,awards=["12-292"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30042,5}) ->
    #mission_box_cfg{
        mission_id=30042,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-431"]},#mission_box_item{chance=101,awards=["9-133"]},#mission_box_item{chance=100,awards=["12-295"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30042,4}) ->
    #mission_box_cfg{
        mission_id=30042,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-446"]},#mission_box_item{chance=102,awards=["9-135"]},#mission_box_item{chance=100,awards=["12-299"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30042,3}) ->
    #mission_box_cfg{
        mission_id=30042,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-460"]},#mission_box_item{chance=103,awards=["9-136"]},#mission_box_item{chance=100,awards=["12-302"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30042,2}) ->
    #mission_box_cfg{
        mission_id=30042,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-475"]},#mission_box_item{chance=104,awards=["9-138"]},#mission_box_item{chance=100,awards=["12-306"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30042,1}) ->
    #mission_box_cfg{
        mission_id=30042,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-490"]},#mission_box_item{chance=105,awards=["9-138"]},#mission_box_item{chance=100,awards=["12-306"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30043,6}) ->
    #mission_box_cfg{
        mission_id=30043,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-485"]},#mission_box_item{chance=100,awards=["9-135"]},#mission_box_item{chance=100,awards=["12-299"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30043,5}) ->
    #mission_box_cfg{
        mission_id=30043,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-500"]},#mission_box_item{chance=101,awards=["9-136"]},#mission_box_item{chance=100,awards=["12-302"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30043,4}) ->
    #mission_box_cfg{
        mission_id=30043,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-515"]},#mission_box_item{chance=102,awards=["9-138"]},#mission_box_item{chance=100,awards=["12-306"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30043,3}) ->
    #mission_box_cfg{
        mission_id=30043,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-530"]},#mission_box_item{chance=103,awards=["9-138"]},#mission_box_item{chance=100,awards=["12-306"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30043,2}) ->
    #mission_box_cfg{
        mission_id=30043,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-546"]},#mission_box_item{chance=104,awards=["9-140"]},#mission_box_item{chance=100,awards=["12-310"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30043,1}) ->
    #mission_box_cfg{
        mission_id=30043,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-562"]},#mission_box_item{chance=105,awards=["9-141"]},#mission_box_item{chance=100,awards=["12-313"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30044,6}) ->
    #mission_box_cfg{
        mission_id=30044,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-556"]},#mission_box_item{chance=100,awards=["9-138"]},#mission_box_item{chance=100,awards=["12-306"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30044,5}) ->
    #mission_box_cfg{
        mission_id=30044,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-571"]},#mission_box_item{chance=101,awards=["9-138"]},#mission_box_item{chance=100,awards=["12-306"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30044,4}) ->
    #mission_box_cfg{
        mission_id=30044,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-587"]},#mission_box_item{chance=102,awards=["9-140"]},#mission_box_item{chance=100,awards=["12-310"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30044,3}) ->
    #mission_box_cfg{
        mission_id=30044,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-603"]},#mission_box_item{chance=103,awards=["9-141"]},#mission_box_item{chance=100,awards=["12-313"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30044,2}) ->
    #mission_box_cfg{
        mission_id=30044,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-620"]},#mission_box_item{chance=104,awards=["9-143"]},#mission_box_item{chance=100,awards=["12-317"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30044,1}) ->
    #mission_box_cfg{
        mission_id=30044,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-636"]},#mission_box_item{chance=105,awards=["9-145"]},#mission_box_item{chance=100,awards=["12-321"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30045,6}) ->
    #mission_box_cfg{
        mission_id=30045,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-628"]},#mission_box_item{chance=100,awards=["9-140"]},#mission_box_item{chance=100,awards=["12-310"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30045,5}) ->
    #mission_box_cfg{
        mission_id=30045,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-645"]},#mission_box_item{chance=100,awards=["9-141"]},#mission_box_item{chance=100,awards=["12-313"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30045,4}) ->
    #mission_box_cfg{
        mission_id=30045,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-662"]},#mission_box_item{chance=100,awards=["9-143"]},#mission_box_item{chance=100,awards=["12-317"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30045,3}) ->
    #mission_box_cfg{
        mission_id=30045,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-678"]},#mission_box_item{chance=100,awards=["9-145"]},#mission_box_item{chance=100,awards=["12-321"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30045,2}) ->
    #mission_box_cfg{
        mission_id=30045,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-696"]},#mission_box_item{chance=100,awards=["9-146"]},#mission_box_item{chance=100,awards=["12-324"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30045,1}) ->
    #mission_box_cfg{
        mission_id=30045,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-713"]},#mission_box_item{chance=100,awards=["9-146"]},#mission_box_item{chance=100,awards=["12-324"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30046,6}) ->
    #mission_box_cfg{
        mission_id=30046,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-704"]},#mission_box_item{chance=100,awards=["9-143"]},#mission_box_item{chance=100,awards=["12-317"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30046,5}) ->
    #mission_box_cfg{
        mission_id=30046,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-721"]},#mission_box_item{chance=100,awards=["9-145"]},#mission_box_item{chance=100,awards=["12-321"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30046,4}) ->
    #mission_box_cfg{
        mission_id=30046,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-738"]},#mission_box_item{chance=100,awards=["9-146"]},#mission_box_item{chance=100,awards=["12-324"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30046,3}) ->
    #mission_box_cfg{
        mission_id=30046,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-756"]},#mission_box_item{chance=100,awards=["9-146"]},#mission_box_item{chance=100,awards=["12-324"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30046,2}) ->
    #mission_box_cfg{
        mission_id=30046,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-774"]},#mission_box_item{chance=100,awards=["9-148"]},#mission_box_item{chance=100,awards=["12-328"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30046,1}) ->
    #mission_box_cfg{
        mission_id=30046,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-792"]},#mission_box_item{chance=100,awards=["9-150"]},#mission_box_item{chance=100,awards=["12-332"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30047,6}) ->
    #mission_box_cfg{
        mission_id=30047,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-781"]},#mission_box_item{chance=100,awards=["9-146"]},#mission_box_item{chance=100,awards=["12-324"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30047,5}) ->
    #mission_box_cfg{
        mission_id=30047,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-799"]},#mission_box_item{chance=100,awards=["9-146"]},#mission_box_item{chance=100,awards=["12-324"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30047,4}) ->
    #mission_box_cfg{
        mission_id=30047,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-818"]},#mission_box_item{chance=100,awards=["9-148"]},#mission_box_item{chance=100,awards=["12-328"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30047,3}) ->
    #mission_box_cfg{
        mission_id=30047,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-836"]},#mission_box_item{chance=100,awards=["9-150"]},#mission_box_item{chance=100,awards=["12-332"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30047,2}) ->
    #mission_box_cfg{
        mission_id=30047,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-855"]},#mission_box_item{chance=100,awards=["9-151"]},#mission_box_item{chance=100,awards=["12-335"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30047,1}) ->
    #mission_box_cfg{
        mission_id=30047,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-874"]},#mission_box_item{chance=100,awards=["9-153"]},#mission_box_item{chance=100,awards=["12-339"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30048,6}) ->
    #mission_box_cfg{
        mission_id=30048,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-861"]},#mission_box_item{chance=100,awards=["9-148"]},#mission_box_item{chance=100,awards=["12-328"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30048,5}) ->
    #mission_box_cfg{
        mission_id=30048,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-880"]},#mission_box_item{chance=100,awards=["9-150"]},#mission_box_item{chance=100,awards=["12-332"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30048,4}) ->
    #mission_box_cfg{
        mission_id=30048,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-899"]},#mission_box_item{chance=100,awards=["9-151"]},#mission_box_item{chance=100,awards=["12-335"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30048,3}) ->
    #mission_box_cfg{
        mission_id=30048,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-918"]},#mission_box_item{chance=100,awards=["9-153"]},#mission_box_item{chance=100,awards=["12-339"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30048,2}) ->
    #mission_box_cfg{
        mission_id=30048,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-938"]},#mission_box_item{chance=100,awards=["9-155"]},#mission_box_item{chance=100,awards=["12-343"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30048,1}) ->
    #mission_box_cfg{
        mission_id=30048,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-958"]},#mission_box_item{chance=100,awards=["9-155"]},#mission_box_item{chance=100,awards=["12-343"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30049,6}) ->
    #mission_box_cfg{
        mission_id=30049,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-944"]},#mission_box_item{chance=100,awards=["9-151"]},#mission_box_item{chance=100,awards=["12-335"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30049,5}) ->
    #mission_box_cfg{
        mission_id=30049,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-963"]},#mission_box_item{chance=100,awards=["9-153"]},#mission_box_item{chance=100,awards=["12-339"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30049,4}) ->
    #mission_box_cfg{
        mission_id=30049,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-961"]},#mission_box_item{chance=100,awards=["9-155"]},#mission_box_item{chance=100,awards=["12-343"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30049,3}) ->
    #mission_box_cfg{
        mission_id=30049,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-958"]},#mission_box_item{chance=100,awards=["9-155"]},#mission_box_item{chance=100,awards=["12-343"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30049,2}) ->
    #mission_box_cfg{
        mission_id=30049,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-955"]},#mission_box_item{chance=100,awards=["9-156"]},#mission_box_item{chance=100,awards=["12-346"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30049,1}) ->
    #mission_box_cfg{
        mission_id=30049,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-951"]},#mission_box_item{chance=100,awards=["9-158"]},#mission_box_item{chance=100,awards=["12-350"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30050,6}) ->
    #mission_box_cfg{
        mission_id=30050,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-915"]},#mission_box_item{chance=100,awards=["9-155"]},#mission_box_item{chance=100,awards=["12-343"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30050,5}) ->
    #mission_box_cfg{
        mission_id=30050,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-912"]},#mission_box_item{chance=100,awards=["9-155"]},#mission_box_item{chance=100,awards=["12-343"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30050,4}) ->
    #mission_box_cfg{
        mission_id=30050,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-909"]},#mission_box_item{chance=100,awards=["9-156"]},#mission_box_item{chance=100,awards=["12-346"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30050,3}) ->
    #mission_box_cfg{
        mission_id=30050,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-905"]},#mission_box_item{chance=100,awards=["9-158"]},#mission_box_item{chance=100,awards=["12-350"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30050,2}) ->
    #mission_box_cfg{
        mission_id=30050,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-901"]},#mission_box_item{chance=100,awards=["9-160"]},#mission_box_item{chance=100,awards=["12-354"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30050,1}) ->
    #mission_box_cfg{
        mission_id=30050,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-897"]},#mission_box_item{chance=100,awards=["9-161"]},#mission_box_item{chance=100,awards=["12-357"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30051,6}) ->
    #mission_box_cfg{
        mission_id=30051,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-863"]},#mission_box_item{chance=100,awards=["9-156"]},#mission_box_item{chance=100,awards=["12-346"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30051,5}) ->
    #mission_box_cfg{
        mission_id=30051,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-858"]},#mission_box_item{chance=100,awards=["9-158"]},#mission_box_item{chance=100,awards=["12-350"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30051,4}) ->
    #mission_box_cfg{
        mission_id=30051,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-854"]},#mission_box_item{chance=100,awards=["9-160"]},#mission_box_item{chance=100,awards=["12-354"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30051,3}) ->
    #mission_box_cfg{
        mission_id=30051,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-850"]},#mission_box_item{chance=100,awards=["9-161"]},#mission_box_item{chance=100,awards=["12-357"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30051,2}) ->
    #mission_box_cfg{
        mission_id=30051,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-845"]},#mission_box_item{chance=100,awards=["9-161"]},#mission_box_item{chance=100,awards=["12-357"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30051,1}) ->
    #mission_box_cfg{
        mission_id=30051,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-840"]},#mission_box_item{chance=100,awards=["9-163"]},#mission_box_item{chance=100,awards=["12-361"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30052,6}) ->
    #mission_box_cfg{
        mission_id=30052,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-807"]},#mission_box_item{chance=100,awards=["9-160"]},#mission_box_item{chance=100,awards=["12-354"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30052,5}) ->
    #mission_box_cfg{
        mission_id=30052,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-802"]},#mission_box_item{chance=100,awards=["9-161"]},#mission_box_item{chance=100,awards=["12-357"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30052,4}) ->
    #mission_box_cfg{
        mission_id=30052,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-797"]},#mission_box_item{chance=100,awards=["9-161"]},#mission_box_item{chance=100,awards=["12-357"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30052,3}) ->
    #mission_box_cfg{
        mission_id=30052,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-792"]},#mission_box_item{chance=100,awards=["9-163"]},#mission_box_item{chance=100,awards=["12-361"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30052,2}) ->
    #mission_box_cfg{
        mission_id=30052,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-787"]},#mission_box_item{chance=100,awards=["9-165"]},#mission_box_item{chance=100,awards=["12-365"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30052,1}) ->
    #mission_box_cfg{
        mission_id=30052,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-781"]},#mission_box_item{chance=100,awards=["9-166"]},#mission_box_item{chance=100,awards=["12-368"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30053,6}) ->
    #mission_box_cfg{
        mission_id=30053,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-750"]},#mission_box_item{chance=100,awards=["9-161"]},#mission_box_item{chance=100,awards=["12-357"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30053,5}) ->
    #mission_box_cfg{
        mission_id=30053,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-744"]},#mission_box_item{chance=100,awards=["9-163"]},#mission_box_item{chance=100,awards=["12-361"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30053,4}) ->
    #mission_box_cfg{
        mission_id=30053,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-738"]},#mission_box_item{chance=100,awards=["9-165"]},#mission_box_item{chance=100,awards=["12-365"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30053,3}) ->
    #mission_box_cfg{
        mission_id=30053,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-732"]},#mission_box_item{chance=100,awards=["9-166"]},#mission_box_item{chance=100,awards=["12-368"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30053,2}) ->
    #mission_box_cfg{
        mission_id=30053,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-726"]},#mission_box_item{chance=100,awards=["9-168"]},#mission_box_item{chance=100,awards=["12-372"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30053,1}) ->
    #mission_box_cfg{
        mission_id=30053,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-719"]},#mission_box_item{chance=100,awards=["9-169"]},#mission_box_item{chance=100,awards=["12-375"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30054,6}) ->
    #mission_box_cfg{
        mission_id=30054,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-690"]},#mission_box_item{chance=100,awards=["9-165"]},#mission_box_item{chance=100,awards=["12-365"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30054,5}) ->
    #mission_box_cfg{
        mission_id=30054,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-683"]},#mission_box_item{chance=100,awards=["9-166"]},#mission_box_item{chance=100,awards=["12-368"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30054,4}) ->
    #mission_box_cfg{
        mission_id=30054,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-677"]},#mission_box_item{chance=100,awards=["9-168"]},#mission_box_item{chance=100,awards=["12-372"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30054,3}) ->
    #mission_box_cfg{
        mission_id=30054,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-670"]},#mission_box_item{chance=100,awards=["9-169"]},#mission_box_item{chance=100,awards=["12-375"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30054,2}) ->
    #mission_box_cfg{
        mission_id=30054,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-663"]},#mission_box_item{chance=100,awards=["9-171"]},#mission_box_item{chance=100,awards=["12-379"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30054,1}) ->
    #mission_box_cfg{
        mission_id=30054,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-655"]},#mission_box_item{chance=100,awards=["9-171"]},#mission_box_item{chance=100,awards=["12-379"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30055,6}) ->
    #mission_box_cfg{
        mission_id=30055,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-627"]},#mission_box_item{chance=100,awards=["9-168"]},#mission_box_item{chance=100,awards=["12-372"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30055,5}) ->
    #mission_box_cfg{
        mission_id=30055,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-620"]},#mission_box_item{chance=100,awards=["9-169"]},#mission_box_item{chance=100,awards=["12-375"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30055,4}) ->
    #mission_box_cfg{
        mission_id=30055,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-613"]},#mission_box_item{chance=100,awards=["9-171"]},#mission_box_item{chance=100,awards=["12-379"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30055,3}) ->
    #mission_box_cfg{
        mission_id=30055,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-605"]},#mission_box_item{chance=100,awards=["9-171"]},#mission_box_item{chance=100,awards=["12-379"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30055,2}) ->
    #mission_box_cfg{
        mission_id=30055,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-597"]},#mission_box_item{chance=100,awards=["9-173"]},#mission_box_item{chance=100,awards=["12-383"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30055,1}) ->
    #mission_box_cfg{
        mission_id=30055,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-589"]},#mission_box_item{chance=100,awards=["9-174"]},#mission_box_item{chance=100,awards=["12-386"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30056,6}) ->
    #mission_box_cfg{
        mission_id=30056,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-563"]},#mission_box_item{chance=100,awards=["9-171"]},#mission_box_item{chance=100,awards=["12-379"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30056,5}) ->
    #mission_box_cfg{
        mission_id=30056,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-554"]},#mission_box_item{chance=100,awards=["9-171"]},#mission_box_item{chance=100,awards=["12-379"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30056,4}) ->
    #mission_box_cfg{
        mission_id=30056,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-546"]},#mission_box_item{chance=100,awards=["9-173"]},#mission_box_item{chance=100,awards=["12-383"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30056,3}) ->
    #mission_box_cfg{
        mission_id=30056,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-563"]},#mission_box_item{chance=100,awards=["9-174"]},#mission_box_item{chance=100,awards=["12-386"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30056,2}) ->
    #mission_box_cfg{
        mission_id=30056,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-581"]},#mission_box_item{chance=100,awards=["9-176"]},#mission_box_item{chance=100,awards=["12-390"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30056,1}) ->
    #mission_box_cfg{
        mission_id=30056,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-598"]},#mission_box_item{chance=100,awards=["9-178"]},#mission_box_item{chance=100,awards=["12-394"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30057,6}) ->
    #mission_box_cfg{
        mission_id=30057,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-597"]},#mission_box_item{chance=100,awards=["9-173"]},#mission_box_item{chance=100,awards=["12-383"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30057,5}) ->
    #mission_box_cfg{
        mission_id=30057,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-614"]},#mission_box_item{chance=100,awards=["9-174"]},#mission_box_item{chance=100,awards=["12-386"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30057,4}) ->
    #mission_box_cfg{
        mission_id=30057,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-632"]},#mission_box_item{chance=100,awards=["9-176"]},#mission_box_item{chance=100,awards=["12-390"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30057,3}) ->
    #mission_box_cfg{
        mission_id=30057,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-650"]},#mission_box_item{chance=100,awards=["9-178"]},#mission_box_item{chance=100,awards=["12-394"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30057,2}) ->
    #mission_box_cfg{
        mission_id=30057,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-668"]},#mission_box_item{chance=100,awards=["9-178"]},#mission_box_item{chance=100,awards=["12-394"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30057,1}) ->
    #mission_box_cfg{
        mission_id=30057,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-686"]},#mission_box_item{chance=100,awards=["9-179"]},#mission_box_item{chance=100,awards=["12-397"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30058,6}) ->
    #mission_box_cfg{
        mission_id=30058,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-684"]},#mission_box_item{chance=100,awards=["9-176"]},#mission_box_item{chance=100,awards=["12-390"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30058,5}) ->
    #mission_box_cfg{
        mission_id=30058,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-702"]},#mission_box_item{chance=100,awards=["9-178"]},#mission_box_item{chance=100,awards=["12-394"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30058,4}) ->
    #mission_box_cfg{
        mission_id=30058,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-721"]},#mission_box_item{chance=100,awards=["9-179"]},#mission_box_item{chance=100,awards=["12-397"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30058,3}) ->
    #mission_box_cfg{
        mission_id=30058,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-739"]},#mission_box_item{chance=100,awards=["9-179"]},#mission_box_item{chance=100,awards=["12-397"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30058,2}) ->
    #mission_box_cfg{
        mission_id=30058,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-758"]},#mission_box_item{chance=100,awards=["9-181"]},#mission_box_item{chance=100,awards=["12-401"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30058,1}) ->
    #mission_box_cfg{
        mission_id=30058,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-777"]},#mission_box_item{chance=100,awards=["9-183"]},#mission_box_item{chance=100,awards=["12-405"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30059,6}) ->
    #mission_box_cfg{
        mission_id=30059,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-773"]},#mission_box_item{chance=100,awards=["9-178"]},#mission_box_item{chance=100,awards=["12-394"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30059,5}) ->
    #mission_box_cfg{
        mission_id=30059,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-792"]},#mission_box_item{chance=100,awards=["9-179"]},#mission_box_item{chance=100,awards=["12-397"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30059,4}) ->
    #mission_box_cfg{
        mission_id=30059,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-811"]},#mission_box_item{chance=100,awards=["9-181"]},#mission_box_item{chance=100,awards=["12-401"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30059,3}) ->
    #mission_box_cfg{
        mission_id=30059,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-831"]},#mission_box_item{chance=100,awards=["9-183"]},#mission_box_item{chance=100,awards=["12-405"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30059,2}) ->
    #mission_box_cfg{
        mission_id=30059,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-851"]},#mission_box_item{chance=100,awards=["9-184"]},#mission_box_item{chance=100,awards=["12-408"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30059,1}) ->
    #mission_box_cfg{
        mission_id=30059,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-870"]},#mission_box_item{chance=100,awards=["9-186"]},#mission_box_item{chance=100,awards=["12-412"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30060,6}) ->
    #mission_box_cfg{
        mission_id=30060,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-865"]},#mission_box_item{chance=100,awards=["9-181"]},#mission_box_item{chance=100,awards=["12-401"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30060,5}) ->
    #mission_box_cfg{
        mission_id=30060,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-884"]},#mission_box_item{chance=100,awards=["9-183"]},#mission_box_item{chance=100,awards=["12-405"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30060,4}) ->
    #mission_box_cfg{
        mission_id=30060,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-905"]},#mission_box_item{chance=100,awards=["9-184"]},#mission_box_item{chance=100,awards=["12-408"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30060,3}) ->
    #mission_box_cfg{
        mission_id=30060,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-925"]},#mission_box_item{chance=100,awards=["9-186"]},#mission_box_item{chance=100,awards=["12-412"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30060,2}) ->
    #mission_box_cfg{
        mission_id=30060,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-945"]},#mission_box_item{chance=100,awards=["9-186"]},#mission_box_item{chance=100,awards=["12-412"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30060,1}) ->
    #mission_box_cfg{
        mission_id=30060,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-966"]},#mission_box_item{chance=100,awards=["9-188"]},#mission_box_item{chance=100,awards=["12-416"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30061,6}) ->
    #mission_box_cfg{
        mission_id=30061,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-959"]},#mission_box_item{chance=100,awards=["9-184"]},#mission_box_item{chance=100,awards=["12-408"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30061,5}) ->
    #mission_box_cfg{
        mission_id=30061,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-979"]},#mission_box_item{chance=100,awards=["9-186"]},#mission_box_item{chance=100,awards=["12-412"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30061,4}) ->
    #mission_box_cfg{
        mission_id=30061,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1000"]},#mission_box_item{chance=100,awards=["9-186"]},#mission_box_item{chance=100,awards=["12-412"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30061,3}) ->
    #mission_box_cfg{
        mission_id=30061,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1021"]},#mission_box_item{chance=100,awards=["9-188"]},#mission_box_item{chance=100,awards=["12-416"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30061,2}) ->
    #mission_box_cfg{
        mission_id=30061,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1043"]},#mission_box_item{chance=100,awards=["9-189"]},#mission_box_item{chance=100,awards=["12-419"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30061,1}) ->
    #mission_box_cfg{
        mission_id=30061,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1064"]},#mission_box_item{chance=100,awards=["9-191"]},#mission_box_item{chance=100,awards=["12-423"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30062,6}) ->
    #mission_box_cfg{
        mission_id=30062,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1055"]},#mission_box_item{chance=100,awards=["9-186"]},#mission_box_item{chance=100,awards=["12-412"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30062,5}) ->
    #mission_box_cfg{
        mission_id=30062,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1076"]},#mission_box_item{chance=100,awards=["9-188"]},#mission_box_item{chance=100,awards=["12-416"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30062,4}) ->
    #mission_box_cfg{
        mission_id=30062,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1098"]},#mission_box_item{chance=100,awards=["9-189"]},#mission_box_item{chance=100,awards=["12-419"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30062,3}) ->
    #mission_box_cfg{
        mission_id=30062,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1120"]},#mission_box_item{chance=100,awards=["9-191"]},#mission_box_item{chance=100,awards=["12-423"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30062,2}) ->
    #mission_box_cfg{
        mission_id=30062,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1142"]},#mission_box_item{chance=100,awards=["9-193"]},#mission_box_item{chance=100,awards=["12-427"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30062,1}) ->
    #mission_box_cfg{
        mission_id=30062,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1164"]},#mission_box_item{chance=100,awards=["9-194"]},#mission_box_item{chance=100,awards=["12-430"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30063,6}) ->
    #mission_box_cfg{
        mission_id=30063,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1154"]},#mission_box_item{chance=100,awards=["9-189"]},#mission_box_item{chance=100,awards=["12-419"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30063,5}) ->
    #mission_box_cfg{
        mission_id=30063,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1176"]},#mission_box_item{chance=100,awards=["9-191"]},#mission_box_item{chance=100,awards=["12-423"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30063,4}) ->
    #mission_box_cfg{
        mission_id=30063,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1199"]},#mission_box_item{chance=100,awards=["9-193"]},#mission_box_item{chance=100,awards=["12-427"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30063,3}) ->
    #mission_box_cfg{
        mission_id=30063,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1221"]},#mission_box_item{chance=100,awards=["9-194"]},#mission_box_item{chance=100,awards=["12-430"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30063,2}) ->
    #mission_box_cfg{
        mission_id=30063,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1244"]},#mission_box_item{chance=100,awards=["9-194"]},#mission_box_item{chance=100,awards=["12-430"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30063,1}) ->
    #mission_box_cfg{
        mission_id=30063,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1267"]},#mission_box_item{chance=100,awards=["9-196"]},#mission_box_item{chance=100,awards=["12-434"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30064,6}) ->
    #mission_box_cfg{
        mission_id=30064,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1255"]},#mission_box_item{chance=100,awards=["9-193"]},#mission_box_item{chance=100,awards=["12-427"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30064,5}) ->
    #mission_box_cfg{
        mission_id=30064,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1278"]},#mission_box_item{chance=100,awards=["9-194"]},#mission_box_item{chance=100,awards=["12-430"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30064,4}) ->
    #mission_box_cfg{
        mission_id=30064,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1301"]},#mission_box_item{chance=100,awards=["9-194"]},#mission_box_item{chance=100,awards=["12-430"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30064,3}) ->
    #mission_box_cfg{
        mission_id=30064,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1325"]},#mission_box_item{chance=100,awards=["9-196"]},#mission_box_item{chance=100,awards=["12-434"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30064,2}) ->
    #mission_box_cfg{
        mission_id=30064,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1349"]},#mission_box_item{chance=100,awards=["9-198"]},#mission_box_item{chance=100,awards=["12-438"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30064,1}) ->
    #mission_box_cfg{
        mission_id=30064,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1372"]},#mission_box_item{chance=100,awards=["9-199"]},#mission_box_item{chance=100,awards=["12-441"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30065,6}) ->
    #mission_box_cfg{
        mission_id=30065,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1359"]},#mission_box_item{chance=100,awards=["9-194"]},#mission_box_item{chance=100,awards=["12-430"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30065,5}) ->
    #mission_box_cfg{
        mission_id=30065,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1382"]},#mission_box_item{chance=100,awards=["9-196"]},#mission_box_item{chance=100,awards=["12-434"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30065,4}) ->
    #mission_box_cfg{
        mission_id=30065,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1407"]},#mission_box_item{chance=100,awards=["9-198"]},#mission_box_item{chance=100,awards=["12-438"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30065,3}) ->
    #mission_box_cfg{
        mission_id=30065,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1431"]},#mission_box_item{chance=100,awards=["9-199"]},#mission_box_item{chance=100,awards=["12-441"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30065,2}) ->
    #mission_box_cfg{
        mission_id=30065,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1455"]},#mission_box_item{chance=100,awards=["9-201"]},#mission_box_item{chance=100,awards=["12-445"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30065,1}) ->
    #mission_box_cfg{
        mission_id=30065,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1480"]},#mission_box_item{chance=100,awards=["9-202"]},#mission_box_item{chance=100,awards=["12-448"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30066,6}) ->
    #mission_box_cfg{
        mission_id=30066,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1465"]},#mission_box_item{chance=100,awards=["9-198"]},#mission_box_item{chance=100,awards=["12-438"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30066,5}) ->
    #mission_box_cfg{
        mission_id=30066,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1489"]},#mission_box_item{chance=100,awards=["9-199"]},#mission_box_item{chance=100,awards=["12-441"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30066,4}) ->
    #mission_box_cfg{
        mission_id=30066,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1514"]},#mission_box_item{chance=100,awards=["9-201"]},#mission_box_item{chance=100,awards=["12-445"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30066,3}) ->
    #mission_box_cfg{
        mission_id=30066,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1539"]},#mission_box_item{chance=100,awards=["9-202"]},#mission_box_item{chance=100,awards=["12-448"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30066,2}) ->
    #mission_box_cfg{
        mission_id=30066,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1565"]},#mission_box_item{chance=100,awards=["9-202"]},#mission_box_item{chance=100,awards=["12-448"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30066,1}) ->
    #mission_box_cfg{
        mission_id=30066,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1590"]},#mission_box_item{chance=100,awards=["9-204"]},#mission_box_item{chance=100,awards=["12-452"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30067,6}) ->
    #mission_box_cfg{
        mission_id=30067,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1573"]},#mission_box_item{chance=100,awards=["9-201"]},#mission_box_item{chance=100,awards=["12-445"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30067,5}) ->
    #mission_box_cfg{
        mission_id=30067,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1598"]},#mission_box_item{chance=100,awards=["9-202"]},#mission_box_item{chance=100,awards=["12-448"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30067,4}) ->
    #mission_box_cfg{
        mission_id=30067,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1624"]},#mission_box_item{chance=100,awards=["9-202"]},#mission_box_item{chance=100,awards=["12-448"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30067,3}) ->
    #mission_box_cfg{
        mission_id=30067,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1650"]},#mission_box_item{chance=100,awards=["9-204"]},#mission_box_item{chance=100,awards=["12-452"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30067,2}) ->
    #mission_box_cfg{
        mission_id=30067,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1676"]},#mission_box_item{chance=100,awards=["9-206"]},#mission_box_item{chance=100,awards=["12-456"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30067,1}) ->
    #mission_box_cfg{
        mission_id=30067,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1702"]},#mission_box_item{chance=100,awards=["9-207"]},#mission_box_item{chance=100,awards=["12-459"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30068,6}) ->
    #mission_box_cfg{
        mission_id=30068,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1684"]},#mission_box_item{chance=100,awards=["9-202"]},#mission_box_item{chance=100,awards=["12-448"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30068,5}) ->
    #mission_box_cfg{
        mission_id=30068,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1710"]},#mission_box_item{chance=100,awards=["9-204"]},#mission_box_item{chance=100,awards=["12-452"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30068,4}) ->
    #mission_box_cfg{
        mission_id=30068,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1737"]},#mission_box_item{chance=100,awards=["9-206"]},#mission_box_item{chance=100,awards=["12-456"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30068,3}) ->
    #mission_box_cfg{
        mission_id=30068,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1763"]},#mission_box_item{chance=100,awards=["9-207"]},#mission_box_item{chance=100,awards=["12-459"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30068,2}) ->
    #mission_box_cfg{
        mission_id=30068,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1790"]},#mission_box_item{chance=100,awards=["9-209"]},#mission_box_item{chance=100,awards=["12-463"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30068,1}) ->
    #mission_box_cfg{
        mission_id=30068,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1817"]},#mission_box_item{chance=100,awards=["9-211"]},#mission_box_item{chance=100,awards=["12-467"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30069,6}) ->
    #mission_box_cfg{
        mission_id=30069,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1797"]},#mission_box_item{chance=100,awards=["9-206"]},#mission_box_item{chance=100,awards=["12-456"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30069,5}) ->
    #mission_box_cfg{
        mission_id=30069,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1824"]},#mission_box_item{chance=100,awards=["9-207"]},#mission_box_item{chance=100,awards=["12-459"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30069,4}) ->
    #mission_box_cfg{
        mission_id=30069,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1851"]},#mission_box_item{chance=100,awards=["9-209"]},#mission_box_item{chance=100,awards=["12-463"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30069,3}) ->
    #mission_box_cfg{
        mission_id=30069,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1879"]},#mission_box_item{chance=100,awards=["9-211"]},#mission_box_item{chance=100,awards=["12-467"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30069,2}) ->
    #mission_box_cfg{
        mission_id=30069,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1907"]},#mission_box_item{chance=100,awards=["9-211"]},#mission_box_item{chance=100,awards=["12-467"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30069,1}) ->
    #mission_box_cfg{
        mission_id=30069,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1934"]},#mission_box_item{chance=100,awards=["9-212"]},#mission_box_item{chance=100,awards=["12-470"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30070,6}) ->
    #mission_box_cfg{
        mission_id=30070,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1913"]},#mission_box_item{chance=100,awards=["9-209"]},#mission_box_item{chance=100,awards=["12-463"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30070,5}) ->
    #mission_box_cfg{
        mission_id=30070,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1940"]},#mission_box_item{chance=100,awards=["9-211"]},#mission_box_item{chance=100,awards=["12-467"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30070,4}) ->
    #mission_box_cfg{
        mission_id=30070,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1969"]},#mission_box_item{chance=100,awards=["9-211"]},#mission_box_item{chance=100,awards=["12-467"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30070,3}) ->
    #mission_box_cfg{
        mission_id=30070,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1997"]},#mission_box_item{chance=100,awards=["9-212"]},#mission_box_item{chance=100,awards=["12-470"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30070,2}) ->
    #mission_box_cfg{
        mission_id=30070,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2025"]},#mission_box_item{chance=100,awards=["9-214"]},#mission_box_item{chance=100,awards=["12-474"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30070,1}) ->
    #mission_box_cfg{
        mission_id=30070,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2054"]},#mission_box_item{chance=100,awards=["9-216"]},#mission_box_item{chance=100,awards=["12-478"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30071,6}) ->
    #mission_box_cfg{
        mission_id=30071,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2031"]},#mission_box_item{chance=100,awards=["9-211"]},#mission_box_item{chance=100,awards=["12-467"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30071,5}) ->
    #mission_box_cfg{
        mission_id=30071,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2059"]},#mission_box_item{chance=100,awards=["9-212"]},#mission_box_item{chance=100,awards=["12-470"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30071,4}) ->
    #mission_box_cfg{
        mission_id=30071,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2088"]},#mission_box_item{chance=100,awards=["9-214"]},#mission_box_item{chance=100,awards=["12-474"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30071,3}) ->
    #mission_box_cfg{
        mission_id=30071,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2117"]},#mission_box_item{chance=100,awards=["9-216"]},#mission_box_item{chance=100,awards=["12-478"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30071,2}) ->
    #mission_box_cfg{
        mission_id=30071,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2147"]},#mission_box_item{chance=100,awards=["9-217"]},#mission_box_item{chance=100,awards=["12-481"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30071,1}) ->
    #mission_box_cfg{
        mission_id=30071,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2176"]},#mission_box_item{chance=100,awards=["9-219"]},#mission_box_item{chance=100,awards=["12-485"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30072,6}) ->
    #mission_box_cfg{
        mission_id=30072,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2151"]},#mission_box_item{chance=100,awards=["9-214"]},#mission_box_item{chance=100,awards=["12-474"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30072,5}) ->
    #mission_box_cfg{
        mission_id=30072,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2180"]},#mission_box_item{chance=100,awards=["9-216"]},#mission_box_item{chance=100,awards=["12-478"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30072,4}) ->
    #mission_box_cfg{
        mission_id=30072,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2210"]},#mission_box_item{chance=100,awards=["9-217"]},#mission_box_item{chance=100,awards=["12-481"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30072,3}) ->
    #mission_box_cfg{
        mission_id=30072,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2240"]},#mission_box_item{chance=100,awards=["9-219"]},#mission_box_item{chance=100,awards=["12-485"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30072,2}) ->
    #mission_box_cfg{
        mission_id=30072,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2270"]},#mission_box_item{chance=100,awards=["9-219"]},#mission_box_item{chance=100,awards=["12-485"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30072,1}) ->
    #mission_box_cfg{
        mission_id=30072,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2300"]},#mission_box_item{chance=100,awards=["9-221"]},#mission_box_item{chance=100,awards=["12-489"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30073,6}) ->
    #mission_box_cfg{
        mission_id=30073,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2274"]},#mission_box_item{chance=100,awards=["9-217"]},#mission_box_item{chance=100,awards=["12-481"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30073,5}) ->
    #mission_box_cfg{
        mission_id=30073,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2304"]},#mission_box_item{chance=100,awards=["9-219"]},#mission_box_item{chance=100,awards=["12-485"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30073,4}) ->
    #mission_box_cfg{
        mission_id=30073,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2335"]},#mission_box_item{chance=100,awards=["9-219"]},#mission_box_item{chance=100,awards=["12-485"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30073,3}) ->
    #mission_box_cfg{
        mission_id=30073,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2365"]},#mission_box_item{chance=100,awards=["9-221"]},#mission_box_item{chance=100,awards=["12-489"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30073,2}) ->
    #mission_box_cfg{
        mission_id=30073,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2396"]},#mission_box_item{chance=100,awards=["9-222"]},#mission_box_item{chance=100,awards=["12-492"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30073,1}) ->
    #mission_box_cfg{
        mission_id=30073,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2427"]},#mission_box_item{chance=100,awards=["9-224"]},#mission_box_item{chance=100,awards=["12-496"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30074,6}) ->
    #mission_box_cfg{
        mission_id=30074,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2399"]},#mission_box_item{chance=100,awards=["9-219"]},#mission_box_item{chance=100,awards=["12-485"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30074,5}) ->
    #mission_box_cfg{
        mission_id=30074,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2430"]},#mission_box_item{chance=100,awards=["9-221"]},#mission_box_item{chance=100,awards=["12-489"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30074,4}) ->
    #mission_box_cfg{
        mission_id=30074,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2461"]},#mission_box_item{chance=100,awards=["9-222"]},#mission_box_item{chance=100,awards=["12-492"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30074,3}) ->
    #mission_box_cfg{
        mission_id=30074,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2493"]},#mission_box_item{chance=100,awards=["9-224"]},#mission_box_item{chance=100,awards=["12-496"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30074,2}) ->
    #mission_box_cfg{
        mission_id=30074,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2525"]},#mission_box_item{chance=100,awards=["9-226"]},#mission_box_item{chance=100,awards=["12-500"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30074,1}) ->
    #mission_box_cfg{
        mission_id=30074,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2556"]},#mission_box_item{chance=100,awards=["9-227"]},#mission_box_item{chance=100,awards=["12-503"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30075,6}) ->
    #mission_box_cfg{
        mission_id=30075,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2527"]},#mission_box_item{chance=100,awards=["9-222"]},#mission_box_item{chance=100,awards=["12-492"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30075,5}) ->
    #mission_box_cfg{
        mission_id=30075,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2526"]},#mission_box_item{chance=100,awards=["9-224"]},#mission_box_item{chance=100,awards=["12-496"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30075,4}) ->
    #mission_box_cfg{
        mission_id=30075,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2525"]},#mission_box_item{chance=100,awards=["9-226"]},#mission_box_item{chance=100,awards=["12-500"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30075,3}) ->
    #mission_box_cfg{
        mission_id=30075,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2523"]},#mission_box_item{chance=100,awards=["9-227"]},#mission_box_item{chance=100,awards=["12-503"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30075,2}) ->
    #mission_box_cfg{
        mission_id=30075,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2522"]},#mission_box_item{chance=100,awards=["9-227"]},#mission_box_item{chance=100,awards=["12-503"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30075,1}) ->
    #mission_box_cfg{
        mission_id=30075,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2520"]},#mission_box_item{chance=100,awards=["9-229"]},#mission_box_item{chance=100,awards=["12-507"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30076,6}) ->
    #mission_box_cfg{
        mission_id=30076,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2459"]},#mission_box_item{chance=100,awards=["9-226"]},#mission_box_item{chance=100,awards=["12-500"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30076,5}) ->
    #mission_box_cfg{
        mission_id=30076,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2457"]},#mission_box_item{chance=100,awards=["9-227"]},#mission_box_item{chance=100,awards=["12-503"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30076,4}) ->
    #mission_box_cfg{
        mission_id=30076,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2455"]},#mission_box_item{chance=100,awards=["9-227"]},#mission_box_item{chance=100,awards=["12-503"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30076,3}) ->
    #mission_box_cfg{
        mission_id=30076,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2453"]},#mission_box_item{chance=100,awards=["9-229"]},#mission_box_item{chance=100,awards=["12-507"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30076,2}) ->
    #mission_box_cfg{
        mission_id=30076,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2451"]},#mission_box_item{chance=100,awards=["9-231"]},#mission_box_item{chance=100,awards=["12-511"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30076,1}) ->
    #mission_box_cfg{
        mission_id=30076,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2448"]},#mission_box_item{chance=100,awards=["9-232"]},#mission_box_item{chance=100,awards=["12-514"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30077,6}) ->
    #mission_box_cfg{
        mission_id=30077,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2388"]},#mission_box_item{chance=100,awards=["9-227"]},#mission_box_item{chance=100,awards=["12-503"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30077,5}) ->
    #mission_box_cfg{
        mission_id=30077,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2386"]},#mission_box_item{chance=100,awards=["9-229"]},#mission_box_item{chance=100,awards=["12-507"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30077,4}) ->
    #mission_box_cfg{
        mission_id=30077,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2383"]},#mission_box_item{chance=100,awards=["9-231"]},#mission_box_item{chance=100,awards=["12-511"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30077,3}) ->
    #mission_box_cfg{
        mission_id=30077,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2380"]},#mission_box_item{chance=100,awards=["9-232"]},#mission_box_item{chance=100,awards=["12-514"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30077,2}) ->
    #mission_box_cfg{
        mission_id=30077,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2377"]},#mission_box_item{chance=100,awards=["9-234"]},#mission_box_item{chance=100,awards=["12-518"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30077,1}) ->
    #mission_box_cfg{
        mission_id=30077,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2374"]},#mission_box_item{chance=100,awards=["9-235"]},#mission_box_item{chance=100,awards=["12-521"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30078,6}) ->
    #mission_box_cfg{
        mission_id=30078,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2315"]},#mission_box_item{chance=100,awards=["9-231"]},#mission_box_item{chance=100,awards=["12-511"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30078,5}) ->
    #mission_box_cfg{
        mission_id=30078,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2312"]},#mission_box_item{chance=100,awards=["9-232"]},#mission_box_item{chance=100,awards=["12-514"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30078,4}) ->
    #mission_box_cfg{
        mission_id=30078,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2309"]},#mission_box_item{chance=100,awards=["9-234"]},#mission_box_item{chance=100,awards=["12-518"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30078,3}) ->
    #mission_box_cfg{
        mission_id=30078,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2305"]},#mission_box_item{chance=100,awards=["9-235"]},#mission_box_item{chance=100,awards=["12-521"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30078,2}) ->
    #mission_box_cfg{
        mission_id=30078,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2301"]},#mission_box_item{chance=100,awards=["9-235"]},#mission_box_item{chance=100,awards=["12-521"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30078,1}) ->
    #mission_box_cfg{
        mission_id=30078,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2297"]},#mission_box_item{chance=100,awards=["9-237"]},#mission_box_item{chance=100,awards=["12-525"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30079,6}) ->
    #mission_box_cfg{
        mission_id=30079,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2240"]},#mission_box_item{chance=100,awards=["9-234"]},#mission_box_item{chance=100,awards=["12-518"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30079,5}) ->
    #mission_box_cfg{
        mission_id=30079,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2236"]},#mission_box_item{chance=100,awards=["9-235"]},#mission_box_item{chance=100,awards=["12-521"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30079,4}) ->
    #mission_box_cfg{
        mission_id=30079,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2232"]},#mission_box_item{chance=100,awards=["9-235"]},#mission_box_item{chance=100,awards=["12-521"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30079,3}) ->
    #mission_box_cfg{
        mission_id=30079,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2227"]},#mission_box_item{chance=100,awards=["9-237"]},#mission_box_item{chance=100,awards=["12-525"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30079,2}) ->
    #mission_box_cfg{
        mission_id=30079,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2223"]},#mission_box_item{chance=100,awards=["9-239"]},#mission_box_item{chance=100,awards=["12-529"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30079,1}) ->
    #mission_box_cfg{
        mission_id=30079,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2218"]},#mission_box_item{chance=100,awards=["9-240"]},#mission_box_item{chance=100,awards=["12-532"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30080,6}) ->
    #mission_box_cfg{
        mission_id=30080,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2163"]},#mission_box_item{chance=100,awards=["9-235"]},#mission_box_item{chance=100,awards=["12-521"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30080,5}) ->
    #mission_box_cfg{
        mission_id=30080,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2158"]},#mission_box_item{chance=100,awards=["9-237"]},#mission_box_item{chance=100,awards=["12-525"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30080,4}) ->
    #mission_box_cfg{
        mission_id=30080,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2153"]},#mission_box_item{chance=100,awards=["9-239"]},#mission_box_item{chance=100,awards=["12-529"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30080,3}) ->
    #mission_box_cfg{
        mission_id=30080,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2147"]},#mission_box_item{chance=100,awards=["9-240"]},#mission_box_item{chance=100,awards=["12-532"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30080,2}) ->
    #mission_box_cfg{
        mission_id=30080,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2142"]},#mission_box_item{chance=100,awards=["9-242"]},#mission_box_item{chance=100,awards=["12-536"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30080,1}) ->
    #mission_box_cfg{
        mission_id=30080,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2136"]},#mission_box_item{chance=100,awards=["9-244"]},#mission_box_item{chance=100,awards=["12-540"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30081,6}) ->
    #mission_box_cfg{
        mission_id=30081,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2083"]},#mission_box_item{chance=100,awards=["9-239"]},#mission_box_item{chance=100,awards=["12-529"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30081,5}) ->
    #mission_box_cfg{
        mission_id=30081,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2077"]},#mission_box_item{chance=100,awards=["9-240"]},#mission_box_item{chance=100,awards=["12-532"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30081,4}) ->
    #mission_box_cfg{
        mission_id=30081,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2071"]},#mission_box_item{chance=100,awards=["9-242"]},#mission_box_item{chance=100,awards=["12-536"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30081,3}) ->
    #mission_box_cfg{
        mission_id=30081,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2065"]},#mission_box_item{chance=100,awards=["9-244"]},#mission_box_item{chance=100,awards=["12-540"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30081,2}) ->
    #mission_box_cfg{
        mission_id=30081,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2059"]},#mission_box_item{chance=100,awards=["9-244"]},#mission_box_item{chance=100,awards=["12-540"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30081,1}) ->
    #mission_box_cfg{
        mission_id=30081,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2052"]},#mission_box_item{chance=100,awards=["9-245"]},#mission_box_item{chance=100,awards=["12-543"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30082,6}) ->
    #mission_box_cfg{
        mission_id=30082,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2000"]},#mission_box_item{chance=100,awards=["9-242"]},#mission_box_item{chance=100,awards=["12-536"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30082,5}) ->
    #mission_box_cfg{
        mission_id=30082,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1994"]},#mission_box_item{chance=100,awards=["9-244"]},#mission_box_item{chance=100,awards=["12-540"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30082,4}) ->
    #mission_box_cfg{
        mission_id=30082,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1987"]},#mission_box_item{chance=100,awards=["9-244"]},#mission_box_item{chance=100,awards=["12-540"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30082,3}) ->
    #mission_box_cfg{
        mission_id=30082,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1980"]},#mission_box_item{chance=100,awards=["9-245"]},#mission_box_item{chance=100,awards=["12-543"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30082,2}) ->
    #mission_box_cfg{
        mission_id=30082,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1973"]},#mission_box_item{chance=100,awards=["9-247"]},#mission_box_item{chance=100,awards=["12-547"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30082,1}) ->
    #mission_box_cfg{
        mission_id=30082,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1966"]},#mission_box_item{chance=100,awards=["9-249"]},#mission_box_item{chance=100,awards=["12-551"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30083,6}) ->
    #mission_box_cfg{
        mission_id=30083,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1915"]},#mission_box_item{chance=100,awards=["9-244"]},#mission_box_item{chance=100,awards=["12-540"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30083,5}) ->
    #mission_box_cfg{
        mission_id=30083,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1908"]},#mission_box_item{chance=100,awards=["9-245"]},#mission_box_item{chance=100,awards=["12-543"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30083,4}) ->
    #mission_box_cfg{
        mission_id=30083,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1901"]},#mission_box_item{chance=100,awards=["9-247"]},#mission_box_item{chance=100,awards=["12-547"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30083,3}) ->
    #mission_box_cfg{
        mission_id=30083,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1893"]},#mission_box_item{chance=100,awards=["9-249"]},#mission_box_item{chance=100,awards=["12-551"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30083,2}) ->
    #mission_box_cfg{
        mission_id=30083,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1885"]},#mission_box_item{chance=100,awards=["9-250"]},#mission_box_item{chance=100,awards=["12-554"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30083,1}) ->
    #mission_box_cfg{
        mission_id=30083,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1877"]},#mission_box_item{chance=100,awards=["9-252"]},#mission_box_item{chance=100,awards=["12-558"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30084,6}) ->
    #mission_box_cfg{
        mission_id=30084,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1828"]},#mission_box_item{chance=100,awards=["9-247"]},#mission_box_item{chance=100,awards=["12-547"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30084,5}) ->
    #mission_box_cfg{
        mission_id=30084,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1820"]},#mission_box_item{chance=100,awards=["9-249"]},#mission_box_item{chance=100,awards=["12-551"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30084,4}) ->
    #mission_box_cfg{
        mission_id=30084,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1812"]},#mission_box_item{chance=100,awards=["9-250"]},#mission_box_item{chance=100,awards=["12-554"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30084,3}) ->
    #mission_box_cfg{
        mission_id=30084,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1803"]},#mission_box_item{chance=100,awards=["9-252"]},#mission_box_item{chance=100,awards=["12-558"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30084,2}) ->
    #mission_box_cfg{
        mission_id=30084,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1795"]},#mission_box_item{chance=100,awards=["9-252"]},#mission_box_item{chance=100,awards=["12-558"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30084,1}) ->
    #mission_box_cfg{
        mission_id=30084,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1786"]},#mission_box_item{chance=100,awards=["9-254"]},#mission_box_item{chance=100,awards=["12-562"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30085,6}) ->
    #mission_box_cfg{
        mission_id=30085,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1739"]},#mission_box_item{chance=100,awards=["9-250"]},#mission_box_item{chance=100,awards=["12-554"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30085,5}) ->
    #mission_box_cfg{
        mission_id=30085,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1730"]},#mission_box_item{chance=100,awards=["9-252"]},#mission_box_item{chance=100,awards=["12-558"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30085,4}) ->
    #mission_box_cfg{
        mission_id=30085,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1721"]},#mission_box_item{chance=100,awards=["9-252"]},#mission_box_item{chance=100,awards=["12-558"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30085,3}) ->
    #mission_box_cfg{
        mission_id=30085,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1711"]},#mission_box_item{chance=100,awards=["9-254"]},#mission_box_item{chance=100,awards=["12-562"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30085,2}) ->
    #mission_box_cfg{
        mission_id=30085,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1702"]},#mission_box_item{chance=100,awards=["9-255"]},#mission_box_item{chance=100,awards=["12-565"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({30085,1}) ->
    #mission_box_cfg{
        mission_id=30085,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1692"]},#mission_box_item{chance=100,awards=["9-257"]},#mission_box_item{chance=100,awards=["12-569"]},#mission_box_item{chance=6,awards=["5-10"]}]};

get({31000,6}) ->
    #mission_box_cfg{
        mission_id=31000,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2225"]},#mission_box_item{chance=100,awards=["9-341"]},#mission_box_item{chance=100,awards=["12-755"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31000,5}) ->
    #mission_box_cfg{
        mission_id=31000,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2288"]},#mission_box_item{chance=100,awards=["9-356"]},#mission_box_item{chance=100,awards=["12-788"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31000,4}) ->
    #mission_box_cfg{
        mission_id=31000,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2349"]},#mission_box_item{chance=100,awards=["9-369"]},#mission_box_item{chance=100,awards=["12-817"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31000,3}) ->
    #mission_box_cfg{
        mission_id=31000,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2408"]},#mission_box_item{chance=100,awards=["9-382"]},#mission_box_item{chance=100,awards=["12-846"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31000,2}) ->
    #mission_box_cfg{
        mission_id=31000,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2465"]},#mission_box_item{chance=100,awards=["9-397"]},#mission_box_item{chance=100,awards=["12-879"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31000,1}) ->
    #mission_box_cfg{
        mission_id=31000,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2520"]},#mission_box_item{chance=100,awards=["9-410"]},#mission_box_item{chance=100,awards=["12-908"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31001,6}) ->
    #mission_box_cfg{
        mission_id=31001,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2158"]},#mission_box_item{chance=100,awards=["9-356"]},#mission_box_item{chance=100,awards=["12-788"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31001,5}) ->
    #mission_box_cfg{
        mission_id=31001,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2214"]},#mission_box_item{chance=100,awards=["9-369"]},#mission_box_item{chance=100,awards=["12-817"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31001,4}) ->
    #mission_box_cfg{
        mission_id=31001,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2268"]},#mission_box_item{chance=100,awards=["9-382"]},#mission_box_item{chance=100,awards=["12-846"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31001,3}) ->
    #mission_box_cfg{
        mission_id=31001,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2320"]},#mission_box_item{chance=100,awards=["9-397"]},#mission_box_item{chance=100,awards=["12-879"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31001,2}) ->
    #mission_box_cfg{
        mission_id=31001,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2370"]},#mission_box_item{chance=100,awards=["9-410"]},#mission_box_item{chance=100,awards=["12-908"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31001,1}) ->
    #mission_box_cfg{
        mission_id=31001,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2418"]},#mission_box_item{chance=100,awards=["9-424"]},#mission_box_item{chance=100,awards=["12-938"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31002,6}) ->
    #mission_box_cfg{
        mission_id=31002,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2079"]},#mission_box_item{chance=100,awards=["9-369"]},#mission_box_item{chance=100,awards=["12-817"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31002,5}) ->
    #mission_box_cfg{
        mission_id=31002,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2128"]},#mission_box_item{chance=100,awards=["9-382"]},#mission_box_item{chance=100,awards=["12-846"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31002,4}) ->
    #mission_box_cfg{
        mission_id=31002,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2175"]},#mission_box_item{chance=100,awards=["9-397"]},#mission_box_item{chance=100,awards=["12-879"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31002,3}) ->
    #mission_box_cfg{
        mission_id=31002,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2220"]},#mission_box_item{chance=100,awards=["9-410"]},#mission_box_item{chance=100,awards=["12-908"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31002,2}) ->
    #mission_box_cfg{
        mission_id=31002,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2263"]},#mission_box_item{chance=100,awards=["9-424"]},#mission_box_item{chance=100,awards=["12-938"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31002,1}) ->
    #mission_box_cfg{
        mission_id=31002,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2304"]},#mission_box_item{chance=100,awards=["9-438"]},#mission_box_item{chance=100,awards=["12-970"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31006,6}) ->
    #mission_box_cfg{
        mission_id=31006,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1988"]},#mission_box_item{chance=100,awards=["9-382"]},#mission_box_item{chance=100,awards=["12-846"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31006,5}) ->
    #mission_box_cfg{
        mission_id=31006,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2030"]},#mission_box_item{chance=100,awards=["9-397"]},#mission_box_item{chance=100,awards=["12-879"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31006,4}) ->
    #mission_box_cfg{
        mission_id=31006,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2070"]},#mission_box_item{chance=100,awards=["9-410"]},#mission_box_item{chance=100,awards=["12-908"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31006,3}) ->
    #mission_box_cfg{
        mission_id=31006,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2108"]},#mission_box_item{chance=100,awards=["9-424"]},#mission_box_item{chance=100,awards=["12-938"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31006,2}) ->
    #mission_box_cfg{
        mission_id=31006,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2144"]},#mission_box_item{chance=100,awards=["9-438"]},#mission_box_item{chance=100,awards=["12-970"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31006,1}) ->
    #mission_box_cfg{
        mission_id=31006,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2178"]},#mission_box_item{chance=100,awards=["9-452"]},#mission_box_item{chance=100,awards=["12-1000"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31007,6}) ->
    #mission_box_cfg{
        mission_id=31007,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1885"]},#mission_box_item{chance=100,awards=["9-397"]},#mission_box_item{chance=100,awards=["12-879"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31007,5}) ->
    #mission_box_cfg{
        mission_id=31007,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1920"]},#mission_box_item{chance=100,awards=["9-410"]},#mission_box_item{chance=100,awards=["12-908"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31007,4}) ->
    #mission_box_cfg{
        mission_id=31007,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1953"]},#mission_box_item{chance=100,awards=["9-424"]},#mission_box_item{chance=100,awards=["12-938"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31007,3}) ->
    #mission_box_cfg{
        mission_id=31007,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1984"]},#mission_box_item{chance=100,awards=["9-438"]},#mission_box_item{chance=100,awards=["12-970"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31007,2}) ->
    #mission_box_cfg{
        mission_id=31007,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2013"]},#mission_box_item{chance=100,awards=["9-452"]},#mission_box_item{chance=100,awards=["12-1000"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31007,1}) ->
    #mission_box_cfg{
        mission_id=31007,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2040"]},#mission_box_item{chance=100,awards=["9-465"]},#mission_box_item{chance=100,awards=["12-1029"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31008,6}) ->
    #mission_box_cfg{
        mission_id=31008,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1770"]},#mission_box_item{chance=100,awards=["9-410"]},#mission_box_item{chance=100,awards=["12-908"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31008,5}) ->
    #mission_box_cfg{
        mission_id=31008,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1798"]},#mission_box_item{chance=100,awards=["9-424"]},#mission_box_item{chance=100,awards=["12-938"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31008,4}) ->
    #mission_box_cfg{
        mission_id=31008,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1824"]},#mission_box_item{chance=100,awards=["9-438"]},#mission_box_item{chance=100,awards=["12-970"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31008,3}) ->
    #mission_box_cfg{
        mission_id=31008,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1848"]},#mission_box_item{chance=100,awards=["9-452"]},#mission_box_item{chance=100,awards=["12-1000"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31008,2}) ->
    #mission_box_cfg{
        mission_id=31008,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1870"]},#mission_box_item{chance=100,awards=["9-465"]},#mission_box_item{chance=100,awards=["12-1029"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31008,1}) ->
    #mission_box_cfg{
        mission_id=31008,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1890"]},#mission_box_item{chance=100,awards=["9-480"]},#mission_box_item{chance=100,awards=["12-1062"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31009,6}) ->
    #mission_box_cfg{
        mission_id=31009,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1855"]},#mission_box_item{chance=100,awards=["9-480"]},#mission_box_item{chance=100,awards=["12-1062"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31009,5}) ->
    #mission_box_cfg{
        mission_id=31009,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1872"]},#mission_box_item{chance=100,awards=["9-493"]},#mission_box_item{chance=100,awards=["12-1091"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31009,4}) ->
    #mission_box_cfg{
        mission_id=31009,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1887"]},#mission_box_item{chance=100,awards=["9-506"]},#mission_box_item{chance=100,awards=["12-1120"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31009,3}) ->
    #mission_box_cfg{
        mission_id=31009,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1900"]},#mission_box_item{chance=100,awards=["9-521"]},#mission_box_item{chance=100,awards=["12-1153"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31009,2}) ->
    #mission_box_cfg{
        mission_id=31009,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1911"]},#mission_box_item{chance=100,awards=["9-534"]},#mission_box_item{chance=100,awards=["12-1182"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31009,1}) ->
    #mission_box_cfg{
        mission_id=31009,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1920"]},#mission_box_item{chance=100,awards=["9-547"]},#mission_box_item{chance=100,awards=["12-1211"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31010,6}) ->
    #mission_box_cfg{
        mission_id=31010,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1692"]},#mission_box_item{chance=100,awards=["9-493"]},#mission_box_item{chance=100,awards=["12-1091"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31010,5}) ->
    #mission_box_cfg{
        mission_id=31010,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1702"]},#mission_box_item{chance=100,awards=["9-506"]},#mission_box_item{chance=100,awards=["12-1120"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31010,4}) ->
    #mission_box_cfg{
        mission_id=31010,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1710"]},#mission_box_item{chance=100,awards=["9-521"]},#mission_box_item{chance=100,awards=["12-1153"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31010,3}) ->
    #mission_box_cfg{
        mission_id=31010,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1716"]},#mission_box_item{chance=100,awards=["9-534"]},#mission_box_item{chance=100,awards=["12-1182"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31010,2}) ->
    #mission_box_cfg{
        mission_id=31010,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1720"]},#mission_box_item{chance=100,awards=["9-547"]},#mission_box_item{chance=100,awards=["12-1211"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31010,1}) ->
    #mission_box_cfg{
        mission_id=31010,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1722"]},#mission_box_item{chance=100,awards=["9-561"]},#mission_box_item{chance=100,awards=["12-1241"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31011,6}) ->
    #mission_box_cfg{
        mission_id=31011,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1517"]},#mission_box_item{chance=100,awards=["9-506"]},#mission_box_item{chance=100,awards=["12-1120"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31011,5}) ->
    #mission_box_cfg{
        mission_id=31011,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1520"]},#mission_box_item{chance=100,awards=["9-521"]},#mission_box_item{chance=100,awards=["12-1153"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31011,4}) ->
    #mission_box_cfg{
        mission_id=31011,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1521"]},#mission_box_item{chance=100,awards=["9-534"]},#mission_box_item{chance=100,awards=["12-1182"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31011,3}) ->
    #mission_box_cfg{
        mission_id=31011,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1520"]},#mission_box_item{chance=100,awards=["9-547"]},#mission_box_item{chance=100,awards=["12-1211"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31011,2}) ->
    #mission_box_cfg{
        mission_id=31011,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1599"]},#mission_box_item{chance=100,awards=["9-561"]},#mission_box_item{chance=100,awards=["12-1241"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31011,1}) ->
    #mission_box_cfg{
        mission_id=31011,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1680"]},#mission_box_item{chance=100,awards=["9-575"]},#mission_box_item{chance=100,awards=["12-1273"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31012,6}) ->
    #mission_box_cfg{
        mission_id=31012,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1558"]},#mission_box_item{chance=100,awards=["9-521"]},#mission_box_item{chance=100,awards=["12-1153"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31012,5}) ->
    #mission_box_cfg{
        mission_id=31012,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1638"]},#mission_box_item{chance=100,awards=["9-534"]},#mission_box_item{chance=100,awards=["12-1182"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31012,4}) ->
    #mission_box_cfg{
        mission_id=31012,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1720"]},#mission_box_item{chance=100,awards=["9-547"]},#mission_box_item{chance=100,awards=["12-1211"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31012,3}) ->
    #mission_box_cfg{
        mission_id=31012,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1804"]},#mission_box_item{chance=100,awards=["9-561"]},#mission_box_item{chance=100,awards=["12-1241"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31012,2}) ->
    #mission_box_cfg{
        mission_id=31012,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1890"]},#mission_box_item{chance=100,awards=["9-575"]},#mission_box_item{chance=100,awards=["12-1273"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31012,1}) ->
    #mission_box_cfg{
        mission_id=31012,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1978"]},#mission_box_item{chance=100,awards=["9-589"]},#mission_box_item{chance=100,awards=["12-1303"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31013,6}) ->
    #mission_box_cfg{
        mission_id=31013,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1833"]},#mission_box_item{chance=100,awards=["9-534"]},#mission_box_item{chance=100,awards=["12-1182"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31013,5}) ->
    #mission_box_cfg{
        mission_id=31013,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1920"]},#mission_box_item{chance=100,awards=["9-547"]},#mission_box_item{chance=100,awards=["12-1211"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31013,4}) ->
    #mission_box_cfg{
        mission_id=31013,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2009"]},#mission_box_item{chance=100,awards=["9-561"]},#mission_box_item{chance=100,awards=["12-1241"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31013,3}) ->
    #mission_box_cfg{
        mission_id=31013,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2100"]},#mission_box_item{chance=100,awards=["9-575"]},#mission_box_item{chance=100,awards=["12-1273"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31013,2}) ->
    #mission_box_cfg{
        mission_id=31013,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2193"]},#mission_box_item{chance=100,awards=["9-589"]},#mission_box_item{chance=100,awards=["12-1303"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31013,1}) ->
    #mission_box_cfg{
        mission_id=31013,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2288"]},#mission_box_item{chance=100,awards=["9-602"]},#mission_box_item{chance=100,awards=["12-1332"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31014,6}) ->
    #mission_box_cfg{
        mission_id=31014,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2120"]},#mission_box_item{chance=100,awards=["9-547"]},#mission_box_item{chance=100,awards=["12-1211"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31014,5}) ->
    #mission_box_cfg{
        mission_id=31014,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2214"]},#mission_box_item{chance=100,awards=["9-561"]},#mission_box_item{chance=100,awards=["12-1241"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31014,4}) ->
    #mission_box_cfg{
        mission_id=31014,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2310"]},#mission_box_item{chance=100,awards=["9-575"]},#mission_box_item{chance=100,awards=["12-1273"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31014,3}) ->
    #mission_box_cfg{
        mission_id=31014,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2408"]},#mission_box_item{chance=100,awards=["9-589"]},#mission_box_item{chance=100,awards=["12-1303"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31014,2}) ->
    #mission_box_cfg{
        mission_id=31014,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2508"]},#mission_box_item{chance=100,awards=["9-602"]},#mission_box_item{chance=100,awards=["12-1332"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31014,1}) ->
    #mission_box_cfg{
        mission_id=31014,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2610"]},#mission_box_item{chance=100,awards=["9-617"]},#mission_box_item{chance=100,awards=["12-1365"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({32000,6}) ->
    #mission_box_cfg{
        mission_id=32000,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-3245"]},#mission_box_item{chance=100,awards=["9-754"]},#mission_box_item{chance=100,awards=["12-1668"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32000,5}) ->
    #mission_box_cfg{
        mission_id=32000,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-3360"]},#mission_box_item{chance=100,awards=["9-767"]},#mission_box_item{chance=100,awards=["12-1697"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32000,4}) ->
    #mission_box_cfg{
        mission_id=32000,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-3477"]},#mission_box_item{chance=100,awards=["9-782"]},#mission_box_item{chance=100,awards=["12-1730"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32000,3}) ->
    #mission_box_cfg{
        mission_id=32000,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-3596"]},#mission_box_item{chance=100,awards=["9-795"]},#mission_box_item{chance=100,awards=["12-1759"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32000,2}) ->
    #mission_box_cfg{
        mission_id=32000,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-3717"]},#mission_box_item{chance=100,awards=["9-808"]},#mission_box_item{chance=100,awards=["12-1788"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32000,1}) ->
    #mission_box_cfg{
        mission_id=32000,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-3840"]},#mission_box_item{chance=100,awards=["9-821"]},#mission_box_item{chance=100,awards=["12-1817"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32001,6}) ->
    #mission_box_cfg{
        mission_id=32001,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-3705"]},#mission_box_item{chance=100,awards=["9-782"]},#mission_box_item{chance=100,awards=["12-1730"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32001,5}) ->
    #mission_box_cfg{
        mission_id=32001,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-3828"]},#mission_box_item{chance=100,awards=["9-795"]},#mission_box_item{chance=100,awards=["12-1759"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32001,4}) ->
    #mission_box_cfg{
        mission_id=32001,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-3953"]},#mission_box_item{chance=100,awards=["9-808"]},#mission_box_item{chance=100,awards=["12-1788"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32001,3}) ->
    #mission_box_cfg{
        mission_id=32001,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-4080"]},#mission_box_item{chance=100,awards=["9-821"]},#mission_box_item{chance=100,awards=["12-1817"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32001,2}) ->
    #mission_box_cfg{
        mission_id=32001,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-4209"]},#mission_box_item{chance=100,awards=["9-836"]},#mission_box_item{chance=100,awards=["12-1850"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32001,1}) ->
    #mission_box_cfg{
        mission_id=32001,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-4340"]},#mission_box_item{chance=100,awards=["9-849"]},#mission_box_item{chance=100,awards=["12-1879"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32002,6}) ->
    #mission_box_cfg{
        mission_id=32002,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-4071"]},#mission_box_item{chance=100,awards=["9-808"]},#mission_box_item{chance=100,awards=["12-1788"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32002,5}) ->
    #mission_box_cfg{
        mission_id=32002,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-4080"]},#mission_box_item{chance=100,awards=["9-821"]},#mission_box_item{chance=100,awards=["12-1817"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32002,4}) ->
    #mission_box_cfg{
        mission_id=32002,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-4087"]},#mission_box_item{chance=100,awards=["9-836"]},#mission_box_item{chance=100,awards=["12-1850"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32002,3}) ->
    #mission_box_cfg{
        mission_id=32002,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-4092"]},#mission_box_item{chance=100,awards=["9-849"]},#mission_box_item{chance=100,awards=["12-1879"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32002,2}) ->
    #mission_box_cfg{
        mission_id=32002,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-4095"]},#mission_box_item{chance=100,awards=["9-862"]},#mission_box_item{chance=100,awards=["12-1908"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32002,1}) ->
    #mission_box_cfg{
        mission_id=32002,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-4096"]},#mission_box_item{chance=100,awards=["9-877"]},#mission_box_item{chance=100,awards=["12-1941"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32003,6}) ->
    #mission_box_cfg{
        mission_id=32003,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-4725"]},#mission_box_item{chance=100,awards=["9-1027"]},#mission_box_item{chance=100,awards=["12-2273"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32003,5}) ->
    #mission_box_cfg{
        mission_id=32003,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-4712"]},#mission_box_item{chance=100,awards=["9-1042"]},#mission_box_item{chance=100,awards=["12-2306"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32003,4}) ->
    #mission_box_cfg{
        mission_id=32003,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-4697"]},#mission_box_item{chance=100,awards=["9-1056"]},#mission_box_item{chance=100,awards=["12-2336"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32003,3}) ->
    #mission_box_cfg{
        mission_id=32003,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-4680"]},#mission_box_item{chance=100,awards=["9-1069"]},#mission_box_item{chance=100,awards=["12-2365"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32003,2}) ->
    #mission_box_cfg{
        mission_id=32003,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-4661"]},#mission_box_item{chance=100,awards=["9-1084"]},#mission_box_item{chance=100,awards=["12-2398"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32003,1}) ->
    #mission_box_cfg{
        mission_id=32003,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-4640"]},#mission_box_item{chance=100,awards=["9-1097"]},#mission_box_item{chance=100,awards=["12-2427"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32004,6}) ->
    #mission_box_cfg{
        mission_id=32004,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-4389"]},#mission_box_item{chance=100,awards=["9-1056"]},#mission_box_item{chance=100,awards=["12-2336"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32004,5}) ->
    #mission_box_cfg{
        mission_id=32004,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-4368"]},#mission_box_item{chance=100,awards=["9-1069"]},#mission_box_item{chance=100,awards=["12-2365"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32004,4}) ->
    #mission_box_cfg{
        mission_id=32004,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-4345"]},#mission_box_item{chance=100,awards=["9-1084"]},#mission_box_item{chance=100,awards=["12-2398"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32004,3}) ->
    #mission_box_cfg{
        mission_id=32004,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-4320"]},#mission_box_item{chance=100,awards=["9-1097"]},#mission_box_item{chance=100,awards=["12-2427"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32004,2}) ->
    #mission_box_cfg{
        mission_id=32004,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-4293"]},#mission_box_item{chance=100,awards=["9-1110"]},#mission_box_item{chance=100,awards=["12-2456"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32004,1}) ->
    #mission_box_cfg{
        mission_id=32004,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-4264"]},#mission_box_item{chance=100,awards=["9-1123"]},#mission_box_item{chance=100,awards=["12-2485"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32005,6}) ->
    #mission_box_cfg{
        mission_id=32005,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-4029"]},#mission_box_item{chance=100,awards=["9-1084"]},#mission_box_item{chance=100,awards=["12-2398"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32005,5}) ->
    #mission_box_cfg{
        mission_id=32005,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-4000"]},#mission_box_item{chance=100,awards=["9-1097"]},#mission_box_item{chance=100,awards=["12-2427"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32005,4}) ->
    #mission_box_cfg{
        mission_id=32005,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-3969"]},#mission_box_item{chance=100,awards=["9-1110"]},#mission_box_item{chance=100,awards=["12-2456"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32005,3}) ->
    #mission_box_cfg{
        mission_id=32005,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-3936"]},#mission_box_item{chance=100,awards=["9-1123"]},#mission_box_item{chance=100,awards=["12-2485"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32005,2}) ->
    #mission_box_cfg{
        mission_id=32005,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-3901"]},#mission_box_item{chance=100,awards=["9-1138"]},#mission_box_item{chance=100,awards=["12-2518"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32005,1}) ->
    #mission_box_cfg{
        mission_id=32005,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-3864"]},#mission_box_item{chance=100,awards=["9-1151"]},#mission_box_item{chance=100,awards=["12-2547"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({31015,6}) ->
    #mission_box_cfg{
        mission_id=31015,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1855"]},#mission_box_item{chance=100,awards=["9-480"]},#mission_box_item{chance=100,awards=["12-1062"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31015,5}) ->
    #mission_box_cfg{
        mission_id=31015,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1872"]},#mission_box_item{chance=100,awards=["9-493"]},#mission_box_item{chance=100,awards=["12-1091"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31015,4}) ->
    #mission_box_cfg{
        mission_id=31015,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1887"]},#mission_box_item{chance=100,awards=["9-506"]},#mission_box_item{chance=100,awards=["12-1120"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31015,3}) ->
    #mission_box_cfg{
        mission_id=31015,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1900"]},#mission_box_item{chance=100,awards=["9-521"]},#mission_box_item{chance=100,awards=["12-1153"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31015,2}) ->
    #mission_box_cfg{
        mission_id=31015,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1911"]},#mission_box_item{chance=100,awards=["9-534"]},#mission_box_item{chance=100,awards=["12-1182"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31015,1}) ->
    #mission_box_cfg{
        mission_id=31015,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1920"]},#mission_box_item{chance=100,awards=["9-547"]},#mission_box_item{chance=100,awards=["12-1211"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31016,6}) ->
    #mission_box_cfg{
        mission_id=31016,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1692"]},#mission_box_item{chance=100,awards=["9-493"]},#mission_box_item{chance=100,awards=["12-1091"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31016,5}) ->
    #mission_box_cfg{
        mission_id=31016,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1702"]},#mission_box_item{chance=100,awards=["9-506"]},#mission_box_item{chance=100,awards=["12-1120"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31016,4}) ->
    #mission_box_cfg{
        mission_id=31016,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1710"]},#mission_box_item{chance=100,awards=["9-521"]},#mission_box_item{chance=100,awards=["12-1153"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31016,3}) ->
    #mission_box_cfg{
        mission_id=31016,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1716"]},#mission_box_item{chance=100,awards=["9-534"]},#mission_box_item{chance=100,awards=["12-1182"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31016,2}) ->
    #mission_box_cfg{
        mission_id=31016,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1720"]},#mission_box_item{chance=100,awards=["9-547"]},#mission_box_item{chance=100,awards=["12-1211"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31016,1}) ->
    #mission_box_cfg{
        mission_id=31016,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1722"]},#mission_box_item{chance=100,awards=["9-561"]},#mission_box_item{chance=100,awards=["12-1241"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31017,6}) ->
    #mission_box_cfg{
        mission_id=31017,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1517"]},#mission_box_item{chance=100,awards=["9-506"]},#mission_box_item{chance=100,awards=["12-1120"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31017,5}) ->
    #mission_box_cfg{
        mission_id=31017,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1520"]},#mission_box_item{chance=100,awards=["9-521"]},#mission_box_item{chance=100,awards=["12-1153"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31017,4}) ->
    #mission_box_cfg{
        mission_id=31017,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1521"]},#mission_box_item{chance=100,awards=["9-534"]},#mission_box_item{chance=100,awards=["12-1182"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31017,3}) ->
    #mission_box_cfg{
        mission_id=31017,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1520"]},#mission_box_item{chance=100,awards=["9-547"]},#mission_box_item{chance=100,awards=["12-1211"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31017,2}) ->
    #mission_box_cfg{
        mission_id=31017,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1599"]},#mission_box_item{chance=100,awards=["9-561"]},#mission_box_item{chance=100,awards=["12-1241"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31017,1}) ->
    #mission_box_cfg{
        mission_id=31017,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1680"]},#mission_box_item{chance=100,awards=["9-575"]},#mission_box_item{chance=100,awards=["12-1273"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31018,6}) ->
    #mission_box_cfg{
        mission_id=31018,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1558"]},#mission_box_item{chance=100,awards=["9-521"]},#mission_box_item{chance=100,awards=["12-1153"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31018,5}) ->
    #mission_box_cfg{
        mission_id=31018,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1638"]},#mission_box_item{chance=100,awards=["9-534"]},#mission_box_item{chance=100,awards=["12-1182"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31018,4}) ->
    #mission_box_cfg{
        mission_id=31018,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1720"]},#mission_box_item{chance=100,awards=["9-547"]},#mission_box_item{chance=100,awards=["12-1211"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31018,3}) ->
    #mission_box_cfg{
        mission_id=31018,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1804"]},#mission_box_item{chance=100,awards=["9-561"]},#mission_box_item{chance=100,awards=["12-1241"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31018,2}) ->
    #mission_box_cfg{
        mission_id=31018,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1890"]},#mission_box_item{chance=100,awards=["9-575"]},#mission_box_item{chance=100,awards=["12-1273"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31018,1}) ->
    #mission_box_cfg{
        mission_id=31018,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1978"]},#mission_box_item{chance=100,awards=["9-589"]},#mission_box_item{chance=100,awards=["12-1303"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31019,6}) ->
    #mission_box_cfg{
        mission_id=31019,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-1833"]},#mission_box_item{chance=100,awards=["9-534"]},#mission_box_item{chance=100,awards=["12-1182"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31019,5}) ->
    #mission_box_cfg{
        mission_id=31019,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1920"]},#mission_box_item{chance=100,awards=["9-547"]},#mission_box_item{chance=100,awards=["12-1211"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31019,4}) ->
    #mission_box_cfg{
        mission_id=31019,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2009"]},#mission_box_item{chance=100,awards=["9-561"]},#mission_box_item{chance=100,awards=["12-1241"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31019,3}) ->
    #mission_box_cfg{
        mission_id=31019,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2100"]},#mission_box_item{chance=100,awards=["9-575"]},#mission_box_item{chance=100,awards=["12-1273"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31019,2}) ->
    #mission_box_cfg{
        mission_id=31019,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2193"]},#mission_box_item{chance=100,awards=["9-589"]},#mission_box_item{chance=100,awards=["12-1303"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31019,1}) ->
    #mission_box_cfg{
        mission_id=31019,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2288"]},#mission_box_item{chance=100,awards=["9-602"]},#mission_box_item{chance=100,awards=["12-1332"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31020,6}) ->
    #mission_box_cfg{
        mission_id=31020,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2120"]},#mission_box_item{chance=100,awards=["9-547"]},#mission_box_item{chance=100,awards=["12-1211"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31020,5}) ->
    #mission_box_cfg{
        mission_id=31020,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2214"]},#mission_box_item{chance=100,awards=["9-561"]},#mission_box_item{chance=100,awards=["12-1241"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31020,4}) ->
    #mission_box_cfg{
        mission_id=31020,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2310"]},#mission_box_item{chance=100,awards=["9-575"]},#mission_box_item{chance=100,awards=["12-1273"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31020,3}) ->
    #mission_box_cfg{
        mission_id=31020,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2408"]},#mission_box_item{chance=100,awards=["9-589"]},#mission_box_item{chance=100,awards=["12-1303"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31020,2}) ->
    #mission_box_cfg{
        mission_id=31020,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2508"]},#mission_box_item{chance=100,awards=["9-602"]},#mission_box_item{chance=100,awards=["12-1332"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({31020,1}) ->
    #mission_box_cfg{
        mission_id=31020,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2610"]},#mission_box_item{chance=100,awards=["9-617"]},#mission_box_item{chance=100,awards=["12-1365"]},#mission_box_item{chance=6,awards=["5-20"]}]};

get({32006,6}) ->
    #mission_box_cfg{
        mission_id=32006,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-3245"]},#mission_box_item{chance=100,awards=["9-754"]},#mission_box_item{chance=100,awards=["12-1668"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32006,5}) ->
    #mission_box_cfg{
        mission_id=32006,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-3360"]},#mission_box_item{chance=100,awards=["9-767"]},#mission_box_item{chance=100,awards=["12-1697"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32006,4}) ->
    #mission_box_cfg{
        mission_id=32006,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-3477"]},#mission_box_item{chance=100,awards=["9-782"]},#mission_box_item{chance=100,awards=["12-1730"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32006,3}) ->
    #mission_box_cfg{
        mission_id=32006,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-3596"]},#mission_box_item{chance=100,awards=["9-795"]},#mission_box_item{chance=100,awards=["12-1759"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32006,2}) ->
    #mission_box_cfg{
        mission_id=32006,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-3717"]},#mission_box_item{chance=100,awards=["9-808"]},#mission_box_item{chance=100,awards=["12-1788"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32006,1}) ->
    #mission_box_cfg{
        mission_id=32006,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-3840"]},#mission_box_item{chance=100,awards=["9-821"]},#mission_box_item{chance=100,awards=["12-1817"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32007,6}) ->
    #mission_box_cfg{
        mission_id=32007,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-3705"]},#mission_box_item{chance=100,awards=["9-782"]},#mission_box_item{chance=100,awards=["12-1730"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32007,5}) ->
    #mission_box_cfg{
        mission_id=32007,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-3828"]},#mission_box_item{chance=100,awards=["9-795"]},#mission_box_item{chance=100,awards=["12-1759"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32007,4}) ->
    #mission_box_cfg{
        mission_id=32007,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-3953"]},#mission_box_item{chance=100,awards=["9-808"]},#mission_box_item{chance=100,awards=["12-1788"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32007,3}) ->
    #mission_box_cfg{
        mission_id=32007,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-4080"]},#mission_box_item{chance=100,awards=["9-821"]},#mission_box_item{chance=100,awards=["12-1817"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32007,2}) ->
    #mission_box_cfg{
        mission_id=32007,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-4209"]},#mission_box_item{chance=100,awards=["9-836"]},#mission_box_item{chance=100,awards=["12-1850"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32007,1}) ->
    #mission_box_cfg{
        mission_id=32007,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-4340"]},#mission_box_item{chance=100,awards=["9-849"]},#mission_box_item{chance=100,awards=["12-1879"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32008,6}) ->
    #mission_box_cfg{
        mission_id=32008,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-4071"]},#mission_box_item{chance=100,awards=["9-808"]},#mission_box_item{chance=100,awards=["12-1788"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32008,5}) ->
    #mission_box_cfg{
        mission_id=32008,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-4080"]},#mission_box_item{chance=100,awards=["9-821"]},#mission_box_item{chance=100,awards=["12-1817"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32008,4}) ->
    #mission_box_cfg{
        mission_id=32008,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-4087"]},#mission_box_item{chance=100,awards=["9-836"]},#mission_box_item{chance=100,awards=["12-1850"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32008,3}) ->
    #mission_box_cfg{
        mission_id=32008,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-4092"]},#mission_box_item{chance=100,awards=["9-849"]},#mission_box_item{chance=100,awards=["12-1879"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32008,2}) ->
    #mission_box_cfg{
        mission_id=32008,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-4095"]},#mission_box_item{chance=100,awards=["9-862"]},#mission_box_item{chance=100,awards=["12-1908"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32008,1}) ->
    #mission_box_cfg{
        mission_id=32008,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-4096"]},#mission_box_item{chance=100,awards=["9-877"]},#mission_box_item{chance=100,awards=["12-1941"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32009,6}) ->
    #mission_box_cfg{
        mission_id=32009,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-4725"]},#mission_box_item{chance=100,awards=["9-1027"]},#mission_box_item{chance=100,awards=["12-2273"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32009,5}) ->
    #mission_box_cfg{
        mission_id=32009,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-4712"]},#mission_box_item{chance=100,awards=["9-1042"]},#mission_box_item{chance=100,awards=["12-2306"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32009,4}) ->
    #mission_box_cfg{
        mission_id=32009,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-4697"]},#mission_box_item{chance=100,awards=["9-1056"]},#mission_box_item{chance=100,awards=["12-2336"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32009,3}) ->
    #mission_box_cfg{
        mission_id=32009,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-4680"]},#mission_box_item{chance=100,awards=["9-1069"]},#mission_box_item{chance=100,awards=["12-2365"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32009,2}) ->
    #mission_box_cfg{
        mission_id=32009,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-4661"]},#mission_box_item{chance=100,awards=["9-1084"]},#mission_box_item{chance=100,awards=["12-2398"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32009,1}) ->
    #mission_box_cfg{
        mission_id=32009,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-4640"]},#mission_box_item{chance=100,awards=["9-1097"]},#mission_box_item{chance=100,awards=["12-2427"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32010,6}) ->
    #mission_box_cfg{
        mission_id=32010,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-4389"]},#mission_box_item{chance=100,awards=["9-1056"]},#mission_box_item{chance=100,awards=["12-2336"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32010,5}) ->
    #mission_box_cfg{
        mission_id=32010,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-4368"]},#mission_box_item{chance=100,awards=["9-1069"]},#mission_box_item{chance=100,awards=["12-2365"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32010,4}) ->
    #mission_box_cfg{
        mission_id=32010,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-4345"]},#mission_box_item{chance=100,awards=["9-1084"]},#mission_box_item{chance=100,awards=["12-2398"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32010,3}) ->
    #mission_box_cfg{
        mission_id=32010,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-4320"]},#mission_box_item{chance=100,awards=["9-1097"]},#mission_box_item{chance=100,awards=["12-2427"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32010,2}) ->
    #mission_box_cfg{
        mission_id=32010,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-4293"]},#mission_box_item{chance=100,awards=["9-1110"]},#mission_box_item{chance=100,awards=["12-2456"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32010,1}) ->
    #mission_box_cfg{
        mission_id=32010,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-4264"]},#mission_box_item{chance=100,awards=["9-1123"]},#mission_box_item{chance=100,awards=["12-2485"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32011,6}) ->
    #mission_box_cfg{
        mission_id=32011,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-4029"]},#mission_box_item{chance=100,awards=["9-1084"]},#mission_box_item{chance=100,awards=["12-2398"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32011,5}) ->
    #mission_box_cfg{
        mission_id=32011,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-4000"]},#mission_box_item{chance=100,awards=["9-1097"]},#mission_box_item{chance=100,awards=["12-2427"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32011,4}) ->
    #mission_box_cfg{
        mission_id=32011,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-3969"]},#mission_box_item{chance=100,awards=["9-1110"]},#mission_box_item{chance=100,awards=["12-2456"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32011,3}) ->
    #mission_box_cfg{
        mission_id=32011,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-3936"]},#mission_box_item{chance=100,awards=["9-1123"]},#mission_box_item{chance=100,awards=["12-2485"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32011,2}) ->
    #mission_box_cfg{
        mission_id=32011,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-3901"]},#mission_box_item{chance=100,awards=["9-1138"]},#mission_box_item{chance=100,awards=["12-2518"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({32011,1}) ->
    #mission_box_cfg{
        mission_id=32011,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-3864"]},#mission_box_item{chance=100,awards=["9-1151"]},#mission_box_item{chance=100,awards=["12-2547"]},#mission_box_item{chance=6,awards=["5-50"]}]};

get({34032,6}) ->
    #mission_box_cfg{
        mission_id=34032,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-2000"]},#mission_box_item{chance=100,awards=["4-2400"]},#mission_box_item{chance=100,awards=["4-2900"]},#mission_box_item{chance=6,awards=["4-3500"]}]};

get({34032,5}) ->
    #mission_box_cfg{
        mission_id=34032,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-1800"]},#mission_box_item{chance=100,awards=["4-2200"]},#mission_box_item{chance=100,awards=["4-2600"]},#mission_box_item{chance=6,awards=["4-3100"]}]};

get({34032,4}) ->
    #mission_box_cfg{
        mission_id=34032,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-1600"]},#mission_box_item{chance=100,awards=["4-1900"]},#mission_box_item{chance=100,awards=["4-2300"]},#mission_box_item{chance=6,awards=["4-2800"]}]};

get({34032,3}) ->
    #mission_box_cfg{
        mission_id=34032,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-1400"]},#mission_box_item{chance=100,awards=["4-1700"]},#mission_box_item{chance=100,awards=["4-2000"]},#mission_box_item{chance=6,awards=["4-2400"]}]};

get({34032,2}) ->
    #mission_box_cfg{
        mission_id=34032,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1200"]},#mission_box_item{chance=100,awards=["4-1400"]},#mission_box_item{chance=100,awards=["4-1700"]},#mission_box_item{chance=6,awards=["4-2000"]}]};

get({34032,1}) ->
    #mission_box_cfg{
        mission_id=34032,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1000"]},#mission_box_item{chance=100,awards=["4-1200"]},#mission_box_item{chance=100,awards=["4-1400"]},#mission_box_item{chance=6,awards=["4-1700"]}]};

get({34031,6}) ->
    #mission_box_cfg{
        mission_id=34031,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-4000"]},#mission_box_item{chance=100,awards=["4-4800"]},#mission_box_item{chance=100,awards=["4-5800"]},#mission_box_item{chance=6,awards=["4-7000"]}]};

get({34031,5}) ->
    #mission_box_cfg{
        mission_id=34031,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-3600"]},#mission_box_item{chance=100,awards=["4-4300"]},#mission_box_item{chance=100,awards=["4-5200"]},#mission_box_item{chance=6,awards=["4-6200"]}]};

get({34031,4}) ->
    #mission_box_cfg{
        mission_id=34031,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-3200"]},#mission_box_item{chance=100,awards=["4-3800"]},#mission_box_item{chance=100,awards=["4-4600"]},#mission_box_item{chance=6,awards=["4-5500"]}]};

get({34031,3}) ->
    #mission_box_cfg{
        mission_id=34031,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2800"]},#mission_box_item{chance=100,awards=["4-3400"]},#mission_box_item{chance=100,awards=["4-4100"]},#mission_box_item{chance=6,awards=["4-4900"]}]};

get({34031,2}) ->
    #mission_box_cfg{
        mission_id=34031,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-2400"]},#mission_box_item{chance=100,awards=["4-2900"]},#mission_box_item{chance=100,awards=["4-3500"]},#mission_box_item{chance=6,awards=["4-4200"]}]};

get({34031,1}) ->
    #mission_box_cfg{
        mission_id=34031,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-2000"]},#mission_box_item{chance=100,awards=["4-2400"]},#mission_box_item{chance=100,awards=["4-2900"]},#mission_box_item{chance=6,awards=["4-3500"]}]};

get({34030,6}) ->
    #mission_box_cfg{
        mission_id=34030,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-8000"]},#mission_box_item{chance=100,awards=["4-9600"]},#mission_box_item{chance=100,awards=["4-11500"]},#mission_box_item{chance=6,awards=["4-13800"]}]};

get({34030,5}) ->
    #mission_box_cfg{
        mission_id=34030,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-7200"]},#mission_box_item{chance=100,awards=["4-8600"]},#mission_box_item{chance=100,awards=["4-10300"]},#mission_box_item{chance=6,awards=["4-12400"]}]};

get({34030,4}) ->
    #mission_box_cfg{
        mission_id=34030,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-6400"]},#mission_box_item{chance=100,awards=["4-7700"]},#mission_box_item{chance=100,awards=["4-9200"]},#mission_box_item{chance=6,awards=["4-11000"]}]};

get({34030,3}) ->
    #mission_box_cfg{
        mission_id=34030,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-5600"]},#mission_box_item{chance=100,awards=["4-6700"]},#mission_box_item{chance=100,awards=["4-8000"]},#mission_box_item{chance=6,awards=["4-9600"]}]};

get({34030,2}) ->
    #mission_box_cfg{
        mission_id=34030,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-4800"]},#mission_box_item{chance=100,awards=["4-5800"]},#mission_box_item{chance=100,awards=["4-7000"]},#mission_box_item{chance=6,awards=["4-8400"]}]};

get({34030,1}) ->
    #mission_box_cfg{
        mission_id=34030,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-4000"]},#mission_box_item{chance=100,awards=["4-4800"]},#mission_box_item{chance=100,awards=["4-5800"]},#mission_box_item{chance=6,awards=["4-7000"]}]};

get({34022,6}) ->
    #mission_box_cfg{
        mission_id=34022,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["12-500"]},#mission_box_item{chance=100,awards=["12-600"]},#mission_box_item{chance=100,awards=["12-700"]},#mission_box_item{chance=6,awards=["12-800"]}]};

get({34022,5}) ->
    #mission_box_cfg{
        mission_id=34022,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["12-450"]},#mission_box_item{chance=100,awards=["12-500"]},#mission_box_item{chance=100,awards=["12-600"]},#mission_box_item{chance=6,awards=["12-700"]}]};

get({34022,4}) ->
    #mission_box_cfg{
        mission_id=34022,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["12-400"]},#mission_box_item{chance=100,awards=["12-500"]},#mission_box_item{chance=100,awards=["12-600"]},#mission_box_item{chance=6,awards=["12-700"]}]};

get({34022,3}) ->
    #mission_box_cfg{
        mission_id=34022,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["12-350"]},#mission_box_item{chance=100,awards=["12-400"]},#mission_box_item{chance=100,awards=["12-500"]},#mission_box_item{chance=6,awards=["12-600"]}]};

get({34022,2}) ->
    #mission_box_cfg{
        mission_id=34022,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["12-300"]},#mission_box_item{chance=100,awards=["12-400"]},#mission_box_item{chance=100,awards=["12-500"]},#mission_box_item{chance=6,awards=["12-600"]}]};

get({34022,1}) ->
    #mission_box_cfg{
        mission_id=34022,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["12-250"]},#mission_box_item{chance=100,awards=["12-300"]},#mission_box_item{chance=100,awards=["12-400"]},#mission_box_item{chance=6,awards=["12-500"]}]};

get({34021,6}) ->
    #mission_box_cfg{
        mission_id=34021,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["12-1000"]},#mission_box_item{chance=100,awards=["12-1200"]},#mission_box_item{chance=100,awards=["12-1400"]},#mission_box_item{chance=6,awards=["12-1700"]}]};

get({34021,5}) ->
    #mission_box_cfg{
        mission_id=34021,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["12-900"]},#mission_box_item{chance=100,awards=["12-1100"]},#mission_box_item{chance=100,awards=["12-1300"]},#mission_box_item{chance=6,awards=["12-1600"]}]};

get({34021,4}) ->
    #mission_box_cfg{
        mission_id=34021,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["12-800"]},#mission_box_item{chance=100,awards=["12-1000"]},#mission_box_item{chance=100,awards=["12-1200"]},#mission_box_item{chance=6,awards=["12-1400"]}]};

get({34021,3}) ->
    #mission_box_cfg{
        mission_id=34021,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["12-700"]},#mission_box_item{chance=100,awards=["12-800"]},#mission_box_item{chance=100,awards=["12-1000"]},#mission_box_item{chance=6,awards=["12-1200"]}]};

get({34021,2}) ->
    #mission_box_cfg{
        mission_id=34021,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["12-600"]},#mission_box_item{chance=100,awards=["12-700"]},#mission_box_item{chance=100,awards=["12-800"]},#mission_box_item{chance=6,awards=["12-1000"]}]};

get({34021,1}) ->
    #mission_box_cfg{
        mission_id=34021,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["12-500"]},#mission_box_item{chance=100,awards=["12-600"]},#mission_box_item{chance=100,awards=["12-700"]},#mission_box_item{chance=6,awards=["12-800"]}]};

get({34020,6}) ->
    #mission_box_cfg{
        mission_id=34020,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["12-2000"]},#mission_box_item{chance=100,awards=["12-2400"]},#mission_box_item{chance=100,awards=["12-2900"]},#mission_box_item{chance=6,awards=["12-3500"]}]};

get({34020,5}) ->
    #mission_box_cfg{
        mission_id=34020,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["12-1800"]},#mission_box_item{chance=100,awards=["12-2200"]},#mission_box_item{chance=100,awards=["12-2600"]},#mission_box_item{chance=6,awards=["12-3100"]}]};

get({34020,4}) ->
    #mission_box_cfg{
        mission_id=34020,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["12-1600"]},#mission_box_item{chance=100,awards=["12-1900"]},#mission_box_item{chance=100,awards=["12-2300"]},#mission_box_item{chance=6,awards=["12-2800"]}]};

get({34020,3}) ->
    #mission_box_cfg{
        mission_id=34020,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["12-1400"]},#mission_box_item{chance=100,awards=["12-1700"]},#mission_box_item{chance=100,awards=["12-2000"]},#mission_box_item{chance=6,awards=["12-2400"]}]};

get({34020,2}) ->
    #mission_box_cfg{
        mission_id=34020,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["12-1200"]},#mission_box_item{chance=100,awards=["12-1400"]},#mission_box_item{chance=100,awards=["12-1700"]},#mission_box_item{chance=6,awards=["12-2000"]}]};

get({34020,1}) ->
    #mission_box_cfg{
        mission_id=34020,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["12-1000"]},#mission_box_item{chance=100,awards=["12-1200"]},#mission_box_item{chance=100,awards=["12-1400"]},#mission_box_item{chance=6,awards=["12-1700"]}]};

get({34012,6}) ->
    #mission_box_cfg{
        mission_id=34012,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["9-300"]},#mission_box_item{chance=100,awards=["9-400"]},#mission_box_item{chance=100,awards=["9-500"]},#mission_box_item{chance=6,awards=["9-600"]}]};

get({34012,5}) ->
    #mission_box_cfg{
        mission_id=34012,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["9-270"]},#mission_box_item{chance=100,awards=["9-300"]},#mission_box_item{chance=100,awards=["9-400"]},#mission_box_item{chance=6,awards=["9-500"]}]};

get({34012,4}) ->
    #mission_box_cfg{
        mission_id=34012,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["9-240"]},#mission_box_item{chance=100,awards=["9-300"]},#mission_box_item{chance=100,awards=["9-400"]},#mission_box_item{chance=6,awards=["9-500"]}]};

get({34012,3}) ->
    #mission_box_cfg{
        mission_id=34012,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["9-210"]},#mission_box_item{chance=100,awards=["9-300"]},#mission_box_item{chance=100,awards=["9-400"]},#mission_box_item{chance=6,awards=["9-500"]}]};

get({34012,2}) ->
    #mission_box_cfg{
        mission_id=34012,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["9-180"]},#mission_box_item{chance=100,awards=["9-200"]},#mission_box_item{chance=100,awards=["9-200"]},#mission_box_item{chance=6,awards=["9-200"]}]};

get({34012,1}) ->
    #mission_box_cfg{
        mission_id=34012,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["9-150"]},#mission_box_item{chance=100,awards=["9-200"]},#mission_box_item{chance=100,awards=["9-200"]},#mission_box_item{chance=6,awards=["9-200"]}]};

get({34011,6}) ->
    #mission_box_cfg{
        mission_id=34011,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["9-600"]},#mission_box_item{chance=100,awards=["9-700"]},#mission_box_item{chance=100,awards=["9-800"]},#mission_box_item{chance=6,awards=["9-1000"]}]};

get({34011,5}) ->
    #mission_box_cfg{
        mission_id=34011,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["9-540"]},#mission_box_item{chance=100,awards=["9-600"]},#mission_box_item{chance=100,awards=["9-700"]},#mission_box_item{chance=6,awards=["9-800"]}]};

get({34011,4}) ->
    #mission_box_cfg{
        mission_id=34011,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["9-480"]},#mission_box_item{chance=100,awards=["9-600"]},#mission_box_item{chance=100,awards=["9-700"]},#mission_box_item{chance=6,awards=["9-800"]}]};

get({34011,3}) ->
    #mission_box_cfg{
        mission_id=34011,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["9-420"]},#mission_box_item{chance=100,awards=["9-500"]},#mission_box_item{chance=100,awards=["9-600"]},#mission_box_item{chance=6,awards=["9-700"]}]};

get({34011,2}) ->
    #mission_box_cfg{
        mission_id=34011,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["9-360"]},#mission_box_item{chance=100,awards=["9-400"]},#mission_box_item{chance=100,awards=["9-500"]},#mission_box_item{chance=6,awards=["9-600"]}]};

get({34011,1}) ->
    #mission_box_cfg{
        mission_id=34011,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["9-300"]},#mission_box_item{chance=100,awards=["9-400"]},#mission_box_item{chance=100,awards=["9-500"]},#mission_box_item{chance=6,awards=["9-600"]}]};

get({34010,6}) ->
    #mission_box_cfg{
        mission_id=34010,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["9-1200"]},#mission_box_item{chance=100,awards=["9-1400"]},#mission_box_item{chance=100,awards=["9-1700"]},#mission_box_item{chance=6,awards=["9-2000"]}]};

get({34010,5}) ->
    #mission_box_cfg{
        mission_id=34010,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["9-1080"]},#mission_box_item{chance=100,awards=["9-1300"]},#mission_box_item{chance=100,awards=["9-1600"]},#mission_box_item{chance=6,awards=["9-1900"]}]};

get({34010,4}) ->
    #mission_box_cfg{
        mission_id=34010,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["9-960"]},#mission_box_item{chance=100,awards=["9-1200"]},#mission_box_item{chance=100,awards=["9-1400"]},#mission_box_item{chance=6,awards=["9-1700"]}]};

get({34010,3}) ->
    #mission_box_cfg{
        mission_id=34010,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["9-840"]},#mission_box_item{chance=100,awards=["9-1000"]},#mission_box_item{chance=100,awards=["9-1200"]},#mission_box_item{chance=6,awards=["9-1400"]}]};

get({34010,2}) ->
    #mission_box_cfg{
        mission_id=34010,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["9-720"]},#mission_box_item{chance=100,awards=["9-900"]},#mission_box_item{chance=100,awards=["9-1100"]},#mission_box_item{chance=6,awards=["9-1300"]}]};

get({34010,1}) ->
    #mission_box_cfg{
        mission_id=34010,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["9-600"]},#mission_box_item{chance=100,awards=["9-700"]},#mission_box_item{chance=100,awards=["9-800"]},#mission_box_item{chance=6,awards=["9-1000"]}]};

get({34002,6}) ->
    #mission_box_cfg{
        mission_id=34002,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-3000"]},#mission_box_item{chance=100,awards=["4-3600"]},#mission_box_item{chance=100,awards=["4-4300"]},#mission_box_item{chance=6,awards=["4-5200"]}]};

get({34002,5}) ->
    #mission_box_cfg{
        mission_id=34002,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-2700"]},#mission_box_item{chance=100,awards=["4-3200"]},#mission_box_item{chance=100,awards=["4-3800"]},#mission_box_item{chance=6,awards=["4-4600"]}]};

get({34002,4}) ->
    #mission_box_cfg{
        mission_id=34002,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-2400"]},#mission_box_item{chance=100,awards=["4-2900"]},#mission_box_item{chance=100,awards=["4-3500"]},#mission_box_item{chance=6,awards=["4-4200"]}]};

get({34002,3}) ->
    #mission_box_cfg{
        mission_id=34002,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-2100"]},#mission_box_item{chance=100,awards=["4-2500"]},#mission_box_item{chance=100,awards=["4-3000"]},#mission_box_item{chance=6,awards=["4-3600"]}]};

get({34002,2}) ->
    #mission_box_cfg{
        mission_id=34002,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-1800"]},#mission_box_item{chance=100,awards=["4-2200"]},#mission_box_item{chance=100,awards=["4-2600"]},#mission_box_item{chance=6,awards=["4-3100"]}]};

get({34002,1}) ->
    #mission_box_cfg{
        mission_id=34002,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-1500"]},#mission_box_item{chance=100,awards=["4-1800"]},#mission_box_item{chance=100,awards=["4-2200"]},#mission_box_item{chance=6,awards=["4-2600"]}]};

get({34001,6}) ->
    #mission_box_cfg{
        mission_id=34001,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-6000"]},#mission_box_item{chance=100,awards=["4-7200"]},#mission_box_item{chance=100,awards=["4-8600"]},#mission_box_item{chance=6,awards=["4-10300"]}]};

get({34001,5}) ->
    #mission_box_cfg{
        mission_id=34001,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-5400"]},#mission_box_item{chance=100,awards=["4-6500"]},#mission_box_item{chance=100,awards=["4-7800"]},#mission_box_item{chance=6,awards=["4-9400"]}]};

get({34001,4}) ->
    #mission_box_cfg{
        mission_id=34001,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-4800"]},#mission_box_item{chance=100,awards=["4-5800"]},#mission_box_item{chance=100,awards=["4-7000"]},#mission_box_item{chance=6,awards=["4-8400"]}]};

get({34001,3}) ->
    #mission_box_cfg{
        mission_id=34001,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-4200"]},#mission_box_item{chance=100,awards=["4-5000"]},#mission_box_item{chance=100,awards=["4-6000"]},#mission_box_item{chance=6,awards=["4-7200"]}]};

get({34001,2}) ->
    #mission_box_cfg{
        mission_id=34001,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-3600"]},#mission_box_item{chance=100,awards=["4-4300"]},#mission_box_item{chance=100,awards=["4-5200"]},#mission_box_item{chance=6,awards=["4-6200"]}]};

get({34001,1}) ->
    #mission_box_cfg{
        mission_id=34001,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-3000"]},#mission_box_item{chance=100,awards=["4-3600"]},#mission_box_item{chance=100,awards=["4-4300"]},#mission_box_item{chance=6,awards=["4-5200"]}]};

get({34000,6}) ->
    #mission_box_cfg{
        mission_id=34000,
        star=6,
        groups=[#mission_box_item{chance=120,awards=["4-12000"]},#mission_box_item{chance=100,awards=["4-14400"]},#mission_box_item{chance=100,awards=["4-17300"]},#mission_box_item{chance=6,awards=["4-20800"]}]};

get({34000,5}) ->
    #mission_box_cfg{
        mission_id=34000,
        star=5,
        groups=[#mission_box_item{chance=120,awards=["4-10800"]},#mission_box_item{chance=100,awards=["4-13000"]},#mission_box_item{chance=100,awards=["4-15600"]},#mission_box_item{chance=6,awards=["4-18700"]}]};

get({34000,4}) ->
    #mission_box_cfg{
        mission_id=34000,
        star=4,
        groups=[#mission_box_item{chance=120,awards=["4-9600"]},#mission_box_item{chance=100,awards=["4-11500"]},#mission_box_item{chance=100,awards=["4-13800"]},#mission_box_item{chance=6,awards=["4-16600"]}]};

get({34000,3}) ->
    #mission_box_cfg{
        mission_id=34000,
        star=3,
        groups=[#mission_box_item{chance=120,awards=["4-8400"]},#mission_box_item{chance=100,awards=["4-10100"]},#mission_box_item{chance=100,awards=["4-12100"]},#mission_box_item{chance=6,awards=["4-14500"]}]};

get({34000,2}) ->
    #mission_box_cfg{
        mission_id=34000,
        star=2,
        groups=[#mission_box_item{chance=120,awards=["4-7200"]},#mission_box_item{chance=100,awards=["4-8600"]},#mission_box_item{chance=100,awards=["4-10300"]},#mission_box_item{chance=6,awards=["4-12400"]}]};

get({34000,1}) ->
    #mission_box_cfg{
        mission_id=34000,
        star=1,
        groups=[#mission_box_item{chance=120,awards=["4-6000"]},#mission_box_item{chance=100,awards=["4-7200"]},#mission_box_item{chance=100,awards=["4-8600"]},#mission_box_item{chance=6,awards=["4-10300"]}]};

get(_) -> false.


