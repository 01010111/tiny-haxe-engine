import js.html.DivElement;
import js.html.CanvasRenderingContext2D;
#if keep @:keep #end
@:expose('Game')
class Game {
	
	// context for drawing - reference `CTX` globally
	public static var ctx:CanvasRenderingContext2D;
	// width and height
	public static var w:Int;
	public static var h:Int;
	// zoom scalars for calculating mouse position
	public static var zx:Float;
	public static var zy:Float;
	// current scene
	public static var s:Scene;
	#if fr
	// for calculating framerate:
	static var last_time:Float = 0;
	// container for showing framerate
	static var fr_el:DivElement;
	#end

	/**
	 *	Starts the engine. Pass parent element's id, and desired width and height
	**/
	static function init(p:String,_w:Int,_h:Int) {
		document.addEventListener('contextmenu', e -> e.preventDefault());
		// Create a canvas element and append it to the desired parent element
		var c = document.createCanvasElement();
		var el = document.getElementById(p);
		el.appendChild(c);
		// Set width and height
		w = c.width = _w;
		h = c.height = _h;
		// Set the main canvas context
		ctx = c.getContext2d();
		// Initialize controls
		C.init();
		// Reset zoom variables on resize
		window.onresize = (e) -> {
			zx = el.offsetWidth/_w;
			zy = el.offsetHeight/_h;
		}
		window.onresize();
		// Game loop:
		window.requestAnimationFrame(loop);
		// Start game
		Main.main();
		#if fr
		document.body.appendChild(fr_el = document.createDivElement());
		#end
	}
	
	static function loop(e:Float) {
		s.update();
		s.draw();
		#if fr
		var fr = '${(10000/(e - last_time)).round()/10}';
		if (fr.length < 4) fr += '.0';
		fr_el.innerText = '$fr fps';
		last_time = e;
		#end
		window.requestAnimationFrame(loop);
	}
	
}

interface Scene {
	public function update():Void;
	public function draw():Void;
}