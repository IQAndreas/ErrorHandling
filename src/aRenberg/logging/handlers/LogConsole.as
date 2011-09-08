package aRenberg.logging.handlers
{
	import aRenberg.logging.ILogData;
	import aRenberg.logging.ILogHandler;
	import aRenberg.logging.Log;

	public class LogConsole implements ILogHandler
	{
		public function LogConsole(filter:uint = Log.ALL)
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