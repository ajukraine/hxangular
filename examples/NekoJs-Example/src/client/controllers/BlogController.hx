package client.controllers;

import client.services.Blog;
import api.BlogModel;
import hxangular.haxe.IController;

using hxangular.haxe.Scope;

/**
 * ...
 * @author Bohdan Makohin
 */
class BlogController implements IController
{
	@inject("$scope", "Blog")
	public function new(scope: BlogScope, blog: Blog) 
	{
		blog.getBlogEntries(function (entries)
		{
			scope.entries = entries;
			scope.digest();
		});
	}
}

typedef BlogScope = {> Scope,
	entries: Array<BlogEntry>
}