package code {
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	public class Player extends MovieClip {
				
		private var gravity:Point = new Point(0, 100);
		private var velocity:Point = new Point(1, 5);
		private var maxSpeed:Number = 200;
		private const HORIZONTAL_ACCELERATION:Number = 10;
		private const HORIZONTAL_DECELERATION:Number = 10;
		
		
		public function Player() {

		}//ends player function
		
		public function update():void{
			
			if(KeyboardInput.OnKeyDown(Keyboard.SPACE){
				trace("jump");
			}

			handleWalking();	
			doPhysics();
			detectGround();
			
			
		}//ends update class
		/**
		*this function looks at keyboard input in order to accelerate the player left or right 
		*/
		private function handleWalking():void{
			if(KeyboardInput.IsKeyDown(Keyboard.LEFT)) velocity.x -= HORIZONTAL_ACCELERATION * Time.dt;
			if(KeyboardInput.IsKeyDown(Keyboard.RIGHT)) velocity.x += HORIZONTAL_ACCELERATION * Time.dt;
			
			if(!KeyboardInput.IsKeyDown(Keyboard.LEFT) && !KeyboardInput.Keyboard.RIGHT){
				if(velocity.x < 0){
					velocity.x += HORIZONTAL_DECELERATION * Time.dt;
					if(velocity.x > 0) velocity.x = 0;
					
				}
				if(velocity.x > 0){
					velocity.x -= HORIZONTAL_DECELERATION * Time.dt;
					if(velocity.x < 0) velocity.x = 0;
				}
			}
		}
		private function doPhysics():void{
			
			//apply gravity to velocity:
			velocity.x += gravity.x * Time.dt;
			velocity.y += gravity.y * Time.dt;
			
			//constrain to maxSpeed
			if(velocity.x > maxSpeed) velocity.x = maxSpeed; // clamp going right
			if(velocity.x > -maxSpeed) velocity.x = -maxSpeed; // clamp going left
			
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
