package aRenberg.errors
{
	import aRenberg.logging.Log;
	import aRenberg.logging.LogData;
	
	import flash.events.ErrorEvent;
	import flash.utils.getQualifiedClassName;
	
	public class TargetedError extends LogMessage
	{
		
		//Is it better to always keep "target" as the first function parameter for consistency?
		public static function fromError(error:Error, target:* = null):TargetedError
		{
			var logData:TargetedError = new TargetedError(target, "{{CLASS}} - {{ERROR_NAME}}: {{ERROR_MESSAGE}}");
			logData.addParam('ERROR_NAME', error.name);
			logData.addParam('ERROR_MESSAGE', error.message);
			logData.addParam('ERROR_ID', error.errorID);
			//Keep the stack trace as well?
			
			//Note that the data property may be overriden by subsequent calls to "setData()"
			logData.setData(error);
			
			return logData;
		}
		
		//Is it better to always keep "target" as the first function parameter for consistency?
		public static function fromErrorEvent(errorEvent:ErrorEvent, target:* = null):TargetedError
		{
			target ||= errorEvent.currentTarget;
			
			var logData:TargetedError = new TargetedError(target, "{{CLASS}} - {{ERROR_NAME}}: {{ERROR_MESSAGE}}");
			logData.addParam('ERROR_NAME', errorEvent.type);
			logData.addParam('ERROR_MESSAGE', errorEvent.text);
			
			//Note that the data property may be overriden by subsequent calls to "setData()"
			logData.setData(errorEvent);
			
			return logData;
		}
		
		
		//public static const nullTargetError:String = "Target required for Error {{CLASS}}";
		public static const defaultMessage:String = "Error at {{CLASS}}";
		
		//Assumed to be a "GENERAL ERROR" unless told otherwise!
		public function TargetedError(target:*, ... message)
		{
			_target = target;
			
			super(Log.GENERAL | Log.ERROR, message.length ? message.join(" ") : defaultMessage);
			
			//Should I add a property which gives access to the stack trace?
			//That would be invaluable in debugging other people's problems!
			
			var className:String = (target ? getQualifiedClassName(target) : "unknown class");
			this.addParam('CLASS', className);
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