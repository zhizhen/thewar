-module(gift_cfg).
-include("cfg_record.hrl").
-export([get/1]).

get(76000) ->
    #gift_cfg{
        item_id=76000,
        items=["76001-1", "4-10000"]};

get(76001) ->
    #gift_cfg{
        item_id=76001,
        items=["76002-1", "4-30000", "77052-1"]};

get(76002) ->
    #gift_cfg{
        item_id=76002,
        items=["76003-1", "4-50000", "77052-1", "77114-1", "73000-10", "73001-10", "73002-10"]};

get(76003) ->
    #gift_cfg{
        item_id=76003,
        items=["76004-1", "4-70000", "77052-1", "72002-1"]};

get(76004) ->
    #gift_cfg{
        item_id=76004,
        items=["76005-1", "4-100000", "77053-1", "72012-1", "72022-1"]};

get(76005) ->
    #gift_cfg{
        item_id=76005,
        items=["76006-1", "4-150000", "77053-1", "72042-1", "72032-1"]};

get(76006) ->
    #gift_cfg{
        item_id=76006,
        items=["76007-1", "4-200000", "77053-1", "72062-1", "72052-1"]};

get(76007) ->
    #gift_cfg{
        item_id=76007,
        items=["76008-1", "4-300000", "77053-1", "72062-1", "72052-1"]};

get(76008) ->
    #gift_cfg{
        item_id=76008,
        items=["76009-1", "4-400000", "9-20000", "12-20000"]};

get(76009) ->
    #gift_cfg{
        item_id=76009,
        items=["76010-1", "4-500000", "9-30000", "12-30000"]};

get(76010) ->
    #gift_cfg{
        item_id=76010,
        items=["5-100", "4-600000", "9-50000", "12-50000"]};

get(76011) ->
    #gift_cfg{
        item_id=76011,
        items=["4-20000"]};

get(76012) ->
    #gift_cfg{
        item_id=76012,
        items=["4-50000", "77105-1"]};

get(76013) ->
    #gift_cfg{
        item_id=76013,
        items=["5-50"]};

get(76014) ->
    #gift_cfg{
        item_id=76014,
        items=["4-50000", "77053-1"]};

get(76015) ->
    #gift_cfg{
        item_id=76015,
        items=["4-100000", "77065-1"]};

get(76016) ->
    #gift_cfg{
        item_id=76016,
        items=["4-100000", "77055-1"]};

get(76017) ->
    #gift_cfg{
        item_id=76017,
        items=["4-100000", "5-100"]};

get(76018) ->
    #gift_cfg{
        item_id=76018,
        items=["72001-1", "72011-1", "72021-1", "72031-1", "72041-1", "72051-1", "72061-1"]};

get(76019) ->
    #gift_cfg{
        item_id=76019,
        items=["72002-1", "72012-1", "72022-1", "72032-1", "72042-1", "72052-1", "72062-1"]};

get(76020) ->
    #gift_cfg{
        item_id=76020,
        items=["72003-1", "72013-1", "72023-1", "72033-1", "72043-1", "72053-1", "72063-1"]};

get(76021) ->
    #gift_cfg{
        item_id=76021,
        items=["72004-1", "72014-1", "72024-1", "72034-1", "72044-1", "72054-1", "72064-1"]};

get(76022) ->
    #gift_cfg{
        item_id=76022,
        items=["4-10000", "76995-1", "77051-1"]};

get(76023) ->
    #gift_cfg{
        item_id=76023,
        items=["4-20000", "76995-1", "77051-1"]};

get(76024) ->
    #gift_cfg{
        item_id=76024,
        items=["4-30000", "76995-1", "77051-1"]};

get(76025) ->
    #gift_cfg{
        item_id=76025,
        items=["4-40000", "76996-1", "77051-1"]};

get(76026) ->
    #gift_cfg{
        item_id=76026,
        items=["4-50000", "76996-1", "77052-1"]};

get(76027) ->
    #gift_cfg{
        item_id=76027,
        items=["4-60000", "76996-1", "77052-1"]};

get(76028) ->
    #gift_cfg{
        item_id=76028,
        items=["4-70000", "76997-1", "77052-1"]};

get(76029) ->
    #gift_cfg{
        item_id=76029,
        items=["4-80000", "76997-1", "77053-1"]};

