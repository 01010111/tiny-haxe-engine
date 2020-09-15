import js.html.ImageElement;
#if keep @:keep #end
class Sprite {
	// The image used to stamp the canvas with
	public static var s:ImageElement;
	// Frame width
	public static var fw:Int;
	// Frame height
	public static var fh:Int;
	// Number of columns in image
	public static var col:Int;

	/**
	 *	Load a spritesheet with a given source, frame width, frame height, and number of columns of frames
	**/
	public static function load(src:String,fw:Int,fh:Int,col:Int) {
		var d = document.createDivElement();
		d.style.display = 'none';
		document.body.appendChild(d);
		s = document.createImageElement();
		s.src = src;
		d.appendChild(s);
		Sprite.fw = fw;
		Sprite.fh = fh;
		Sprite.col = col;
	}
}