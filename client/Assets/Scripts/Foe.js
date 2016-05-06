const FoeType = require('Types').FoeType;
const AttackType = cc.Enum({
    Melee: -1,
    Range: -1
});

cc.Class({
    extends: cc.Component,
    
    properties: {
        foeType: {
            default: FoeType.Foe0,
            type: FoeType
        },
        atkType: {
            default: AttackType.Melee,
            type: AttackType
        }
    },
    
    init (waveMgr) {
        cc.log("foe init!");
        this.waveMgr = waveMgr;
    }
});