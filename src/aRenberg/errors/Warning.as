package aRenberg.errors
{
	import aRenberg.logging.Log;

	public class Warning extends LogMessage
	{
		public static const defaultMessage:String = "Unknown warning";
		public function Warning(...message)
		{
			super(Log.GENERAL | Log.WARNING, message.length ? message.join(" ") : defaultMessage);
		}
	}
}