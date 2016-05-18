cc.Class({
    extends: cc.Component,

    properties: {
        tank: cc.Node
    },

    // use this for initialization
    onLoad: function () {
        this.move = null;
        this.face = null;
        this.pre_move = new Array();
        this.tank = this.tank.getComponent('Tank');
        var begin = function (event){
            // 模拟器，手机上能多点触摸，浏览器取到的是undefined
            var touchID = event.touch.getID();
            var location = event.touch.getLocation();
            // touch.setTouchInfo(touch.__proto__._id, location.x, location.y);
            // console.log("touchend begin:"+event.touch.getLocation().x +"|"+event.touch.getLocation().y);
            // todo 判断，如果点击区域是车身，则接下来move是移动
            // 否则，则是炮塔转动到瞄准该位置
            var isHit = this.tank.isHit(location);
            if (isHit){
                // console.log("start move!");
                this.move = touchID;
            }
            else{
                // console.log("face target!");
                this.face = touchID;
                this.tank.face(location.x, location.y);
            }
        };
        var move = function (event){
            var location = event.touch.getLocation();
            var touchID = event.touch.getID();
            console.log("touch move,touch id:" + touchID + ";:"+this.move +"|"+this.face);
            // todo 移动车身，或者旋转炮塔

            if (touchID === this.face){
                cc.log("move face!");
                this.tank.face(location.x, location.y);
            }
            else if(touchID === this.move){
                this.pre_move.unshift(location);
                console.log("id:" + touchID + ";" + this.touchID);
            }
        };
        var end = function (event){
            var touchID = event.touch.getID();
            var location = event.touch.getLocation();
            // console.log("touchend end:"+event.touch.getLocation().x +"|"+event.touch.getLocation().y)
            // todo 判断，如果炮塔旋转完毕，已瞄准触屏方向，松开就开炮
            // console.log("pre move:" + this.pre_move);
            //if (touchID === this.move){
           //     console.log("end move touch,x:" + location.x + ",y:" + location.y);
            //    this.move = null;
            //}
           //else{
                this.tank.setPosSequence(this.pre_move);
                this.tank.setStatus(2);
                this.pre_move = new Array();
                this.tank.fire();
                this.face = null;
                console.log("end move touch");
           //}
        };
        this.node.on(cc.Node.EventType.TOUCH_START, begin, this);
        this.node.on(cc.Node.EventType.TOUCH_MOVE, move, this);
        this.node.on(cc.Node.EventType.TOUCH_END, end, this);
    },

    // called every frame, uncomment this function to activate update callback
    update: function (dt) {
        // console.log("touch tick!" + dt);
        //if(this.pre_move.length !== 0){
        //    var location = this.pre_move.pop();
        //    this.tank.move(location);
        //}
    },
});
