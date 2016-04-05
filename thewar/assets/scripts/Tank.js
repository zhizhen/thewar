var Utils = require("Utils");

cc.Class({
    extends: cc.Component,

    properties: {
        move_speed: 20,
        gun_speed: 90, // 炮管每秒旋转角度
        vehicle_angle: 0, // 车身角度
        gun_angle: 0, // 炮管相对车身朝向角度
        tankPrefeb: cc.Prefab,
        bullet: cc.Prefab
    },

    // use this for initialization
    onLoad: function () {
        console.log("tank view onload!");
        this.create(200, 300, 0);
        this.faceAndfire(400, 600)
    },

    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
    
    create: function (x, y, face) {
        this.vehicle_angle = 180 * face / Math.PI;
        this.tankNode = cc.instantiate(this.tankPrefeb);
        this.tankNode.position = cc.p(x, y);
        console.log("tank view create!");
        this.node.addChild(this.tankNode);
        console.log("tank view create!");
    },
    
    move: function (x, y) {
        
        var old_pos = this.tankNode.position;
        var angle = 180 * Math.atan((y - old_pos.y)/(x - old_pos.x)) / Math.PI;
        var turn = cc.rotateBy(0.4, angle);
        var move = cc.moveTo(2, x, y);
        var spawn = cc.spawn(turn, move);
        console.log("move to:" + x + "|" + y + "|" + angle);
        this.tankNode.runAction(move);
    },

    faceAndfire: function(x, y) {
        var gun = cc.find("tankInfo/vehicle/gun", this.tankNode);
        
        var old_pos = cc.p(this.tankNode.position.x + gun.position.x, 
            this.tankNode.position.y + gun.position.y);
        var now_angle = this.vehicle_angle + this.gun_angle;
        var degree = Math.atan2(x - old_pos.x, y - old_pos.y);
        var turn_angle = Utils.fmod(180 * (degree - now_angle) / Math.PI, 360);
        var rotate = cc.rotateBy(Math.abs(turn_angle) / this.gun_speed, turn_angle, 0);
        console.log("now_angle:" + now_angle *180 / Math.PI
        + ";degree:" + degree * 180 / Math.PI
        + ";turn_angle:" + turn_angle);

        if (degree - now_angle !== 0) {
            this.gun_angle = this.gun_angle + turn_angle * Math.PI / 180;
            var tmp = this
            gun.runAction(cc.sequence(rotate, cc.callFunc(function() {
                tmp.fire();
            })));
        }
        else{
            this.fire();
        }
    },
    
    fire: function() {
        console.log("fire the hole!");
        var bullet = cc.instantiate(this.bullet);
        bullet.position = cc.p(-150, -400);
        this.node.addChild(bullet);
    }
});
