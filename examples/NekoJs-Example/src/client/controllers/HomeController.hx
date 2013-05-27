package client.controllers;
import client.services.Navigation;
import hxangular.haxe.IController;

/**
 * ...
 * @author Bohdan Makohin
 */
class HomeController implements IController
{
	@inject("$scope", "Navigation")
	public function new (scope: HomeScope, navigation: Navigation)
	{
		scope.name = "Bohdan";
		scope.menu = navigation.menuItems;
	}
}

typedef HomeScope =
{
	name: String,
	menu: Array<MenuItem>
}