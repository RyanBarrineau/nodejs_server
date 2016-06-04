<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <xsl:for-each select="catalog/book">
            <Product>
                <author>
                    <xsl:value-of select="author"/>
                </author>
                <title>
                    <xsl:value-of select="title"/>
                </title>
            </Product>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>