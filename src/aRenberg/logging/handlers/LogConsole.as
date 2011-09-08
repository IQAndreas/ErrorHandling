package aRenberg.logging.handlers
{
	import aRenberg.logging.ILogData;
	import aRenberg.logging.ILogHandler;
	import aRenberg.logging.Log;

	public class LogConsole implements ILogHandler
	{
		//For some reason, using 'Log.ALL' was throwing 1047 errors, so it has been replaced with the current value
		public function LogConsole(filter:uint = 0xFFFFFFFF)
		{
			this._filter = filter;
		}
		
		private var _filter:uint;
		public function get filter():uint
		{ return _filter; }
		
		public function onLog(log:ILogData):void
		{
			trace(log.toString());
		}
	}
}