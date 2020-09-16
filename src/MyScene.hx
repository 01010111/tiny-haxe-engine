import Game.Scene;

class MyScene implements Scene {

	var p:Array<Spr> = [];

	public function new() {
		Sprite.load('s.png', 8, 8, 4);
	}
	
	public function update() {
		for (o in p) {
			if (o.x + 10 > Game.w && o.dx > 0 || o.x < 0 && o.dx < 0) o.dx *= -1;
			if (o.y + 10 > Game.h && o.dy > 0 || o.y < 0 && o.dy < 0) o.dy *= -1;
		}
		if (C.p(-1)) {
			p.push({id:p.length%4,x:C.M.x-4,y:C.M.y-4,dx:Math.random() - 0.5,dy:Math.random() - 0.5});
			Util.bz(10);
		}
		if (C.p(-3)) for (o in p) if ((o.x-C.M.x).abs()<8&&(o.y-C.M.y).abs()<8)p.remove(o);
		if (C.p(88)) for (o in p) {
			o.dx *= 0.9;
			o.dy *= 0.9;
		}
		if (C.jp(67)) for (o in p) {
			o.dx = Math.random() - 0.5;
			o.dy = Math.random() - 0.5;
		}
		if (C.jp(83)) Save.s('test', {p:p});
		if (C.jp(76)) {
			var l = Save.l('test');
			p = l == null ? [] : l.p;
		}
	}

	public function draw() {
		CTX.fr('black',0,0,Game.w,Game.h);
		if (C.p(-3)) CTX.c('red',C.M.x, C.M.y,8,4);
		for (o in p) CTX.spr(o.id,o.x += o.dx, o.y += o.dy, 1, 1);
	}

}

typedef Spr = {
	id:Int,
	x:Float,
	y:Float,
	dx:Float,
	dy:Float
}