import js.Browser;

@:keep
class Save {
	
	/**
	 *	Save an object to local storage with a given string, returns false if saving is impossible
	**/
	public static function s(s:String, d:Dynamic):Bool {
		if (Browser.getLocalStorage() == null) return false;
		Browser.getLocalStorage().setItem(s,d.stringify());
		return true;
	}

	/**
	 *	Load an object to local storage, returns null if nothing is found
	**/
	public static function l(s:String):Dynamic {
		if (Browser.getLocalStorage() == null) return null;
		return Browser.getLocalStorage().getItem(s).parse();
	}

}