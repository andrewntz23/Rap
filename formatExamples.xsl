<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <root>
            <xsl:apply-templates select="//li//*[./name()!='AAVE'][./name()!='group'][./name()!='compound']" />
        </root>
    </xsl:template>
    <xsl:template
        match="oldschool|success|women|fashion|struggle|food|money|alcohol|hiphop|haters|guns|popculture|weed|sports|geo">
        <p class="example">
            <xsl:text>&gt;</xsl:text>
            <xsl:value-of select="name()"/>
            <xsl:text>&lt;</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>&gt;/</xsl:text>
            <xsl:value-of select="name()"/>
            <xsl:text>&lt;</xsl:text>
        </p>
    </xsl:template>
</xsl:stylesheet>