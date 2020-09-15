import js.html.CanvasRenderingContext2D;
#if keep @:keep #end
@:expose('Game')
class Game {
	public static var ctx:CanvasRenderingContext2D;
	public static var w:Int;
	public static var h:Int;
	public static var zx:Float;
	public static var zy:Float;
	public static var s:Scene;
	#if fr
	static var last_time:Float;
	#end
	static function init(p:String,_w:Int,_h:Int) {
		var c = document.createCanvasElement();
		var el = document.getElementById(p);
		el.appendChild(c);
		w = c.width = _w;
		h = c.height = _h;
		ctx = c.getContext2d();
		Controls.init();
		window.onresize = (e) -> {
			zx = el.offsetWidth/_w;
			zy = el.offsetHeight/_h;
		}
		window.onresize();
		window.setInterval(() -> {
			s.update();
			s.draw();
			#if fr
			var fr = 1000/(Date.now().getTime() - last_time);
			if (last_time != null) if (fr <= 55) console.log(fr);
			last_time = Date.now().getTime();
			#end
		}, 16.667);
		Main.main();
	}
}

interface Scene {
	public function update():Void;
	public function draw():Void;
}