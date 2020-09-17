class DrawTools {
	
	/**
	 *	Clear the canvas
	**/
	public static function clr(?col:String) {
		#if use_primatives
		col != null ? frect(col, 0, 0, Game.w, Game.h) : CTX.clearRect(0, 0, Game.w, Game.h);
		#else
		if (col == null) CTX.clearRect(0, 0, Game.w, Game.h);
		else {
			CTX.fillStyle = col;
			CTX.fillRect(0, 0, Game.w, Game.h);
		}
		#end
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

	#if use_transform
	/**
	 *	Draw a sprite at coordinates x,y and a given id, offset, size, and options
	 *	`ATTENTION`: make sure to use `Spr.l()` to load an image first!
	**/
	public static function spr(x:Float, y:Float, sprite:{id:Int, ox:Float, oy:Float, w:Float, h:Float}, ?options:{?a:Float,?sx:Float,?sy:Float,?r:Float}) {
		options = {
			a: options != null && options.a != null ? options.a : 1,
			sx: options != null && options.sx != null ? options.sx : 1,
			sy: options != null && options.sy != null ? options.sy : 1,
			r: options != null && options.r != null ? options.r : 1
		}
		var i_hat = Vec.get(options.sx, 0);
		var j_hat = Vec.get(0, options.sy);
		var offset = Vec.get(sprite.w / 2, sprite.h / 2);
		i_hat.a += options.r;
		j_hat.a += options.r;
		CTX.save();
		CTX.transform(i_hat.x, j_hat.x, i_hat.y, j_hat.y, x, y);
		CTX.transform(1,0,0,1,-offset.x,-offset.y);
		CTX.globalAlpha = options.a;
		CTX.drawImage(Spr.m[sprite.id], sprite.ox, sprite.oy, sprite.w, sprite.h, 0, 0, sprite.w, sprite.h);
		CTX.restore();
		i_hat.put();
		j_hat.put();
		offset.put();
	}
	
	/**
	*	Draw an atlas frame with a given ID at coordinates x,y with options
	**/
	public static function atl(id:Int, x:Float, y:Float, ?options:{?a:Float,?sx:Float,?sy:Float,?r:Float}) {
		spr(x,y,Spr.atl[id],options);
	}

	#else

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

	#end

}