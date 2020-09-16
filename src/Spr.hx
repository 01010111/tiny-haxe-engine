import js.html.ImageElement;

class Spr {
	
	// map of available sprites
	public static var m:Map<Int, ImageElement> = [];

	// map of atlases
	public static var atl:Map<Int, {id:Int,ox:Float,oy:Float,w:Float,h:Float}> = [];

	/**
	 *	Load a sprite from a given source. The sprite's ID will be the filename without an extention:
	 *	ie: a src of `assets/my_img.png` will produce this ID: `my_img`
	**/
	public static function l(src:String, id:Int) {
		var d = document.createDivElement();
		d.style.display = 'none';
		document.body.appendChild(d);
		var s = document.createImageElement();
		s.src = src;
		d.appendChild(s);
		m.set(id, s);
	}

	/**
	 *	Register an atlas frame with a given ID, and referencing the source image ID, and describing the frame's offset and size
	**/
	public static function a(id:Int, sid:Int, ox:Float, oy:Float, w:Float, h:Float) atl.set(id, { id: sid, ox: ox, oy: oy, w: w, h: h });

}