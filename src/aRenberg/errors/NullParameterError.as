package aRenberg.errors
{
	public class NullParameterError extends TargetedError
	{
		
		public static const defaultMessage:String = "{{CLASS}}: Cannot pass null object for {{PARAMETER}} in function {{FUNCTION}}.";
		
		public function NullParameterError(target:*, functionName:String = null, parameterName:String = null, ... message)
		{
			_functionName = functionName || "[unknown function]";
			_parameterName = parameterName || "[unknown parameter]";
			
			super(target, message.length ? message.join(" ") : defaultMessage );
			
			this.addParam("FUNCTION", this.functionName);
			this.addParam("PARAMETER", this.parameterName);
		}
		
		
		private var _functionName:String;
		public function get functionName():String
		{ return _functionName; }
		
		private var _parameterName:String;
		public function get parameterName():String
		{ return _parameterName; }
		
	}
}