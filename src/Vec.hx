class Vec {
	static var p:Array<Vec> = [];
	public static function get(x,y) {
		if (p.length > 0) return p.shift().set(x,y);
		return new Vec().set(x,y);
	}
	public var x:Float;
	public var y:Float;
	public var l(get,set):Float;
	public var a(get,set):Float;
	function get_l():Float {
		return (x*x + y*y).sqrt();
	}
	function set_l(n:Float):Float {
		normalize();
		set(x*n,y*n);
		return n;
	}
	function get_a():Float return Math.atan2(y,x);
	function set_a(n:Float):Float {
		set(l*n.cos(), l*n.sin());
		return n;
	}
	function new(){}
	public function set(x,y) {
		this.x = x;
		this.y = y;
		return this;
	}
	public function put() p.push(this);
	public function normalize() set(x/l,y/l);
}