package client.services;
import hxangular.haxe.IService;

/**
 * ...
 * @author Bohdan Makohin
 */
class Navigation implements IService
{
	public var menuItems (default, null): Array<MenuItem>;
	
	public function new()
	{
		menuItems = [
			{ title: "Blog", path: "blog" },
			{ title: "Home", path: "home" }
		];
	}
}

typedef MenuItem =
{
	title: String,
	path: String
}