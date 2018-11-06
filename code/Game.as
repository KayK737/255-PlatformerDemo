package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	
	
	public class Game extends MovieClip {
		
		
		public function Game() {
			KeyboardInput.setup(stage);
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		private function gameLoop(e:Event):void {
			Time.update();
			player.update();
			
			doCollisionDetection();
			
			KeyboardInput.update();
		} // ends gameLoop()
		
		private function doCollisionDetection():void {
			
			if(player.collider.checkOverlap(platform.collider)){// if overlapping ...
				//find the fix:
				var fix:Point = player.collider.findOverlapFix(platform.collider);
				//apply the fix:
				player.applyFix(fix);
			}
			
		}
		
	} // ends Game class
	
} // ends package
