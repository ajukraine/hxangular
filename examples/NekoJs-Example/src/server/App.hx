package server;

import haxe.remoting.Context;
import haxe.remoting.HttpConnection;

/**
 * @author Bohdan Makohin
 */
class App
{
	public static function main()
	{
		var context = new Context();
		context.addObject("BlogService", new BlogService());
		
		if (HttpConnection.handleRequest(context))
			return;
			
		neko.Lib.print("Haxe remoting: Unrecognized request");
	}
}