package flash.display
{
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	public class Shape extends DisplayObject
	{
		private var _graphics:Graphics;
		public function Shape()
		{
			super();
		}
		
		public function get graphics():Graphics
		{
			if (_graphics == null)
			{
				_graphics = new Graphics;
			}
			return _graphics;
		}
		
		override public function __update():void
		{
			if (hasEventListener(Event.ENTER_FRAME))
				dispatchEvent(new Event(Event.ENTER_FRAME));
			if (stage&&visible&&graphics.graphicsData.length)
				graphics.draw(stage.ctx, worldMatrix,worldAlpha,blendMode,transform._colorTransform);
		}
		
		override public function hitTestPoint(x:Number, y:Number, shapeFlag:Boolean = false):Boolean 
		{
			return false;
		}
		
		override public function __getRect():Rectangle 
		{
			return graphics.bound;
		}
	}
}
