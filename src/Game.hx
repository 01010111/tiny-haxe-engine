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
	// for calculating framerate:
	#if fr static var last_time:Float; #end

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
		window.setInterval(() -> {
			s.update();
			s.draw();
			#if fr
			var fr = 1000/(Date.now().getTime() - last_time);
			if (last_time != null) if (fr <= 55) console.log(fr);
			last_time = Date.now().getTime();
			#end
		}, 16.667);
		// Start game
		Main.main();
	}
	
}

interface Scene {
	public function update():Void;
	public function draw():Void;
}