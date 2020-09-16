class Util {
	
	public static function bz(n:Int) try{
		window.navigator.vibrate(n);
	}catch(e:Dynamic){};

}