import js.html.CanvasRenderingContext2D;
#if keep @:keep #end
class DrawTools {

	/**
	 *	Draw a line with a given color, between points x1,y1 and x2,y2 with a given line weight
	**/
	public static function l(ctx:CanvasRenderingContext2D, col:String, x1:Float, y1:Float, x2:Float, y2:Float, ?lw:Float) {
		ctx.ls(col, lw);
		ctx.moveTo(x1, y1);
		ctx.lineTo(x2, y2);
		ctx.stroke();
		return ctx;
	}

	/**
	 *	Draw a filled circle with a given color, at coordinates x,y with a given radius
	**/
	public static function fc(ctx:CanvasRenderingContext2D, col:String, x:Float, y:Float, r:Float) {
		ctx.fillStyle = col;
		ctx.beginPath();
		ctx.arc(x,y,r,0,2*PI);
		ctx.fill();
		return ctx;
	}

	/**
	 * Draw a stroked circle with a given color, at coordinates x,y with a given radius and line weight
	**/
	public static function c(ctx:CanvasRenderingContext2D, col:String, x:Float, y:Float, r:Float, ?lw:Float) {
		ctx.ls(col, lw);
		ctx.arc(x,y,r,0,2*PI);
		ctx.stroke();
		return ctx;
	}

	/**
	 *	Draw a filled rectangle with a given color, at coordinates x,y with a given width and height
	**/
	public static function fr(ctx:CanvasRenderingContext2D, col:String, x:Float, y:Float, w:Float, h:Float) {
		ctx.fillStyle = col;
		ctx.fillRect(x,y,w,h);
		return ctx;
	}

	/**
	 *	Draw a stroked rectangle with a given color, at coordinates x,y with a given width, height, and line weight
	**/
	public static function r(ctx:CanvasRenderingContext2D, col:String, x:Float, y:Float, w:Float, h:Float, ?lw:Float) {
		ctx.ls(col, lw);
		ctx.strokeRect(x,y,w,h);
		return ctx;
	}

	/**
	 *	Clear the canvas
	**/
	public static function clr(ctx:CanvasRenderingContext2D) {
		ctx.clearRect(0, 0, Game.w, Game.h);
	}

	/**
	 *	Draw a sprite with a given frame index, at coordinates x,y and optionally use multiple frames with given frame width and frame height
	 *	`ATTENTION`: make sure to use `Sprite.load()` first!
	**/
	public static function spr(ctx:CanvasRenderingContext2D, n:Int, x:Float, y:Float, ?w:Int, ?h:Int) {
		w = (w != null ? w : 1) * Sprite.fw;
		h = (h != null ? h : 1) * Sprite.fh;
		ctx.drawImage(Sprite.s, n % Sprite.col * Sprite.fw, (n / Sprite.col).floor() * Sprite.fh, w, h, x.round(), y.round(), w, h);
	}

	static function ls(ctx:CanvasRenderingContext2D, col:String, ?lw:Float) {
		ctx.lineWidth = lw != null ? lw : 1;
		ctx.strokeStyle = col;
		ctx.beginPath();
		return ctx;
	}
}