
const Wave = cc.Class({
    name: 'Wave',
    properties: {
        
    },
    init () {
        
    }
});

cc.Class({
    extends: cc.Component,

    properties: {
        waves: {
            default: [],
            type: Wave
        },
        startWaveIdx: 0,
        spawnMargin: 0,
        waveProgress: cc.Node
    },

    // use this for initialization
    init (game) {
        this.game = game;
        // this.waveProgress = this.waveProgress.getComponent('WaveProgress');
        // this.waveProgress.init(this);
    },

    startWave () {
        this.game.inGameUI.showWave(1);
        
    }
});
