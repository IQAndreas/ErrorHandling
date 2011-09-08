package aRenberg.logging.handlers
{
	import aRenberg.logging.ILogData;
	import aRenberg.logging.ILogHandler;
	import aRenberg.logging.Log;
	
	import flash.external.ExternalInterface;

	public class LogJS implements ILogHandler
	{
		public function LogJS(filter:uint = Log.ALL)
		{
			this._filter = filter;
		}
		
		private var _filter:uint;
		public function get filter():uint
		{ return _filter; }
		
		public function onLog(log:ILogData):void
		{
			if (ExternalInterface.available)
			{
				ExternalInterface.call(log.toString());
			}
		}
	}
}