import PlayScenes from './scenes/play_scenes.js';
import TitleScene from './scenes/title_scene.js';

const config = {
    width: 800,
    height: 600,
    type: Phaser.AUTO,
    audio: {
        disableWebAudio: true
    },
    physics: {
        default: 'arcade',
        arcade: {
            fps: 60,
            gravity: { y: 0 },
        }
    },
};

const game = new Phaser.Game(config);

game.scene.add('PlayScenes', PlayScene);
game.scene.add('TitleScene', PreloadScene);