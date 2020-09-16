class Main {
	
	public static function main() {
		#if !framework_only
			// This is where your scene is initially loaded!
			Game.s = new MyScene();
		#end
	}

}