package aRenberg.logging
{
	import aRenberg.errors.ProtectedConstructorError;

	public class Log
	{
		
		//Somewhat borrowed from PHP
		
		public static const ERROR:uint = 	0x01; // Fatal run-time errors. These indicate errors that can not be recovered from, such as a memory allocation problem. Execution of the script is halted.	
		public static const WARNING:uint = 	0x02; // Run-time warnings (non-fatal errors). Execution of the script is not halted.
		public static const NOTICE:uint =	0x04; // Run-time notices. Indicate that the script encountered something that could indicate an error, but could also happen in the normal course of running a script.
		public static const LOG:uint =		0x08; // Save to external log for use later
		
		//Categories
		public static const GENERAL:uint =			0x00
		public static const STATISTICAL:uint= 		0x10; // Used for gathering stats, not bad at all.
		public static const USER_ERROR:uint = 		0x20; // The user gave any sort of wrong information.
		public static const NETWORK_ERROR:uint =	0x40; // Server not found, internet connection problem etc
		public static const PARSE_ERROR:uint = 		0x80; // For parsing any sort of XML or other data input. Data may come from server?
		public static const INTERNAL_ERROR:uint = 	0xF0; 
		
		public static const ALL:uint = 0xFFFFFFFF; //ALL information is logged
		
		
		private static var logHandlers:Vector.<ILogHandler> = new Vector.<ILogHandler>();
		public static function registerHandler(handler:ILogHandler):void
		{
			if (handler) { logHandlers.push(handler); }
			else { /*throw error*/ }
		}
		
		public static function log(logData:ILogData):void
		{
			//Saves repeatedly accessing the getter
			var type:uint = logData.type;
			for each( var handler:ILogHandler in logHandlers )
			{
				//If the filter and log type have anything in common
				if (handler.filter & type)
					{ handler.onLog(logData); }
			}
		}
		
		
		//Do not instantiate
		public function Log() { new ProtectedConstructorError(this); }
	}
}