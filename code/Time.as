package code {
	
	import flash.utils.getTimer;
	/** the class for handling all game time */
	public class Time {
		
		/**
		* How much time has passes since prev frame.
		*/
		public static var dt:Number = 0;
		/**
		* a scaled version of deltaTime (dt). uses time.scale.
		*/
		public static var dtScaled:Number = 0;
		/**
		* The current frames timestamp. how many milliseconds have passes since the game started 
		*/
		public static var time:Number = 0;
		/** 
		*a scalar for dtscaled. Use this to create slow-me effects or to pause the game.
		*/
		public static var scale:Number = 1;
		/**
		*the timestamp of the previous time, measured in milliseconds 
		*/
		private static var timePrev:Number = 0;
		
		/**
		*The method calculates deltaTime. it should be called 
		*ONCE to get 
		*/
		public static function update():void {
			
			time = getTimer();
			dt = (time - timePrev) / 1000;
			dtScaled = dt * scale;
			timePrev = time; // cache for next frame
		}
	}//ends time class
}//ends package
