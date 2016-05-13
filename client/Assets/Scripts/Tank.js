var Utils = require("Utils");

cc.Class({
    extends: cc.Component,

    properties: {
        move_speed: 20,
        gun_speed: 0, // 炮管每秒旋转角度
        vehicle_speed: 0,
        tankPrefeb: cc.Prefab,
        bullet: cc.Prefab
    },

    // use this for initialization
    init: function (game, x, y, face) {
        console.log("tank view onload!");
        this.game = game;
        this.node.position = cc.p(x, y);
        var vehicle = cc.find("tankInfo/vehicle", this.node);
        vehicle.rotation = face;
        this.face(400, 600);
    },

    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
    
    move: function (position) {
        var x = position.x;
        var y = position.y;
        var old_pos = this.node.position;
        var vehicle = cc.find("tankInfo/vehicle", this.node);
        var vehicle_angle = vehicle.getRotation();
        var degree = Math.atan2(x - old_pos.x, y - old_pos.y);
        var turn_angle = Utils.fmod(180 * (degree - vehicle_angle) / Math.PI, 360);
        var rotate = cc.rotateBy(Math.abs(turn_angle) / this.vehicle_speed, turn_angle, turn_angle);
        // var turn = cc.rotateBy(0.4, angle);
        // var move = cc.moveTo(2, x, y);
        // var spawn = cc.spawn(turn, move);
        console.log("move to:" + x + "|" + y + "|" + turn_angle);
        // this.node.runAction(rotate);
        this.node.position = position;
    },

    face: function(x, y) {
        var gun = cc.find("tankInfo/vehicle/gun", this.node);
        var vehicle = cc.find("tankInfo/vehicle", this.node);
        var ACTION_TAG = 1;
        // 通过 tag 停止一个动作
        gun.stopActionByTag(ACTION_TAG);
        
        var old_pos = cc.p(this.node.position.x + gun.position.x, 
            this.node.position.y + gun.position.y);
        var gun_angle = gun.getRotation();
        var vehicle_angle = vehicle.getRotation();
        var now_angle = vehicle_angle + Math.PI * gun_angle / 180;
        var degree = Math.atan2(x - old_pos.x, y - old_pos.y);
        var turn_angle = Utils.fmod(180 * (degree - now_angle) / Math.PI, 360);
        var rotate = cc.rotateBy(Math.abs(turn_angle) / this.gun_speed, turn_angle, turn_angle);
        // 给 action 设置 tag
        rotate.setTag(ACTION_TAG);
        
        // console.log("now_angle:" + now_angle *180 / Math.PI
        // + ";degree:" + degree * 180 / Math.PI
        // + ";turn_angle:" + turn_angle);

        if (degree - now_angle !== 0) {
            gun.runAction(cc.sequence(rotate, cc.callFunc(function() {
                console.log("face callback");
            })));
        }
    },
    
    fire: function() {
        console.log("fire the hole!");
        // var bullet = cc.instantiate(this.bullet);
        // bullet.position = cc.p(320, 480);
        // this.node.addChild(bullet);
    },
    
    isHit: function(p) {
        var vehicle = cc.find("tankInfo/vehicle", this.node);
        var location = this.node.position;
        var vehicle_angle = vehicle.getRotation();
        var face = 180 * vehicle_angle / Math.PI;
        var unit_vect_h = cc.p(Math.sin(face), Math.cos(face));
        var unit_vect_w = cc.p(Math.cos(face), - Math.sin(face));
        
        var width = vehicle.getContentSize().width;
        var height = vehicle.getContentSize().height;
        
        // console.log("location,x:" + location.x + ";y:" + location.y);
        
        var p1 = cc.pAdd(cc.pAdd(location, cc.pMult(unit_vect_h, height / 2)), cc.pMult(cc.pNeg(unit_vect_w), width / 2));
        var p2 = cc.pAdd(cc.pAdd(location, cc.pMult(cc.pNeg(unit_vect_h), height / 2)), cc.pMult(cc.pNeg(unit_vect_w), width / 2));
        var p3 = cc.pAdd(cc.pAdd(location, cc.pMult(cc.pNeg(unit_vect_h), height / 2)), cc.pMult(unit_vect_w, width / 2));
        var p4 = cc.pAdd(cc.pAdd(location, cc.pMult(unit_vect_h, height / 2)), cc.pMult(unit_vect_w, width / 2));
        
        // console.log("p1,x:" + p1.x + ";y:" + p1.y);
        // console.log("p2,x:" + p2.x + ";y:" + p2.y);
        // console.log("p3,x:" + p3.x + ";y:" + p3.y);
        // console.log("p4,x:" + p4.x + ";y:" + p4.y);
        
        var getCross = function(p1, p2, p) {return (p2.x - p1.x) * (p.y - p1.y) - (p.x - p1.x) * (p2.y - p1.y);}
        return getCross(p1, p2, p) * getCross(p3, p4, p) >= 0 && getCross(p2, p3, p) * getCross(p4, p1, p) >= 0;
    }
});