get(76030) ->
    #gift_cfg{
        item_id=76030,
        items=["4-90000", "76997-1", "77053-1"]};

get(76031) ->
    #gift_cfg{
        item_id=76031,
        items=["4-100000", "76998-1", "77053-1"]};

get(76032) ->
    #gift_cfg{
        item_id=76032,
        items=["4-100000", "73100-1", "73101-1", "73102-1"]};

get(76033) ->
    #gift_cfg{
        item_id=76033,
        items=["4-200000", "73103-1", "73104-1", "73105-1"]};

get(76034) ->
    #gift_cfg{
        item_id=76034,
        items=["4-300000", "72021-1", "72011-1", "72041-1", "72031-1"]};

get(76035) ->
    #gift_cfg{
        item_id=76035,
        items=["4-500000", "73106-1", "73107-1", "73108-1"]};

get(76036) ->
    #gift_cfg{
        item_id=76036,
        items=["4-800000", "73109-1", "73110-1", "73111-1"]};

get(76037) ->
    #gift_cfg{
        item_id=76037,
        items=["4-1000000", "77212-20", "77116-2"]};

get(76038) ->
    #gift_cfg{
        item_id=76038,
        items=["4-1500000", "73304-30", "77109-1"]};

get(76039) ->
    #gift_cfg{
        item_id=76039,
        items=["4-2000000", "73304-50", "77109-1"]};

get(76040) ->
    #gift_cfg{
        item_id=76040,
        items=["4-3000000", "73305-30", "77109-1"]};

get(76041) ->
    #gift_cfg{
        item_id=76041,
        items=["4-5000000", "73305-50", "77109-1"]};

get(76042) ->
    #gift_cfg{
        item_id=76042,
        items=["4-20000", "72010-1", "72020-1", "72030-1", "72040-1", "70036-1"]};

get(76043) ->
    #gift_cfg{
        item_id=76043,
        items=["4-20000", "72010-1", "72020-1", "72030-1", "72040-1", "70042-1"]};

get(76044) ->
    #gift_cfg{
        item_id=76044,
        items=["4-20000", "72010-1", "72020-1", "72030-1", "72040-1", "70048-1"]};

get(76045) ->
    #gift_cfg{
        item_id=76045,
        items=["4-1"]};

get(76050) ->
    #gift_cfg{
        item_id=76050,
        items=["72000-1", "72001-1", "72002-1", "72003-1", "72004-1"]};

get(76051) ->
    #gift_cfg{
        item_id=76051,
        items=["72005-1", "72006-1", "72007-1"]};

get(76052) ->
    #gift_cfg{
        item_id=76052,
        items=["72010-1", "72011-1", "72012-1", "72013-1", "72014-1"]};

get(76053) ->
    #gift_cfg{
        item_id=76053,
        items=["72015-1", "72016-1", "72017-1"]};

get(76054) ->
    #gift_cfg{
        item_id=76054,
        items=["72020-1", "72021-1", "72022-1", "72023-1", "72024-1"]};

get(76055) ->
    #gift_cfg{
        item_id=76055,
        items=["72025-1", "72026-1", "72027-1"]};

get(76056) ->
    #gift_cfg{
        item_id=76056,
        items=["72030-1", "72031-1", "72032-1", "72033-1", "72034-1"]};

get(76057) ->
    #gift_cfg{
        item_id=76057,
        items=["72035-1", "72036-1", "72037-1"]};

get(76058) ->
    #gift_cfg{
        item_id=76058,
        items=["72040-1", "72041-1", "72042-1", "72043-1", "72044-1"]};

get(76059) ->
    #gift_cfg{
        item_id=76059,
        items=["72045-1", "72046-1", "72047-1"]};

get(76060) ->
    #gift_cfg{
        item_id=76060,
        items=["72060-1", "72061-1", "72062-1", "72063-1", "72064-1"]};

get(76061) ->
    #gift_cfg{
        item_id=76061,
        items=["72065-1", "72066-1", "72067-1"]};

get(76062) ->
    #gift_cfg{
        item_id=76062,
        items=["72050-1", "72051-1", "72052-1", "72053-1", "72054-1"]};

get(76063) ->
    #gift_cfg{
        item_id=76063,
        items=["72055-1", "72056-1", "72057-1"]};

get(76046) ->
    #gift_cfg{
        item_id=76046,
        items=["77211-5", "77113-2"]};

