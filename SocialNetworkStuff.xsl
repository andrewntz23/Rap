<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:variable name="doc" select="/"/>
        <xsl:variable name="speakers" select="distinct-values(//stanza/@speaker)"/>
        <xsl:variable name="producer" select="distinct-values(//song/@production)"/>
        <xsl:for-each select="$speakers">
        <xsl:text>
        </xsl:text>
        <xsl:variable name="thisSpeaker" select="."/>
        <xsl:variable name="otherSpeakers" select="remove($speakers, position())"/>
        <xsl:for-each select="$otherSpeakers">
            <xsl:variable name="otherSpeaker" select="."/>
            <xsl:variable name="count"
                select="count($doc//song[.//stanza/@speaker=$thisSpeaker][.//stanza/@speaker=$otherSpeaker])"/>
            <xsl:if test="not($count=0)">
                <xsl:text>
</xsl:text>
                <xsl:value-of select="$thisSpeaker"/>
                <xsl:value-of select=" ', ', $count, ', intersection, '"/>
                <xsl:value-of select="."/>
            </xsl:if>
        </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
<!--file:///Users/BenGarfinkel/GitHub/Rap/*.xml-->
