<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:variable name="motifs"
            select="distinct-values(//li/descendant::*[not(self::group)][not(self::AAVE)]/name())"/>
        <xsl:variable name="doc" select="/"/>
        <xsl:for-each select="$motifs">
            <xsl:apply-templates select="document(@Rejex, @SummerKnights)"/>
            <xsl:variable name="thisElement" select="."/>
            <xsl:variable name="otherMotifs" select="remove($motifs, position())"/>
            <xsl:for-each select="$otherMotifs">
                <xsl:variable name="thisOtherElement" select="."/>,
                <xsl:value-of select="$thisElement"/>,
                <xsl:value-of select="count($doc//song[.//name()=$thisElement][.//name()=$thisOtherElement])"/>,
                <xsl:value-of select="$thisOtherElement"/>
                <xsl:text>
</xsl:text>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
