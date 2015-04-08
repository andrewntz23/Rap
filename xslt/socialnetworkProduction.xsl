<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    <xsl:output method = "text"/>
    <xsl:template match="/">
        <!--   tokenize(//song[@title='RighteousMinds']//stanza[@type="interlude"]/@speaker, '\s+') works to tokenize      -->
        <xsl:variable name="doc" select="/"/>
        <xsl:for-each select="//song">
            <xsl:value-of select="'Joey Bada$$'"/>
            <xsl:value-of select="', productionCredit, '"/>
            <xsl:value-of select="./@production"/>
            <xsl:value-of select="'&#10;'"/>
            
        </xsl:for-each>
         
            
    </xsl:template>
</xsl:stylesheet>

<!--We want to color them differently, filter to have a few different graph types-->