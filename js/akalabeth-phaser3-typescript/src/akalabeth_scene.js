import Phaser from 'phaser'

export default class Akalabeth extends Phaser.Scene {

	constructor() {
		super('akalabeth')
		this.level = 0
		// DIM DN%(10,10),TE%(20,20),XX%(10),YY%(10),PE%(10,3),LD%(10,5),CD%(10,3),FT%(10,5),LA(10,3)
		this.dn = new Array(10, 10)
		this.te = this.lbff_new_array(20, 20, -1)
		this.xx = this.lbff_new_array(10, -1, -1)
		this.yy = new Array(10)
		this.pe = new Array(10, 3)
		this.ld = new Array(10, 5)
		this.cd = new Array(10, 3)
		this.ft = new Array(10, 5)
		this.la = new Array(10, 3)
		this.item_names = ["FOOD", "RAPIER", "AXE", "SHIELD", "BOW AND ARROWS ", "MAGIC AMULET"]
		this.monster_names = ["SKELETON", "ORC", "TROLL", "VAMPIRE", "GREMLIN", "GHOUL", "DEMON", "DRAGON"]
		this.style = { font: '24px Courier', fill: '#00ff00' }
	}

	preload() {
	}

	create() {
		//this.character_create()

		// BUG: This is not right

		this.lbff_text(1, 12, "WELCOME TO AKALABETH, WORLD OF DOOM!", 10, 24, this.style)
		console.table(this.xx)
		this.lbff_text(1, 23, "(PLEASE WAIT)", 10, 24, this.style)
		for (let x = 0; x <= 19; x++) {
			this.lbff_text(x + 14, 23, ".", 10, 24, this.style)
			this.te[x][0] = 1
			this.te[x][0] = 1
			this.te[x][0] = 1
			this.te[0][x] = 1
			this.te[x][19] = 1
			this.te[19][x] = 1
		}

		for (let x = 1; x <= 19; x++) {
			for (let y = 1; y <= 19; y++) {
				this.te[x][y] = (Math.random() ^ 5 * 4.5) + 1 // BUG: This is not right
				if (this.te[x][y] == 3 && Math.random() > .5) {
					this.te[x][y] = 0
				}
			}
		}
		console.table(this.te)

		// BUG: This is not right -- END
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
		let array = new Array(x)

		for (let i = 0; i < x; i++) {
			if (y == -1) {
				array[i] = init_value
			}
			else {
				array[i] = new Array(y)
				for (let j = 0; j < y; j++) {
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
