#include "lib/Environment.jsxinc";
#include "lib/Extractor.jsxinc";
#include "lib/Parser.jsxinc";
#include "lib/ImageExporter.jsxinc";
#include "lib/JsonFileWriter.jsxinc";
#include "lib/XmlFileWriter.jsxinc";

app.preferences.rulerUnits = Units.PIXELS;
app.preferences.typeUnits = TypeUnits.PIXELS;

function main()
{
	var t = new Date().getTime();
	var env = new Environment(app.activeDocument);
	var extractData = new Extractor(app.activeDocument).extract();
	var jsonFileWriter = new JsonFileWriter(env);
	// jsonFileWriter.writeExtractResult(extractData);

	var parser = new Parser(env);
	parser.loadSharedAssetXml();
	var parseData = parser.parse(extractData);
	jsonFileWriter.writeParseResult(parseData);
	var xmlFileWriter = new XmlFileWriter(env);
	xmlFileWriter.writeAssetXml(parser.assetMap);
	var imageExporter = new ImageExporter(env);
	imageExporter.export(extractData);
	alert("DONE! cost time " + (new Date().getTime() - t) * 0.001 + " seconds.");
}

main();