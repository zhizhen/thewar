cc.Class({
    extends: cc.Component,

    properties: {
        refToTank: require('Tank')
    },

    // use this for initialization
    onLoad: function () {
        
        var begin = function (event){
            // console.log("touchend begin:"+event.touch.getLocation().x +"|"+event.touch.getLocation().y);
            var location = event.touch.getLocation();
            // todo 判断，如果点击区域是车身，则接下来move是移动
            // 否则，则是炮塔转动到瞄准该位置
            var isHit = this.refToTank.isHit(location);
            if (isHit){
                // console.log("start move!");
                this.pre_move = [];
            }
            else{
                // console.log("face target!");
                this.refToTank.face(location.x, location.y);
            }
        }
        var move = function (event){
            // console.log("touchend move:"+event.touch.getLocation().x +"|"+event.touch.getLocation().y);
            var location = event.touch.getLocation();
            // todo 移动车身，或者旋转炮塔
            if (this.pre_move !== undefined){
                this.pre_move.push(location);
            }
            else{
                this.refToTank.face(location.x, location.y);
            }
        }
        var end = function (event){
            var location = event.touch.getLocation();
            // console.log("touchend end:"+event.touch.getLocation().x +"|"+event.touch.getLocation().y)
            // todo 判断，如果炮塔旋转完毕，已瞄准触屏方向，松开就开炮
            // console.log("pre move:" + this.pre_move);
            this.refToTank.fire();
        }
        this.node.on(cc.Node.EventType.TOUCH_START, begin, this);
        this.node.on(cc.Node.EventType.TOUCH_MOVE, move, this);
        this.node.on(cc.Node.EventType.TOUCH_END, end, this);
    },

    // called every frame, uncomment this function to activate update callback
    update: function (dt) {
        // console.log("touch tick!" + dt);
    },
});
