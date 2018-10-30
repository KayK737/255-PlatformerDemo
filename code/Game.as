package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Game extends MovieClip {
		
		
		public function Game() {
			/*stages keyboard input */
			KeyboardInput.setup(stage);
			/*starts game when player enters frame */
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		private function gameLoop(e:Event):void {
			/*updates time*/
			Time.update();
			/*updates player */
			player.update();
			
			/*updates keyboard */
			KeyboardInput.update();
		} // ends gameLoop()
		
		
	} // ends Game class
	
} // ends package
