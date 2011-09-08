package aRenberg.errors
{
	public class ProtectedConstructorError extends TargetedError
	{
		
		public static const defaultMessage:String = "The {{CLASS}} class cannot be instantiated directly.";
		
		public function ProtectedConstructorError(target:*, ... message)
		{
			super(target, message.length ? message.join(" ") : defaultMessage);
		}
	}
}