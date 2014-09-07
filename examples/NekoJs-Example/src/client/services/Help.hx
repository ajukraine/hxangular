package client.services;
import hxangular.haxe.IService;
import hxangular.ng.service.*;

class Help implements IService
{
	var _Help: hxangular.ngresource.service.Resource;

	@inject("$resource")
	public function new(resource: hxangular.ngresource.service.Resource.Factory)
	{
		_Help = resource("api/help.json");
	}

	public function get(): HelpInfo
	{
		return _Help.get();
	}
}

typedef HelpInfo =
{
	version: String,
	type: String
}