import Game.Scene;

class MyScene implements Scene {

	var p:Array<Array<Float>> = [];

	public function new() {
		Sprite.load('s1.png', 8, 8, 4);
	}
	
	public function update() {
		for (o in p) {
			if (o[0] + 10 > Game.w && o[2] > 0 || o[0] < 0 && o[2] < 0) o[2] *= -1;
			if (o[1] + 10 > Game.h && o[3] > 0 || o[1] < 0 && o[3] < 0) o[3] *= -1;
		}
		if (C.p(C.MOUSE)) p.push([C.M.x-4,C.M.y-4,Math.random() - 0.5,Math.random() - 0.5]);
		if (C.p(C.U)) for (o in p) o[3] -= 0.1;
		if (C.p(C.D)) for (o in p) o[3] += 0.1;
		if (C.p(C.L)) for (o in p) o[2] -= 0.1;
		if (C.p(C.R)) for (o in p) o[2] += 0.1;
		if (C.p(C.A)) for (o in p) {
			o[2] *= 0.9;
			o[3] *= 0.9;
		}
		if (C.jp(C.B)) for (o in p) {
			o[2] = Math.random() - 0.5;
			o[3] = Math.random() - 0.5;
		}
	}

	public function draw() {
		CTX.fr('black',0,0,Game.w,Game.h);
		CTX.c('green',64, 64, 32, 2);
		for (i in 0...p.length) CTX.spr(i%4, p[i][0] += p[i][2], p[i][1] += p[i][3], 1, 1);
	}

}