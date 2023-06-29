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

		this.load.setBaseURL('https://labs.phaser.io')
		this.load.image('sky', 'assets/skies/space3.png')

	}

	create() {
		this.add.image(400, 300, 'sky')
	}
}
