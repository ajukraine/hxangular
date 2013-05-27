package client.services;


import haxe.remoting.AsyncProxy;
import haxe.remoting.HttpAsyncConnection;

import hxangular.haxe.IService;

/**
 * @author Bohdan Makohin
 */

class Blog extends AsyncProxy<api.IBlogService> implements IService
{
	@inject("remotingUrl")
	public function new(url: String) 
	{
		var connection = HttpAsyncConnection.urlConnect(url);
		connection.setErrorHandler(errorHandler);
		
		super(connection.resolve("BlogService"));
	}
	
	function errorHandler(error: Dynamic)
	{
		js.Lib.alert(error);
	}
}