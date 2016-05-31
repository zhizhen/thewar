var Utils = require("Utils");

cc.Class({
    extends: cc.Component,

    properties: {
        move_speed: 20,
        gun_speed: 0, // 炮管每秒旋转角度
        vehicle_speed: 0,
        label_vehicle: cc.Label,
        label_gun: cc.Label,
        bullet: cc.Prefab
    },

    // use this for initialization
    init: function (game, x, y, face) {
        cc.log("tank view onload!", x, y);
        this.game = game;
        this.node.position = cc.p(x, y);
        var vehicle = cc.find("tankInfo/vehicle", this.node);
        vehicle.rotation = face;
        
        // this.label_vehicle.string = face;
        // this.label_gun.string = face;
        // this.face(400, 600);
    },

    // called every frame, uncomment this function to activate update callback
    update: function (dt) {
        if (this.target !== undefined){
            var old_pos = this.node.position;
            var vect = cc.p(this.target.x - old_pos.x, this.target.y - old_pos.y);
            var distance = cc.pDistance(old_pos, this.target);
            var unit = cc.p(vect.x / distance, vect.y / distance);
            this.node.position = cc.pAdd(old_pos, unit); 
            
            if (cc.pDistance(this.target, this.node.position) < 5) {
                this.target = undefined;
            }
        }
    },
    
    forward: function (position) {
        
    },
    
    backward: function (position) {
        
    },
    
    move: function (position) {
        var x = position.x;
        var y = position.y;
        var old_pos = this.node.position;
        var vehicle = cc.find("tankInfo/vehicle", this.node);
        var vehicle_angle = vehicle.getRotation();
        var degree = Math.atan2(x - old_pos.x, y - old_pos.y);
        var turn_angle = Utils.fmod(180 * degree / Math.PI - vehicle_angle, 360);
        var turn = cc.rotateBy(Math.abs(turn_angle) / this.vehicle_speed, turn_angle, turn_angle);
        console.log("move to:" + x + "|" + y + "|" + turn_angle);
        // vehicle.runAction(turn);
        var self = this;
        vehicle.runAction(cc.sequence(turn, cc.callFunc(function() {
                console.log("move turn callback");
                self.target = position;
            })));
        cc.log("old vehicle angle:", Math.floor(vehicle_angle));
        this.label_vehicle.string = Math.floor(180 * degree / Math.PI);
    },

    face: function(x, y) {
        var gun = cc.find("tankInfo/vehicle/gun", this.node);
        var vehicle = cc.find("tankInfo/vehicle", this.node);
        var ACTION_TAG = 1;
        // 通过 tag 停止一个动作
        gun.stopActionByTag(ACTION_TAG);
        
        var old_pos = cc.p(this.node.position.x + gun.position.x, 
            this.node.position.y + gun.position.y);
        // getRotation 返回的是角度
        var gun_angle = gun.getRotation();
        var vehicle_angle = vehicle.getRotation();
        var now_angle = Math.PI * (vehicle_angle + gun_angle) / 180;
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
        
        this.label_gun.string = Math.floor(180 * degree / Math.PI);
    },
    
    fire: function() {
        console.log("fire the hole!");
        
        var gun = cc.find("tankInfo/vehicle/gun", this.node);
        var vehicle = cc.find("tankInfo/vehicle", this.node);
        
        var ACTION_TAG = 1;
        // 通过 tag 停止一个动作
        gun.stopActionByTag(ACTION_TAG);
        var gun_angle = gun.getRotation();
        var vehicle_angle = vehicle.getRotation();
        var now_angle = Math.PI * (vehicle_angle +  gun_angle) / 180;
        
        var anchor = gun.getAnchorPoint();
        var gun_pos = cc.pAdd(gun.position, this.node.position);
        var dx = Math.sin(Math.PI * gun_angle / 180) * gun.getContentSize().height * (1 - anchor.y);
        var dy = Math.cos(Math.PI * gun_angle / 180) * gun.getContentSize().height * (1 - anchor.y);
        
        
        var dx1 = Math.sin(now_angle) * gun.getContentSize().height * (1 - anchor.y);
        var dy1 = Math.cos(now_angle) * gun.getContentSize().height * (1 - anchor.y);
        var pos = cc.p(gun_pos.x + dx1, gun_pos.y + dy1);
        this.game.waveMgr.spawnProjectile(this.projectileType, pos, now_angle);
        
        // 炮塔后座力
        var gun_bx = gun.position.x - dx / 20;
        var gun_by = gun.position.y - dy / 20;
        var backward = cc.moveTo(0.05, cc.p(gun_bx, gun_by));
        var recover = cc.moveTo(0.5, cc.p(gun.position.x, gun.position.y));
        var sequence = cc.sequence(backward, recover);
        gun.runAction(sequence);
    },
    
    isHit: function(p) {
        var vehicle = cc.find("tankInfo/vehicle", this.node);
        var location = this.node.position;
        var vehicle_angle = vehicle.getRotation();
        // var face = 180 * vehicle_angle / Math.PI;
        var unit_vect_h = cc.p(Math.sin(vehicle_angle), Math.cos(vehicle_angle));
        var unit_vect_w = cc.p(Math.cos(vehicle_angle), - Math.sin(vehicle_angle));
        
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
