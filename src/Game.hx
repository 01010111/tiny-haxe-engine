import js.html.DivElement;
import js.html.CanvasRenderingContext2D;

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

	// elapsed time
	public static var t:Float;

	// Framerate vars
	#if show_framerate
	static var last_time:Float = 0;
	static var fr_el:DivElement;
	#end

	/**
	 *	Starts the engine. Pass parent element's id, and desired width and height
	**/
	static function init(p:String,_w:Int,_h:Int) {
		// Create container for framerate
		#if show_framerate document.body.appendChild(fr_el = document.createDivElement()); #end

		// Prevent right clicks so we can use them in a game
		document.oncontextmenu = (e) -> e.preventDefault();

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
		Controls.init();
		
		// Reset zoom variables on resize
		window.onresize = (e) -> {
			zx = el.offsetWidth/_w;
			zy = el.offsetHeight/_h;
		}
		window.onresize();
		
		// Start game loop
		window.requestAnimationFrame(loop);
		
		// Start game
		Main.main();
	}
	
	// Our game loop
	static function loop(e:Float) {
		t = e;
		s.update();
		s.draw();
		#if show_framerate
		var fr = '${(10000/(e - last_time)).round()/10}';
		if (fr.length < 4) fr += '.0';
		fr_el.innerText = '$fr fps';
		last_time = e;
		#end
		window.requestAnimationFrame(loop);
	}
	
}