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
		this.w = this.lbff_new_array(9, -1, -1)
		this.item_names = ["FOOD", "RAPIER", "AXE", "SHIELD", "BOW AND ARROWS ", "MAGIC AMULET"]
		this.monster_names = ["SKELETON", "ORC", "TROLL", "VAMPIRE", "GREMLIN", "GHOUL", "DEMON", "DRAGON"]
		this.style = { font: '24px Courier', fill: this.main_colour_hex }
		this.main_colour_string = "0x00ff00"
		this.main_colour_hex = 0xff0000

		this.create_terrain_mountain_boundry()
		this.create_random_terrain()
		console.log("TE")
		console.table(this.te)
	}

	preload() {
	}

	create_terrain_mountain_boundry() {
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

		for (let x = 2; x < 20; x += 2) {
			this.pe[x / 2][0] = 139 - this.xx[x / 2]
			this.pe[x / 2][1] = 139 + this.xx[x / 2]
			this.pe[x / 2][2] = 79 - this.yy[x / 2]
			this.pe[x / 2][3] = 79 + this.yy[x / 2]
		}
		// 95 PE%(0,0) = 0:PE%(0,1) = 279:PE%(0,2) = 0:PE%(0,3) = 159
		this.pe[0][0] = 0
		this.pe[0][1] = 279
		this.pe[0][2] = 0
		this.pe[0][3] = 159

		// 100 FOR X = 1 TO 10:CD%(X,0) = 139 - XX%(X) / 3:CD%(X,1) = 139 + XX%(X) / 3:CD%(X,2) = 79 - YY%(X) * .7:CD%(X,3) = 79 + YY%(X): NEXT : PRINT " .";
		for (let x = 1; x < 10; x++) {
			this.cd[x][0] = 139 - this.xx[x] / 3
			this.cd[x][1] = 139 + this.xx[x] / 3
			this.cd[x][2] = 79 - this.yy[x] * .7
			this.cd[x][3] = 79 + this.yy[x]
		}
		console.log(".") // TODO: this should display dots as it goes
		// 105 FOR X = 0 TO 9:LD%(X,0) = (PE%(X,0) * 2 + PE%(X + 1,0)) / 3:LD%(X, 1) = (PE%(X,0) + 2 * PE%(X + 1,0)) / 3:W = LD%(X,0) - PE%(X,0)
		for (let x = 0; x < 9; x++) {
			this.ld[x][0] = (this.pe[x][0] * 2 + this.pe[x + 1][0]) / 3
			this.ld[x][1] = (this.pe[x][0] + 2 * this.pe[x + 1][0]) / 3
			this.w[x] = this.ld[x][0] - this.pe[x][0]
			this.ld[x][2] = (this.pe[x][1] * 2 + this.pe[x + 1][1]) / 3
			this.ld[x][3] = (this.pe[x][1] + 2 * this.pe[x + 1][1]) / 3
			this.ld[x][4] = (this.pe[x][2] * 2 + this.pe[x + 1][2]) / 3
			this.ld[x][5] = (this.pe[x][2] + 2 * this.pe[x + 1][2]) / 3
			this.ld[x][2] = (this.pe[x][4] - (this.ld[x][4] - this.ld[x][2])) * .8
			this.ld[x][3] = (this.pe[x][5] - (this.ld[x][5] - this.ld[x][3])) * .8
			if (this.ld[x][3] > this.ld[x][4]) {
				this.ld[x][3] = this.ld[x][3] - 1
			}
		}

		for (let x = 0; x < 9; x++) {
			this.ft[x][0] = 139 - this.xx[x] / 3
			this.ft[x][1] = 139 + this.xx[x] / 3
			this.ft[x][2] = 139 - this.xx[x + 1] / 3
			this.ft[x][3] = 139 + this.xx[x + 1] / 3
			this.ft[x][4] = 79 + (this.yy[x] * 2 + this.yy[x + 1]) / 3
			this.ft[x][5] = 79 + (this.yy[x] + 2 * this.yy[x + 1]) / 3
		}

		// 		850  FOR X = 0 TO 9
		// 860  LA(X,0) = (FT%(X,0) * 2 + FT%(X,1)) / 3
		// 870  LA(X,1) = (FT%(X,0) + 2 * FT%(X,1)) / 3
		// 880  LA(X,3) = FT%(X,4)
		// 890  LA(X,2) = 159 - LA(X,3)
		// 900   NEXT
		for (let x = 0; x < 9; x++) {
			this.la[x][0] = (this.ft[x][0] * 2 + this.ft[x][1]) / 3
			this.la[x][1] = (this.ft[x][0] + 2 * this.ft[x][1]) / 3
			this.la[x][3] = this.ft[x][4]
			this.la[x][2] = 159 - this.la[x][3]
		}
	}

	/**
	 * @param {number} x1
	 * @param {number} y1
	 * @param {number} x2
	 * @param {number} y2
	 * @param {number} color
	 */
	line(x1, y1, x2, y2, color) {
		this.add.line(x1, y1, x2, y2, 0x00ff00, 1)
	}

	/**
	 * @param {number} x
	 * @param {number} y
	 */
	draw_initial(x, y) {
		this.line(138, 75, 142, 75, 0x00ff00)
		this.line(140, 73, 140, 77, 0x00ff00)
		this.zz = this.te[this.tx + x][this.ty + y]
		this.x1 = 65 + (x + 1) * 50
		this.y1 = (y + 1) * 50
	}

	draw_legend_1() {
		this.add.rectangle(this.x1 + 10, this.y1 + 50, 10, 10, this.main_colour_hex, this.main_colour_hex)
		this.add.rectangle(this.x1, this.y1 + 10, 10, 10, this.main_colour_hex)
		this.add.rectangle(this.x1 + 50, this.y1 + 10, 10, 10, this.main_colour_hex)
		this.add.rectangle(this.x1, this.y1 + 40, 10, 10, this.main_colour_hex, this.main_colour_hex)
		this.add.rectangle(this.x1 + 40, this.y1 + 40, 10, 10, this.main_colour_hex)
		this.add.rectangle(this.x1 + 10, this.y1, 10, 10, this.main_colour_hex)
		this.add.rectangle(this.x1 + 40, this.y1, 10, 10, this.main_colour_hex)
	}

	draw_legend_2() {
		this.add.rectangle(this.x1 + 20, this.y1 + 20, 10, 10, this.main_colour_hex, this.main_colour_hex)
	}

	draw_legend_3() {
		this.add.rectangle(this.x1 + 10, this.y1 + 10, 10, 30, this.main_colour_hex, this.main_colour_hex)
		this.add.rectangle(this.x1 + 40, this.y1 + 10, 10, 30, this.main_colour_hex, this.main_colour_hex)
		this.add.rectangle(this.x1 + 40, this.y1 + 10, 30, 10, this.main_colour_hex, this.main_colour_hex)
	}

	draw_legend_4() {
		this.add.rectangle(this.x1 + 20, this.y1 + 20, 10, 10, this.main_colour_hex, this.main_colour_hex)
		this.add.rectangle(this.x1 + 20, this.y1 + 20, 10, 10, this.main_colour_hex, this.main_colour_hex)
	}

	draw_legend_5() {
		this.add.rectangle(this.x1, this.y1, 50, 50, this.main_colour_hex, this.main_colour_hex)
		this.add.rectangle(this.x1 + 10, this.y1 + 10, 30, 30, this.main_colour_hex, this.main_colour_hex)
		this.add.rectangle(this.x1 + 10, this.y1 + 40, 30, 30, this.main_colour_hex, this.main_colour_hex)
		this.add.rectangle(this.x1 + 10, this.y1 + 40, 30, 30, this.main_colour_hex, this.main_colour_hex)
	}

	draw_overworld() {
		for (let y = -1; y < 1; y++) {
			for (let x = -1; x < 1; x++) {
				this.draw_initial(x, y)
				console.log("ZZ ", this.zz)
				switch (this.zz) {
					case 1:
						this.draw_legend_1()
						break;
					case 2:
						this.draw_legend_2()
						break;
					case 3:
						this.draw_legend_3()
						break;
					case 4:
						this.draw_legend_4()
						break;
					case 5:
						this.draw_legend_5()
				}
			}
		}
	}

	draw_dungeon() {
		// TODO: Double check vars
		let dx = 0
		let dy = 0
		let dis = 0
		let px = 0
		let py = 0
		this.py = 0
		this.dy = 0
		let cent = this.dn[px + dx + dis][this.py + this.dy + dis]
	}

	navigate_dungeon() {
		// Get input from keybord and store it in Q
		var cursorKeys = this.input.keyboard.createCursorKeys();

		if (cursorKeys.up.isDown) {
			this.lbff_text(1, 12, "NORTH", 10, 24, this.style)
		}
		if (cursorKeys.down.isDown) {
			this.lbff_text(1, 12, "SOUTH", 10, 24, this.style)
		}
		if (cursorKeys.left.isDown) {
			this.lbff_text(1, 12, "TURN LEFT", 10, 24, this.style)
		}
		if (cursorKeys.right.isDown) {
			this.lbff_text(1, 12, "TURN RIGHT", 10, 24, this.style)
		}
	}

	create() {
		console.table(this.te)
		//this.character_create()

		// this.lbff_text(1, 12, "WELCOME TO AKALABETH, WORLD OF DOOM!", 10, 24, this.style)
		// this.draw_overworld()
		this.draw_legend_1()
		this.draw_legend_1()
		this.draw_legend_1()
		this.draw_legend_1()
		this.draw_legend_1()
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
		let style = { font: '24px Courier', fill: this.main_colour_string }
		let lines = ["TYPE THY LUCKY NUMBER.....", "LEVEL OF PLAY (1-10)......", "LINE 2", "LINE 3", "LINE 4"]

		lines.forEach(element => {
			lineNumber++
			this.lbff_text(1, lineNumber, element, margin, fontSize, style)
		});
		this.lbff_text(1, 6, "Level is " + this.level, margin, fontSize, style)
	}
}
