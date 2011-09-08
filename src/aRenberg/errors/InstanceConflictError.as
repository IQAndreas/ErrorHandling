package aRenberg.errors
{
	public class InstanceConflictError extends TargetedError
	{
		
		public static const defaultMessage:String = "{{CLASS}}: Instance for the specified key already constructed!";
		
		public function InstanceConflictError(target:*, message:*="", key:* = null, instance:* = null)
		{
			message ||= defaultMessage;
			
			_key = key;
			_instance = instance;
			
			super(target, message);
		}
		
		private var _key:*;
		public function get key():*
		{ return _key; }
		
		private var _instance:*;
		public function get instance():*
		{ return _instance; }
		
	}
}