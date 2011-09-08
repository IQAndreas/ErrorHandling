package aRenberg.errors
{
	import aRenberg.logging.Log;
	import aRenberg.logging.LogData;
	
	import flash.utils.getQualifiedClassName;
	
	public class TargetedError extends LogMessage
	{
		
		//public static const nullTargetError:String = "Target required for Error {{CLASS}}";
		public static const defaultMessage:String = "Error at {{CLASS}}";
		
		//Assumed to be a "GENERAL ERROR" unless told otherwise!
		public function TargetedError(target:*, ... message)
		{
			_target = target;
			
			super(Log.GENERAL | Log.ERROR, message.length ? message.join(" ") : defaultMessage);
			
			var className:String = (target ? getQualifiedClassName(target) : "unknown class");
			this.addParam("CLASS", className);
		}
		
		protected function setDefaultType(type:uint):void
		{
			this._type = type;
		}
		
		
		private var _target:* = null;
		public function get target():*
		{ return _target; }
		
		public function get targetClass():Class
		{
			return (_target ? _target.constructor : null);
		}
		
	}
}