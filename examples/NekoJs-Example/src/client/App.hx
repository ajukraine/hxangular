package client;

import client.controllers.*;
import client.services.*;

import hxangular.haxe.IController;
import hxangular.Angular;
import hxangular.ng.RouteProvider;

import js.Lib;

/**
 * ...
 * @author Bohdan Makohin
 */
class App
{
	public static function main()
	{
		var app: Module = Angular.module("WebNekoJs", []);
		
		app
			.config(["$routeProvider", configure])
			.constant("remotingUrl", "http://localhost:2000/app.n")
			.service("Navigation", Navigation)
			.service("Blog", Blog);
	}
	
	static function configure(routeProvider: RouteProvider)
	{
		routeProvider
			.when("/home", { templateUrl: "partial/home.html", controller: HomeController })
			.when("/blog", { templateUrl: "partial/blog.html", controller: BlogController } )
			.otherwise({ redirectTo: "/home" });
	}
}