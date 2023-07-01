import Phaser from 'phaser'

export default class Akalabeth extends Phaser.Scene {

	constructor() {
		super('akalabeth')
		this.level = 0
		// DIM DN%(10,10),TE%(20,20),XX%(10),YY%(10),PE%(10,3),LD%(10,5),CD%(10,3),FT%(10,5),LA(10,3)
		this.dn = this.lbff_new_array(10, 10, -1)
		this.te = this.lbff_new_array(20, 20, -1)
		this.xx = this.lbff_new_array(10, -1, -1)
		this.yy = this.lbff_new_array(10, -1, -1)
		this.pe = this.lbff_new_array(10, 3, -1)
		this.ld = this.lbff_new_array(10, 5, -1)
		this.cd = this.lbff_new_array(10, 3, -1)
		this.ft = this.lbff_new_array(10, 5, -1)
		this.la = this.lbff_new_array(10, 3, -1)
		this.item_names = ["FOOD", "RAPIER", "AXE", "SHIELD", "BOW AND ARROWS ", "MAGIC AMULET"]
		this.monster_names = ["SKELETON", "ORC", "TROLL", "VAMPIRE", "GREMLIN", "GHOUL", "DEMON", "DRAGON"]
		this.style = { font: '24px Courier', fill: '#00ff00' }

		this.create_terrain_mountaion_boundry()
		this.create_random_terrain()
		console.log("TE")
		console.table(this.te)
	}

	preload() {
	}

	create_terrain_mountaion_boundry() {
		for (let x = 0; x < 20; x++) {
			this.te[x][0] = 1
			this.te[0][x] = 1
			this.te[x][19] = 1
			this.te[19][x] = 1
		}
	}

	create_random_terrain() {
		// this.lbff_text(1, 23, "(PLEASE WAIT)", 10, 24, this.style)
		for (let x = 1; x <= 18; x++) {
			for (let y = 1; y <= 18; y++) {
				this.te[x][y] = Math.floor((Math.pow(Math.random(), 5)) * 4.5)
				if (this.te[x][y] == 3 && Math.random() > .5) {
					this.te[x][y] = 0
				}
			}
			// this.lbff_text(1, 23, ".", 10, 24, this.style)
		}

		this.te[Math.floor(Math.random() * 18) + 1][Math.floor(Math.random() * 18) + 1] = 900
		this.tx = Math.floor(Math.random() * 18) + 1
		this.ty = Math.floor(Math.random() * 18) + 1
		this.te[this.tx][this.ty] = 3
		
		this.xx[0] = 139
		this.yy[0] = 79

		// FOR X = 2 TO 20 STEP 2:XX%(X / 2) = INT ( ATN (1 / X) / ATN (1) * 140 + .5):YY%(X / 2) = INT (XX%(X / 2) * 4 / 7)
		for (let x = 2; x <= 20; x += 2) {
			this.xx[x / 2] = Math.floor(Math.atan(1 / x) / Math.atan(1) * 140 + .5)
			this.yy[x / 2] = Math.floor(this.xx[x / 2] * 4 / 7)
		}
		console.log("XX")
		console.table(this.xx)
	}

	create() {
		console.table(this.te)
		//this.character_create()

		this.lbff_text(1, 12, "WELCOME TO AKALABETH, WORLD OF DOOM!", 10, 24, this.style)
	}

	/**
	 * @param {any} ax
	 * @param {number} ay
	 * @param {string | string[]} text
	 * @param {number} margin
	 * @param {any} fontSize
	 * @param {{ font: string; fill?: string; fontFamily?: string; fontSize?: string; fontStyle?: string; backgroundColor?: string; color?: string; stroke?: string; strokeThickness?: number; shadow?: Phaser.Types.GameObjects.Text.TextShadow; padding?: Phaser.Types.GameObjects.Text.TextPadding; align?: string; maxLines?: number; fixedWidth?: number; fixedHeight?: number; resolution?: number; rtl?: boolean; testString?: string; baselineX?: number; baselineY?: number; wordWrap?: Phaser.Types.GameObjects.Text.TextWordWrap; metrics?: Phaser.Types.GameObjects.Text.TextMetrics; }} style
	 */
	lbff_text(ax, ay, text, margin, fontSize, style) {
		let lineHeight = fontSize + margin
		let by = (lineHeight * ay) - margin * ay
		let bx = (fontSize * ax) - margin * ax
		this.add.text(bx, by, text, style)
	}

	/**
	 * @param {number} x
	 * @param {number} y
	 * @param {number} init_value
	 */
	lbff_new_array(x, y, init_value) {
		let array = new Array(x + 1)

		for (let i = 0; i < x; i++) {
			if (y == -1) {
				array[i] = init_value
			}
			else {
				array[i] = new Array(y)
				for (let j = 0; j < y + 1; j++) {
					array[i][j] = init_value
				}
			}
		}
		return array
	}

	character_create() {
		let fontSize = 24
		let margin = 10
		let lineNumber = 0
		let style = { font: '24px Courier', fill: '#00ff00' }
		let lines = ["TYPE THY LUCKY NUMBER.....", "LEVEL OF PLAY (1-10)......", "LINE 2", "LINE 3", "LINE 4"]

		lines.forEach(element => {
			lineNumber++
			this.lbff_text(1, lineNumber, element, margin, fontSize, style)
		});
		this.lbff_text(1, 6, "Level is " + this.level, margin, fontSize, style)
	}
}
