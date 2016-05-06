const Spawn = require('Spawn');

const Wave = cc.Class({
    name: 'Wave',
    properties: {
        spawns: {
            default: [],
            type: Spawn
        }
    },
    init () {
        this.totalFoes = 0;
        this.spawnIdx = 0;
        for (let i = 0; i < this.spawns.length; ++i) {
            if (this.spawns[i].isCompany === false) {
                this.totalFoes += this.spawns[i].total;
            }
        }
    },
    getNextSpawn () {
        this.spawnIdx ++;
        if (this.spawnIdx < this.spawns.length) {
            return this.spawns[this.spawnIdx];
        } else {
            return null;
        }
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
        this.foeGroup = game.foeGroup;
        this.waveIdx = this.startWaveIdx;
        this.currentWave = this.waves[this.waveIdx];
        // this.waveProgress = this.waveProgress.getComponent('WaveProgress');
        // this.waveProgress.init(this);
    },
    
    startSpawn () {
        this.schedule(this.spawnFoe, this.currentSpawn.spawnInterval);
    },

    startWave () {
        this.currentWave.init();
        this.currentSpawn = this.currentWave.spawns[this.currentWave.spawnIdx];
        this.startSpawn();
        this.game.inGameUI.showWave(this.waveIdx + 1);
        
    },
    
    spawnFoe () {
        if (this.currentSpawn.finished) {
            this.endSpawn();
            return;
        }
        
        let newFoe = this.currentSpawn.spawn(this.game.poolMgr);
        if (newFoe) {
            console.log(this.foeGroup);
            this.foeGroup.addChild(newFoe);
            newFoe.setPosition(this.getNewFoePosition());
            // newFoe.geComponent('Foe').init(this);
        }
    },
    
    getNewFoePosition () {
        var randX = cc.randomMinus1To1() * (this.foeGroup.width - this.spawnMargin) / 2;
        var randY = cc.randomMinus1To1() * (this.foeGroup.height - this.spawnMargin) / 2;
        return cc.p(randX, randY);
    }
});
