# 01010111's Tiny Haxe Engine

This is a tiny haxe engine for making tiny HTML5 games! It's loosely inspired by Pico 8, and aims to provide similar functionality!

## Cheat Sheet

### Scenes

To start a new project, simply start coding in `MyScene`! A Scene must have two things to run properly, an `update()` function and a `draw()` function. These are called by the main game loop 60 times per second. If you want to load a new scene, use `Game.s = new MyNewScene()`.

### Drawing

There are several built in functions for drawing:

```haxe
// Clear the canvas
clr();

// Draw a black stroked circle at x:32, y:64, with a radius of 8 pixels, and a line width of 4
circ('black', 32, 64, 8, 4);
// Draw a red filled circle at x:12, y:56, with a radius of 12 pixels
fcirc('#FF004D', 12, 56, 12);

// Draw a green stroked rectangle at x:8, y:16, with a width of 32, a height of 12, and a line width of 2 pixels
rect('green', 8, 16, 32, 12, 2);
// Draw a yellow filled rectangle at the same position of the same size
frect('#FF0', 8, 16, 32, 12);

// Draw a purple line from x:0, y:0 to x:100, y:100 with a default line width of 1 pixel
line('purple', 0, 0, 100, 100);
```

### Sprites

To use sprites, prepare a spritesheet with the graphics to use in your game. It should be a grid of frames. Before using it, you must load it.

```haxe
// Load an image to be used in game with an integer ID
Spr.l('my-sprites.png', 0);

// Draw a portion of the sprite (with an ID of 0) to screen at x:8, y:12, the portion is found at x:16, y:32 on the sprite and has a width of 24 and a height of 64
spr(0, 8, 12, 16, 32, 24, 64);

// Instead of referencing all those numbers you can store an atlas frame with a given ID (in this case we'll use 9), and the same arguments for offset and size
Spr.a(9, 0, 16, 32, 24, 64);
atl(9, 8, 12);
```

### Controls

You can use keyboard and mouse (or tap) to control your game!

```haxe
// `Controls.p()` to see if a button is pressed, `Controls.jp()` to see if a button was just pressed. Just pass through the keycode of the key you want to check!
console.log(Controls.p(32)); // will log whether the spacebar was pressed

// It also tracks mouse clicks. You can refernce them like this:
Controls.p(-1); // Left mouse button
Controls.p(-2); // Middle mouse button
Controls.p(-3); // Right mouse button

// If you need the mouse position reference `Controls.M`
console.log(Controls.M.x, Controls.M.y); // logs mouse x and y position
```

[keycode.info](https://keycode.info/) is my favorite place to quickly determine the keycode of a specific key!

### Building

First, make sure haxe (at least version 4) is installed. You also need to install `uglifyjs`:
```haxelib install uglifyjs```

Run `haxe build.hxml` from the the project's root folder to generate several files:
- `bin/app.js` - this is the unminified version of your game, you can ignore it!
- `bin/app.min.js` - the minified tiny version of your game
- `bin/index.html` copied from `.template/index.html` (if you want to edit it, edit the one in the `.template` folder!)

Make sure to add your assets to the `bin` folder as well!

Then you need to spin up a server and open `index.html` in your browser!

### Misc

To resize your game, change the `Game.init()` call in `.template/index.html` - by default it sets the game to 128x128px.

To resize the screen, you can mess with the CSS in `.template/index.html`.

## Roadmap

- [ ] Sprite features
  - [ ] FlipX/Y
  - [ ] Rotation?
- [ ] Audio
- [x] Vibration
- [x] Saving/loading
- [x] Use `requestAnimationFrame()`