#if keep @:keep #end
class Controls {

	// Mouse position
	public static var M = {x:0,y:0}
	
	static var k:Map<Int,Bool> = [];
	static var l:Map<Int,Bool> = [];
	
	/**
	 *	Starts listeners for controls
	**/
	public static function init() {
		document.onkeydown = (e) -> k.set(e.keyCode, true);
		document.onkeyup = (e) -> k.set(e.keyCode, false);
		CTX.canvas.onpointerdown = (e) -> k.set(-1 - e.button, true);
		CTX.canvas.onpointerup = (e) -> k.set(-1 - e.button, false);
		CTX.canvas.ontouchstart = (e) -> k.set(-1, true);
		CTX.canvas.ontouchend = (e) -> k.set(-1, false);
		CTX.canvas.onpointermove = (e) -> M = {x: (e.offsetX / Game.zx).floor(),y: (e.offsetY / Game.zy).floor()}
		CTX.canvas.ontouchmove = (e) -> {
			console.log(e);
			var t = e.touches.pop();
			M = {x: (t.clientX / Game.zx).floor(),y: (t.clientY / Game.zy).floor()}
		}
	}

	/**
	 *	Check the state of a button
	**/
	public static function p(n:Int):Bool return k.exists(n) && k[n];
	
	/**
	 *	Check to see if a button was just pressed
	**/
	public static function jp(n:Int):Bool {
		if (!k.exists(n)) return false;
		if (!l.exists(n)) {
			l.set(n, k[n]);
			return k[n];
		}
		var o = l[n] != k[n] && k[n];
		l.set(n, k[n]);
		return o;
	}
}