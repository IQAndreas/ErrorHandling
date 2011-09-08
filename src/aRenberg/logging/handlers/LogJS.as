package aRenberg.logging.handlers
{
	import aRenberg.logging.ILogData;
	import aRenberg.logging.ILogHandler;
	import aRenberg.logging.Log;
	
	import flash.external.ExternalInterface;

	public class LogJS implements ILogHandler
	{
		//For some reason, using 'Log.ALL' was throwing 1047 errors, so it has been replaced with the current value
		public function LogJS(filter:uint = 0xFFFFFFFF)
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