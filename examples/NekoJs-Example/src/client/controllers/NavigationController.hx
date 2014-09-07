package client.controllers;

import hxangular.haxe.IController;

class NavigationController implements IController
{
	@inject("$scope", "$route")
	public function new(scope: Scope, router: Dynamic)
	{
		scope.menu = [];

		for (path in Reflect.fields(router.routes)) {
			var route = Reflect.field(router.routes, path);

			if (route.data != null && route.data.nav)
				scope.menu.push({ title: route.data.title, path: path});
		}
	}
}

typedef Scope =
{
	menu: Array<MenuItem>
}

typedef MenuItem =
{
	title: String,
	path: String
}