package aRenberg.logging.handlers
{
	import aRenberg.logging.ILogData;
	import aRenberg.logging.ILogHandler;
	import aRenberg.logging.Log;
	
	import flash.external.ExternalInterface;
	import flash.net.SharedObject;

	public class LogSharedObject implements ILogHandler
	{
		//For some reason, using 'Log.ALL' was throwing 1047 errors, so it has been replaced with the current value
		public function LogSharedObject(localName:String, arrayName:String = "log", saveImmediately:Boolean = true, filter:uint = 0xFFFFFFFF)
		{
			this._filter = filter;
			this._saveImmediately;
			this.reloadSharedObject(localName, arrayName, false);
		}
		
		private var _filter:uint;
		public function get filter():uint
		{ return _filter; }
		
		private var _saveImmediately:Boolean;
		public function get saveImmediately():Boolean
		{ return _saveImmediately; }
		public function set saveImmediately(value:Boolean):void
		{
			_saveImmediately = value;
			if (_saveImmediately && dataChanged) { this.saveData(); }
		}
		
		
		public function reloadSharedObject(localName:String, arrayName:String, saveOld:Boolean = false):void
		{
			//Save old
			if (data && saveOld)
			{
				this.saveData();
			}
			
			//Load new
			this.sharedObject = SharedObject.getLocal(localName);
			this.data = sharedObject.data[arrayName] || new Array();
			this.dataChanged = false;
		}
		
		private var data:Array;
		private var dataChanged:Boolean = false;
		
		private var arrayName:String;
		private var sharedObject:SharedObject;
		
		public function onLog(log:ILogData):void
		{
			data.push({timestamp:new Date(), type:log.type, message:log.message, data:log.data});
			if (_saveImmediately) { this.saveData(); }
		}
		
		public function saveData():void
		{
			sharedObject.data[arrayName] = data;
			sharedObject.flush();
			dataChanged = false;
		}
		
		
		public function clearLog():void
		{
			this.data = [];
			this.dataChanged = true;
			this.saveData();
		}
	}
}