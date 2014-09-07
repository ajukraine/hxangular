package hxangular.ngresource.service;

extern class Resource
{
	public function query(): Dynamic;
	public function get(): Dynamic;
}

typedef Factory = Dynamic->Resource;