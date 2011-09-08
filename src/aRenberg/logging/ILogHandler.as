package aRenberg.logging
{
	public interface ILogHandler
	{
		function get filter():uint;
		function onLog(log:ILogData):void;
	}
}