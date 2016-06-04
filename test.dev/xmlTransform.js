/**
 * Created by ryan on 5/22/16.
 */

var xslt4node = require('xslt4node');

var config = {
    xsltPath: 'templates/productTemplate.xsl',
    sourcePath: 'incoming/product' +
    '.xml',
    result: 'output/formattedOrder.xml',
    props: {
        indent: 'yes'
    }
};

xslt4node.transform(config, function (err) {
    if (err) {
        console.log(err);
    }
});