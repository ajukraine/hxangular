package hxangular.ng.service;

extern class Http
{
	public function get<T>(url: String): Promise<T>;
}

typedef Promise<T> =
{
	function then(success: Response<T>->Void): Promise<T>;
}

typedef Response<T> =
{
	data: T
}