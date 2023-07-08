# Code Notebook

## Phaser Text

https://photonstorm.github.io/phaser3-docs/Phaser.GameObjects.Text.html

You can only display fonts that are currently loaded and available to the browser: therefore fonts must be pre-loaded. Phaser does not do ths for you, so you will require the use of a 3rd party font loader, or have the fonts ready available in the CSS on the page in which your Phaser game resides.

```javascript
this.add.text(0, 0, "Hello World", { font: '"Press Start 2P"' });
```

```javascript
new Text(scene, x, y, text, style);

// scene: Phaser.Scene
// x: horizontal position
// y: vertical position
// text: string
// style: Phaser.Types.GameObjects.Text.TextStyle
```
