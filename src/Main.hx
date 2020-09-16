class Main {
	
	public static function main() {
		#if framework_only Game.s = cast {update:()->{},draw:()->{}} #else
			// This is where your scene is initially loaded!
			Game.s = new MyScene();
		#end
	}

}