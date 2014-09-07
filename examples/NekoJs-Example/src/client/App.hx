package client;

import client.controllers.*;
import client.services.*;

import hxangular.haxe.IController;
import hxangular.Angular;
import hxangular.ng.RouteProvider;

import js.Lib;

/**
 * @author Bohdan Makohin
 */
class App
{
	public static function main()
	{
		Angular
			.module("WebNekoJs", ["ngRoute", "ngResource", "angular-data.DSCacheFactory"])
			.config(["$routeProvider", "$provide", configure])
			.constant("remotingUrl", "http://localhost:2000/app.n")
			.controller("NavigationController", NavigationController)
			.service("Blog", Blog)
			.service("Help", Help)
			.run(["$http", "DSCacheFactory", run]);
	}

	static function run(http: Dynamic, DSCacheFactory: Dynamic)
	{
		DSCacheFactory('defaultCache', {
			maxAge: 900000, // Items added to this cache expire after 15 minutes.
			cacheFlushInterval: 6000000, // This cache will clear itself every hour.
			deleteOnExpire: 'aggressive', // Items will be deleted from this cache right when they expire.
			storageMode: 'localStorage'
		});

		DSCacheFactory('templates', {
			maxAge: 900000, // Items added to this cache expire after 15 minutes.
			cacheFlushInterval: 6000000, // This cache will clear itself every hour.
			deleteOnExpire: 'aggressive', // Items will be deleted from this cache right when they expire.
			storageMode: 'localStorage'
		});

		http.defaults.cache = DSCacheFactory.get('defaultCache');
	}
	
	static function configure(routeProvider: RouteProvider, provide: Dynamic)
	{
		provide.factory("$templateCache", function (DSCacheFactory: Dynamic) {
			return DSCacheFactory.get("templates");
		});

		routeProvider
			.when("/home", { templateUrl: "partial/home.html", controller: HomeController, data:
				{title: "Home", nav: true} })
			.when("/blog", { templateUrl: "partial/blog.html", controller: BlogController, data:
				{title: "Blog", nav: true} })
			.when("/users", {templateUrl: "partial/users.html", controller: UsersController, data:
				{title: "Users", nav: true} })
			.otherwise({ redirectTo: "/home" });
	}
}