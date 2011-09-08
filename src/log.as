package
{
	import flash.external.ExternalInterface;

	/** Will send the text to trace and JavaScript console (if available)
	 * 		Only to be used for debugging. Not to be used for final release! */
	public function log(...args:*) : void 
	{
		//Nothing to log
		if (args.length <= 0) { return; }
		
		for (var i:uint = 0; i < args.length; i++)
		{
			if (ExternalInterface.available)
				{ ExternalInterface.call("console.log", args[i]); }
		}
		
		//Join strings instead?
		trace(args.join(" "));
	}
}