package aRenberg.errors
{
	public class SingletonError extends TargetedError
	{
		
		public static const defaultMessage:String = "Cannot create more than one Singleton instance of {{CLASS}}.";
		
		public function SingletonError(target:*, ... message)
		{
			super(target, message.length ? message.join(" ") : defaultMessage);
		}
		
	}
}