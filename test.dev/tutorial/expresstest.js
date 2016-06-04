/**
 * Created by ryan on 5/22/16.
 */
xslt = require('node_xslt')

var xsltFile = "productTemplate.xsl";
var xmlReadFile = "product.xml";
var xmlWriteFile = "formattedProduct.xml";

stylesheet = xslt.readXsltFile(xsltFile);
// readXsltFile
// Arguments: filename to file containing XSLT
// Returns: stylesheet object

document = xslt.readXmlFile(xmlReadFile);
// readXmlFile
// Arguments: filename to file containing XML
// Returns: document object

htmlDocument = xslt.readHtmlFile(xmlWriteFile);
// readHtmlFile
// Arguments: filename to file containing HTML
// Returns: document object

transformedString = xslt.transform(stylesheet, document, parameters);
// transform
// Arguments:
//  * stylesheet: stylesheet object
//  * document: document object
//  * parameters: an array of parameters to be passed to the stylesheet. length must be multiple of 2.
//        Example: ['param1Name', 'param1Value', 'param2Name', 'param2Value']