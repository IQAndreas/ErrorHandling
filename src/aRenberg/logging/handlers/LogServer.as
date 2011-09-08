package aRenberg.logging.handlers
{
	import aRenberg.logging.ILogData;
	import aRenberg.logging.ILogHandler;
	import aRenberg.logging.Log;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	public class LogServer implements ILogHandler
	{
		//For some reason, using 'Log.ALL' was throwing 1047 errors, so it has been replaced with the current value
		public function LogServer(serverURL:String, filter:uint = 0xFFFFFFFF)
		{
			_filter = filter;
			_serverURL = serverURL;
		}
		
		public function onLog(log:ILogData):void
		{
			//I really should add error handling...
			var request:URLRequest = new URLRequest(_serverURL);
			request.method = URLRequestMethod.POST;
			request.data = this.getURLVariables(log);
			
			var loader:URLLoader = new URLLoader();
			//Ignore response as well as errors for now?
			//loader.addEventListener(Event.COMPLETE, onComplete);
			loader.load(request);
		}
		
		protected function getURLVariables(log:ILogData):URLVariables
		{
			//Override me PLZ if you plan on including more advanced variables
			var vars:URLVariables = new URLVariables();
			vars.message = log.message;
			vars.data = log.data;
			vars.type = log.type;
			
			return vars;
		}
		
		
		private var _serverURL:String;
		public function get serverURL():String
		{ return _serverURL; }
		public function set serverURL(value:String):void
		{
			//Notify or change anything because of a changed value?
			_serverURL = value;
		}
		
		private var _filter:uint;
		public function get filter():uint
		{ return _filter; }
		
	}
}