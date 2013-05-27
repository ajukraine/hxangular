package api;

/**
 * ...
 * @author Bohdan Makohin
 */

typedef BlogEntry =
{
	var title: String;
	var body: BlogBody;
}

typedef BlogBody =
{
	var paragraphs: Array<String>;
}