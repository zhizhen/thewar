cc.Class({
    extends: cc.Component,

    properties: {
        refToTank: require('Tank')
    },

    // use this for initialization
    onLoad: function () {
        // this.cmds = [];
        this.pre_move = new Array();
        var begin = function (event){
            var touch = event.touch;
            var touchID = touch.__proto__._id;;
            var location = touch.getLocation();
            // touch.setTouchInfo(touch.__proto__._id, location.x, location.y);
            // console.log("touchend begin:"+event.touch.getLocation().x +"|"+event.touch.getLocation().y);
            // todo 判断，如果点击区域是车身，则接下来move是移动
            // 否则，则是炮塔转动到瞄准该位置
            var isHit = this.refToTank.isHit(location);
            if (isHit){
                // console.log("start move!");
                touch.setTouchInfo(1, location.x, location.y);
                // this.cmds[touchID] = "move";
            }
            else{
                // console.log("face target!");
                // this.cmds[touchID] = "face";
                touch.setTouchInfo(2, location.x, location.y);
                this.refToTank.face(location.x, location.y);
            }
        };
        var move = function (event){
            var location = event.touch.getLocation();
            var touch = event.touch;
            var touchID = touch.getID();
            console.log("touchend move,touch id:" + touchID + ";:"+location.x +"|"+location.y);
            // todo 移动车身，或者旋转炮塔

            if (touchID === 2){
                this.refToTank.face(location.x, location.y);
            }
            else if(touchID === 1){
                this.pre_move.unshift(location);
                console.log("id:" + touchID + ";" + this.touchID);
            }
        };
        var end = function (event){
            var touch = event.touch;
            var touchID = touch.getID();
            var location = event.touch.getLocation();
            // console.log("touchend end:"+event.touch.getLocation().x +"|"+event.touch.getLocation().y)
            // todo 判断，如果炮塔旋转完毕，已瞄准触屏方向，松开就开炮
            // console.log("pre move:" + this.pre_move);
            if (touchID === 1){
                console.log("end move touch,x:" + location.x + ",y:" + location.y);
            }
            else{
                this.refToTank.fire();
            }
        };
        this.node.on(cc.Node.EventType.TOUCH_START, begin, this);
        this.node.on(cc.Node.EventType.TOUCH_MOVE, move, this);
        this.node.on(cc.Node.EventType.TOUCH_END, end, this);
    },

    // called every frame, uncomment this function to activate update callback
    update: function (dt) {
        // console.log("touch tick!" + dt);
        if(this.pre_move.length !== 0){
            var location = this.pre_move.pop();
            this.refToTank.move(location);
        }
    },
});
