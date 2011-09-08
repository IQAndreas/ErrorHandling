package aRenberg.logging
{
	public interface ILogData
	{
		function get type():uint;
		function get message():String;
		function get data():*;
		
		function toString():String;
	}
}