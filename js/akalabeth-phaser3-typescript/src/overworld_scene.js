// Overworld Scene
import Phaser from 'phaser'

export default class OverWorld extends Phaser.Scene {

    constructor() {
        super('akalabeth')
    }

    /**
     * @param {any} te
     * @param {any} tx
     * @param {any} ty
     * @param {number} x
     * @param {number} y
     */
    initial_draw(te, tx, ty, x, y) {
        this.line(138, 75, 142, 75, 0x00ff00)
        this.line(140, 73, 140, 77, 0x00ff00)
        this.zz = this.te[this.tx + x][this.ty + y]
        this.x1 = 65 + (x + 1) * 50
        this.y1 = (y + 1) * 50
    }


    case_draw() {
        console.log("ZZ ", this.zz)
        if (this.zz == 2) {
            this.add.rectangle(this.x1 + 20, this.y1 + 20, 10, 10, this.main_colour_hex, this.main_colour_hex)
        }
        if (this.zz == 3) {
            this.add.rectangle(this.x1 + 10, this.y1 + 10, 10, 30, this.main_colour_hex, this.main_colour_hex)
            this.add.rectangle(this.x1 + 40, this.y1 + 10, 10, 30, this.main_colour_hex, this.main_colour_hex)
            this.add.rectangle(this.x1 + 40, this.y1 + 10, 30, 10, this.main_colour_hex, this.main_colour_hex)
        }
        if (this.zz == 4) {
            this.add.rectangle(this.x1 + 20, this.y1 + 20, 10, 10, this.main_colour_hex, this.main_colour_hex)
            this.add.rectangle(this.x1 + 20, this.y1 + 20, 10, 10, this.main_colour_hex, this.main_colour_hex)
        }
        if (this.zz == 5) {
            this.add.rectangle(this.x1, this.y1, 50, 50, this.main_colour_hex, this.main_colour_hex)
            this.add.rectangle(this.x1 + 10, this.y1 + 10, 30, 30, this.main_colour_hex, this.main_colour_hex)
            this.add.rectangle(this.x1 + 10, this.y1 + 40, 30, 30, this.main_colour_hex, this.main_colour_hex)
            this.add.rectangle(this.x1 + 10, this.y1 + 40, 30, 30, this.main_colour_hex, this.main_colour_hex)
        }
        if (this.zz == 1) {
            this.add.rectangle(this.x1 + 10, this.y1 + 50, 10, 10, this.main_colour_hex, this.main_colour_hex)
            this.add.rectangle(this.x1, this.y1 + 10, 10, 10, this.main_colour_hex)
            this.add.rectangle(this.x1 + 50, this.y1 + 10, 10, 10, this.main_colour_hex)
            this.add.rectangle(this.x1, this.y1 + 40, 10, 10, this.main_colour_hex, this.main_colour_hex)
            this.add.rectangle(this.x1 + 40, this.y1 + 40, 10, 10, this.main_colour_hex)
            this.add.rectangle(this.x1 + 10, this.y1, 10, 10, this.main_colour_hex)
            this.add.rectangle(this.x1 + 40, this.y1, 10, 10, this.main_colour_hex)
        }
    }
}