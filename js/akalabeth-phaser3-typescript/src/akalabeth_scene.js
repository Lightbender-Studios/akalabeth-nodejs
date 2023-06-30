import Phaser from 'phaser'

export default class HelloWorldScene extends Phaser.Scene {
	constructor() {
		super('hello-world')
	}

	preload() {
		// This next line sets the base URL for ALL assets loaded in this scene.
		// It's not necessary if all your assets are in the same folder as your
		// index.html file. But if you have assets in a folder, or if you're
		// loading assets from a CDN, this is how you tell Phaser where to look.
		//

		// this.load.setBaseURL('https://labs.phaser.io')
		// this.load.image('sky', 'assets/skies/space3.png')

	}

	create() {
		let X1 = 0;
		let Y1 = 0;
		let X2 = 800;
		let Y2 = 600;
		//let ZZ = Math.random(-Math.abs())
		// Draw a line between the top left and bottom right of the screen
		this.add.line(X1 + 30, Y1 + 30, X1 + 20, Y1 + 30, 0, 600, 800, 0xffffff)
		// Draw a line between the bottom left and top right of the screen
		this.add.line(0, 600, 0, 600, 800, 0, 0xffffff)
	}
}
