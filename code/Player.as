package code {
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	
	public class Player extends MovieClip {
		
		/*sets gravity */
		private var gravity:Point = new Point(0,200);
		/*sets max speed of player */
		private var maxSpeed:Number = 300;
		/*sets velocity for 2 points */
		private var velocity:Point = new Point(1, 5);
		/*sets ground level */
		private var ground:Number = 350;
		
		/*determins if the player is currently jumping */
		private var isJumping = false;
		/*determines if player can jump again in the air. */
		private var doubleJumpReady:Boolean = true; 
		/*the current jump height of the player */
		private var currentJump:Number = 0;
		/*determins if the player is at ground level */
		private var downBumping:Boolean = false;
		/*determines if the plaeyr already was double jumping */
		private var alreadyJumped:Boolean = false;
		
		/*horizontal acceleration of the player*/
		private const HORIZONTAL_ACCELERATION:Number = 800;
		/*horizontal deceleration of the player */
		private const HORIZONTAL_DECELERATION:Number = 800;
		
		/*timer to determine how far player jumps */
		private var timer:Number = .5; 
		/*start of the player function */
		public function Player() {
			// constructor code
		} // ends constructor
		/*update function */
		public function update():void {
			
			


			
			handleWalking();
			doPhysics();			
			detectGround();
			checkJump();
			
		}
		/**
		 * This function looks at the keyboard input in order to accelerate the player
		 * left or right. As a result, this function changes the player's velocity.
		 */
		private function handleWalking():void {
			if(KeyboardInput.IsKeyDown(Keyboard.LEFT)) velocity.x -= HORIZONTAL_ACCELERATION * Time.dt;
			if(KeyboardInput.IsKeyDown(Keyboard.RIGHT)) velocity.x += HORIZONTAL_ACCELERATION * Time.dt;
			
			if(!KeyboardInput.IsKeyDown(Keyboard.LEFT) && !KeyboardInput.IsKeyDown(Keyboard.RIGHT)){ // left and right not being pressed...
				if(velocity.x < 0){ // moving left
					velocity.x += HORIZONTAL_DECELERATION * Time.dt; // accelerate right
					if(velocity.x > 0) velocity.x = 0; // clamp at 0
				}
				if(velocity.x > 0){ // moving right
					velocity.x -= HORIZONTAL_DECELERATION * Time.dt; // accelerate left
					if(velocity.x < 0) velocity.x = 0; // clamp at 0
				}
			}
			
		}
		/**
		 * This function looks at the players input to determine what the player will do 
		 * detremins if the player goes up down sideways depending on keyboard inputs 
		 */
		private function doPhysics():void {
			// apply gravity to velocity:
			velocity.x += gravity.x * Time.dt;
			/*determins if player is jumping */
			if(isJumping)
			{
				velocity.y -= gravity.y * Time.dt;
			}
			else
			{
				velocity.y += gravity.y * Time.dt;
			}
			/*determins how high player can currently jump */
			if(y <= currentJump)
				{
					isJumping = false;
				
				}
				/*determins if the player is able to double jump */
			if(doubleJumpReady == false && alreadyJumped == false)
			{
				isJumping = true;
				velocity.y -= gravity.y * Time.dt;
				currentJump = 0;
				alreadyJumped = true;
				trace("activate");
			}
				
			

			// constrain to maxSpeed:
			if(velocity.x > maxSpeed) velocity.x = maxSpeed; // clamp going right
			if(velocity.x <-maxSpeed) velocity.x = -maxSpeed; // clamp going left
			
			// apply velocity to position:
			x += velocity.x * Time.dt;
			y += velocity.y * Time.dt;
		}
		/*This function detects if the player is on the ground which is essential to determine if player is jumping */
		private function detectGround():void {
			// look at y position
			if(y > ground) {
				y = ground; // clamp
				velocity.y = 0;
				downBumping = true;
			}
			else downBumping = false;
		}
		/*determines if player is able to jump and if they are double jumping or not */
		private function checkJump():void{
						
				
			if(KeyboardInput.OnKeyDown(Keyboard.SPACE)){
				if(!isJumping && y == ground)
				{
				isJumping = true;
				}

				if(!isJumping && doubleJumpReady && y != ground)
				{
					doubleJumpReady = false
					isJumping = true;
					
					
				}
				/*sets timer when user hits the space button */
				if(timer <= 1){
				timer = timer + Time.dt * 100;
					
			}

			}
			/*see's if the player is able to jump double jump ect*/
			if(isJumping && !doubleJumpReady && y == ground)
				{
					isJumping = false;
					doubleJumpReady = true;
					alreadyJumped = false;
				}
			if(isJumping && doubleJumpReady){ 
			currentJump = 350 - (50 * timer);
				trace(currentJump);
		}
	}
		
	} // ends Player class
	
} // ends package
