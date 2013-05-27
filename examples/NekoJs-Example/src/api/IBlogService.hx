package api;

import api.BlogModel;
/**
 * ...
 * @author Bohdan Makohin
 */

interface IBlogService
{
	function getBlogEntries(): Array<BlogEntry>;
}