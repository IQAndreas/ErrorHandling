package aRenberg.logging
{
	public class LogData implements ILogData
	{
		public function LogData(type:uint, message:String, _data:* = null)
		{
			this._type = type;
			this._message = message;
			this._data = data;
		}
		
		protected var _type:uint;
		public function get type():uint
		{ return _type; }
		
		protected var _message:String;
		public function get message():String
		{ return _message; }
		
		protected var _data:*;
		public function get data():*
		{ return _data; }
		
		public function toString():String
		{ return this.message; }
	}
}