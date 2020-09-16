class DrawTools {
	
	/**
	 *	Clear the canvas
	**/
	public static function clr(?col:String) {
		col != null ? frect(col, 0, 0, Game.w, Game.h) : CTX.clearRect(0, 0, Game.w, Game.h);
	}

	#if use_primatives
	/**
	 *	Draw a line with a given color, between points x1,y1 and x2,y2 with a given line weight
	**/
	public static function line(col:String, x1:Float, y1:Float, x2:Float, y2:Float, ?lw:Float) {
		ls(col, lw);
		CTX.moveTo(x1, y1);
		CTX.lineTo(x2, y2);
		CTX.stroke();
	}

	/**
	 *	Draw a filled circle with a given color, at coordinates x,y with a given radius
	**/
	public static function fcirc(col:String, x:Float, y:Float, r:Float) {
		CTX.fillStyle = col;
		CTX.beginPath();
		CTX.arc(x,y,r,0,2*PI);
		CTX.fill();
	}

	/**
	 * Draw a stroked circle with a given color, at coordinates x,y with a given radius and line weight
	**/
	public static function circ(col:String, x:Float, y:Float, r:Float, ?lw:Float) {
		ls(col, lw);
		CTX.arc(x,y,r,0,2*PI);
		CTX.stroke();
	}

	/**
	 *	Draw a filled rectangle with a given color, at coordinates x,y with a given width and height
	**/
	public static function frect(col:String, x:Float, y:Float, w:Float, h:Float) {
		CTX.fillStyle = col;
		CTX.fillRect(x,y,w,h);
	}

	/**
	 *	Draw a stroked rectangle with a given color, at coordinates x,y with a given width, height, and line weight
	**/
	public static function rect(col:String, x:Float, y:Float, w:Float, h:Float, ?lw:Float) {
		ls(col, lw);
		CTX.strokeRect(x,y,w,h);
	}

	static function ls(col:String, ?lw:Float) {
		CTX.lineWidth = lw != null ? lw : 1;
		CTX.strokeStyle = col;
		CTX.beginPath();
		return CTX;
	}

	#end

	#if use_sprites

	/**
	 *	Draw a sprite with a given ID, at coordinates x,y and a given offset and size
	 *	`ATTENTION`: make sure to use `Spr.l()` to load an image first!
	**/
	public static function spr(id:Int, x:Float, y:Float, ox:Float, oy:Float, w:Float, h:Float) {
		CTX.drawImage(Spr.m[id], ox, oy, w, h, x, y, w, h);
	}
	
	/**
	 *	Draw an atlas frame with a given ID at coordinates x,y
	**/
	public static function atl(id:Int, x:Float, y:Float) {
		var a = Spr.atl[id];
		CTX.drawImage(Spr.m[a.id], a.ox, a.oy, a.w, a.h, x, y, a.w, a.h);
	}

	#end

}