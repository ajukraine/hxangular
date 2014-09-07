package client.controllers;

import hxangular.haxe.IController;
import hxangular.ngresource.service.Resource;

class UsersController implements IController
{
	@inject("$scope", "$resource")
	public function new(scope: Dynamic, resource: Dynamic->Resource)
	{
		var User = resource("api/users.json");

		scope.users = User.query();
	}
}