get(76100) ->
    #gift_cfg{
        item_id=76100,
        items=["4-100000", "76050-1", "73000-10", "73001-10", "73002-10"]};

get(76101) ->
    #gift_cfg{
        item_id=76101,
        items=["4-200000", "76054-1", "12-20000"]};

get(76102) ->
    #gift_cfg{
        item_id=76102,
        items=["4-300000", "76052-1", "73100-1", "73101-1", "73102-1"]};

get(76103) ->
    #gift_cfg{
        item_id=76103,
        items=["4-500000", "8-50000", "73103-1", "73104-1", "73105-1"]};

get(76104) ->
    #gift_cfg{
        item_id=76104,
        items=["4-800000", "76051-1", "70054-1", "77109-1"]};

get(76105) ->
    #gift_cfg{
        item_id=76105,
        items=["4-1000000", "76057-1", "70055-1"]};

get(76106) ->
    #gift_cfg{
        item_id=76106,
        items=["4-1500000", "76059-1", "70056-1"]};

get(76107) ->
    #gift_cfg{
        item_id=76107,
        items=["4-2000000", "76053-1", "70057-1", "77109-1"]};

get(76108) ->
    #gift_cfg{
        item_id=76108,
        items=["4-3000000", "76055-1", "70058-1", "77109-1"]};

get(76109) ->
    #gift_cfg{
        item_id=76109,
        items=["4-5000000", "76063-1", "70059-1", "77109-2"]};

get(76110) ->
    #gift_cfg{
        item_id=76110,
        items=["4-100000", "76050-1", "73000-10", "73001-10", "73002-10"]};

get(76111) ->
    #gift_cfg{
        item_id=76111,
        items=["4-200000", "76054-1", "12-20000"]};

get(76112) ->
    #gift_cfg{
        item_id=76112,
        items=["4-300000", "76052-1", "73100-1", "73101-1", "73102-1"]};

get(76113) ->
    #gift_cfg{
        item_id=76113,
        items=["4-500000", "8-50000", "73103-1", "73104-1", "73105-1"]};

get(76114) ->
    #gift_cfg{
        item_id=76114,
        items=["4-800000", "76051-1", "70060-1", "77109-1"]};

get(76115) ->
    #gift_cfg{
        item_id=76115,
        items=["4-1000000", "76057-1", "70061-1"]};

get(76116) ->
    #gift_cfg{
        item_id=76116,
        items=["4-1500000", "76059-1", "70062-1"]};

get(76117) ->
    #gift_cfg{
        item_id=76117,
        items=["4-2000000", "76053-1", "70063-1", "77109-1"]};

get(76118) ->
    #gift_cfg{
        item_id=76118,
        items=["4-3000000", "76055-1", "70064-1", "77109-1"]};

get(76119) ->
    #gift_cfg{
        item_id=76119,
        items=["4-5000000", "76063-1", "70065-1", "77109-2"]};

get(76120) ->
    #gift_cfg{
        item_id=76120,
        items=["4-100000", "76050-1", "73000-10", "73001-10", "73002-10"]};

get(76121) ->
    #gift_cfg{
        item_id=76121,
        items=["4-200000", "76054-1", "12-20000"]};

get(76122) ->
    #gift_cfg{
        item_id=76122,
        items=["4-300000", "76052-1", "73100-1", "73101-1", "73102-1"]};

get(76123) ->
    #gift_cfg{
        item_id=76123,
        items=["4-500000", "8-50000", "73103-1", "73104-1", "73105-1"]};

get(76124) ->
    #gift_cfg{
        item_id=76124,
        items=["4-800000", "76051-1", "70066-1", "77109-1"]};

get(76125) ->
    #gift_cfg{
        item_id=76125,
        items=["4-1000000", "76057-1", "70067-1"]};

get(76126) ->
    #gift_cfg{
        item_id=76126,
        items=["4-1500000", "76059-1", "70068-1"]};

get(76127) ->
    #gift_cfg{
        item_id=76127,
        items=["4-2000000", "76053-1", "70069-1", "77109-1"]};

get(76128) ->
    #gift_cfg{
        item_id=76128,
        items=["4-3000000", "76055-1", "70070-1", "77109-1"]};

get(76129) ->
    #gift_cfg{
        item_id=76129,
        items=["4-5000000", "76063-1", "70071-1", "77109-2"]};

get(_) -> false.

