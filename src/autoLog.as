package
{
	import aRenberg.logging.Log;
	import aRenberg.logging.LogData;
	
	/** Will automatically send the string to the correct and currently applied logger */
	public function autoLog(...args:*) : void 
	{
		Log.log(new LogData(Log.LOG, args.join(" ")));
	}
}