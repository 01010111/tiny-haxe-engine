import js.html.ImageElement;
#if keep @:keep #end
class Sprite {
	public static var s:ImageElement;
	public static var fw:Int;
	public static var fh:Int;
	public static var col:Int;
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