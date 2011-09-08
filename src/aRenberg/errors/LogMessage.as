package aRenberg.errors
{
	import aRenberg.logging.Log;
	import aRenberg.logging.LogData;
	
	public class LogMessage extends LogData
	{
		public function LogMessage(defaultType:uint, ... message )
		{
			super(defaultType, message.length ? message.join(" ") : "Unknown problem", undefined);
			
			this.addParam('TIME', new Date().toString());
		}
		
		
		public function setData(data:*):LogMessage
		{
			_data = data;
			return this;
		}
		
		public override function get data():*
		{ 
			//It may be better to include as much information as possible than nothing
			return super.data || params;
		}
		
		//Never case sensitive
		private var params:Object = {};
		protected function addParam(name:String, value:*):void
		{
			params[name.toLocaleLowerCase()] = value;
		}
		
		
		public override function get message():String
		{
			return this.parseMessage(super.message);
		}
		
		protected function parseMessage(message:String):String
		{
			//Search through and find all possible parameters
			message = message.replace(/{{([^}]*)}}/g, paramFound);
			
			return message;
		}
		
		private function paramFound(fullMatch:String, paramName:String, paramIndex:int, fullString:String):String
		{
			var name:String = paramName.toLocaleLowerCase();
			if (params.hasOwnProperty(name))
			{
				//Property may not be a String, so always convert it to one
				return String(params[name]);
			}
			else
			{
				//return the string unaltered if not found
				return fullMatch;
			}
		}
		
		public function log(type:uint = 0):LogMessage
		{
			if (type) { this._type = type; }
			Log.log(this);
			return this;
		}
	}
}