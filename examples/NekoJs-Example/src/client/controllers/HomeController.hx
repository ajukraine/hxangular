package client.controllers;
import client.services.Help;
import hxangular.haxe.IController;

/**
 * @author Bohdan Makohin
 */
class HomeController implements IController
{
	@inject("$scope", "Help")
	public function new (scope: HomeScope, help: Help)
	{
		scope.name = "Bohdan";
		scope.help = help.get();
	}
}

typedef HomeScope =
{
	name: String,
	help: HelpInfo
}