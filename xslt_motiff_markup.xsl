<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:variable name="motifs" select="distinct-values(//li/descendant::*[not(self::group)][not(self::AAVE)]/name())"/>
        <xsl:variable name="pos" select="position()" />
        <xsl:variable name="doc" select="/"/>
        <xsl:for-each select="$motifs">
            <xsl:value-of select="."/>
            <xsl:text>
    
</xsl:text>
            <xsl:variable name="oldschool" select="."/>
            <xsl:variable name="motifs" select="remove($motifs, position())"/>
            <xsl:value-of select="$oldschool"/>
            <xsl:for-each select="$motifs">
                <xsl:variable name="oldschool" select="."/>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>