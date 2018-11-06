package code {
	
	import flash.display.MovieClip;
	
	
	public class Platform extends MovieClip {
		
		public var collider:AABB;
		
		public function Platform() {
			/** sets width and height for platform */
			collider = new AABB(width/2, height/2);
			/** sets the edges for the platform */
			collider.calcEdges(x, y);
			
			
			// add to platforms array...
			Game.platforms.push(this);
			
			
		}
	}
	
}
