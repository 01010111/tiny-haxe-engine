# 01010111's Tiny Haxe Engine

This is a tiny haxe engine for making tiny HTML5 games! It's loosely inspired by Pico 8, and aims to provide similar functionality!

## Cheat Sheet

### Scenes

To start a new project, simply start coding in `MyScene`! A Scene must have two things to run properly, an `update()` function and a `draw()` function. These are called by the main game loop 60 times per second. If you want to load a new scene, use `Game.s = new MyNewScene()`.

### Drawing

There are several built in functions for drawing:

```haxe
// Clear the canvas
CTX.clr();

// Draw a black stroked circle at x:32, y:64, with a radius of 8 pixels, and a line width of 4
CTX.c('black', 32, 64, 8, 4);
// Draw a red filled circle at x:12, y:56, with a radius of 12 pixels
CTX.fc('#FF004D', 12, 56, 12);

// Draw a green stroked rectangle at x:8, y:16, with a width of 32, a height of 12, and a line width of 2 pixels
CTX.r('green', 8, 16, 32, 12, 2);
// Draw a yellow filled rectangle at the same position of the same size
CTX.r('#FF0', 8, 16, 32, 12);

// Draw a purple line from x:0, y:0 to x:100, y:100 with a default line width of 1 pixel
CTX.l('purple', 0, 0, 100, 100);
```

### Sprites

To use sprites, prepare a spritesheet with the graphics to use in your game. It should be a grid of frames. Before using it, you must load it.

```haxe
// Load your graphics, in this case a png containing 4 columns of 8x12px sprites, best to be done in your Scene's constructor
Sprite.load('my-sprites.png', 8, 12, 4);

// Draw a sprite to screen, use frame index 3, and draw it at x:24, y:72
CTX.spr(3, 24, 72);
// Use the next two arguments to draw a sprite that spans 2 frames horizontally, and 3 vertically
CTX.spr(3, 24, 72, 2, 3);
```

### Controls

You can use keyboard and mouse (or tap) to control your game!

```haxe
// Reference `C` for Controls, `C.p()` to see if a button is pressed, `C.jp()` to see if a button was just pressed.
console.log(C.p(32)); // will log whether the spacebar was pressed

// There are several shortcuts, `C.MOUSE` references the left mouse button
console.log(C.jp(C.MOUSE)); // will log if the left mouse button was just pressed

// There are more shortcuts to simulate a simple gamepad:
C.A; // X key
C.B; // C key
C.U; // Up key
C.D; // Down key
C.L; // Left key
C.R; // Right key

// If you need the mouse position reference `C.M`
console.log(C.M.x, C.M.y); // logs mouse x and y position
```

### Building

First, make sure haxe (at least version 4) is installed. You also need to install `uglifyjs`:
```haxelib install uglifyjs```

Run `haxe build.hxml` from the the project's root folder to generate several files:
- `bin/app.js` - this is the unminified version of your game, you can ignore it!
- `bin/app.min.js` - the minified tiny version of your game
- `bin/index.html` copied from `.template/index.html` (if you want to edit it, edit the one in the `.template` folder!)

You you use a sprite sheet, you should throw that in the `bin` folder as well!

Then you need to spin up a server and open `index.html` in your browser!

### Misc

To resize your game, change the `Game.init()` call in `.template/index.html` - by default it sets the game to 128x128px.

To resize the screen, you can mess with the CSS in `.template/index.html`.