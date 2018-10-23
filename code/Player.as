﻿package code {
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	
	public class Player extends MovieClip {
				
		private var gravity:Point = new Point(0, 100);
		private var velocity:Point = new Point(1, 5);
		
		public function Player() {

		}//ends player function
		
		public function update():void{
			

			doPhysics()
			detectGround();
			
			
		}//ends update class
		
		private function doPhysics():void{
			
			//apply gravity to velocity:
			velocity.x += gravity.x * Time.dt;
			velocity.y += gravity.y * Time.dt;
			
			//apply velocity to position:
			x += velocity.x * Time.dt;
			y += velocity.y * Time.dt;
			
		}//ends doPhysics class
		
		private function detectGround():void{
			
			// look at y position
			var ground:Number = 350;
			if(y > ground) {				
			y = ground;
			velocity.y = 0;
			}
			
		}//ends detect ground class
		
	}//ends player class
	
}//ends package
