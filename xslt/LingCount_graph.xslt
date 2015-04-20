<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="barWidth" select="30"/>
    <xsl:variable name="barInterval" select="$barWidth + 17"/>
    <xsl:variable name="barHeight" select="400"/>
    <xsl:variable name="barShift" select="$barInterval + 1"/>
    
    <xsl:variable name="ling"
        select="//li/language|//li/compound|AAVE/@type"/>
    <xsl:variable name="distLing" select="distinct-values($ling/name())"/>
    <xsl:variable name="lingNum" select="count($distLing)"/>
    <xsl:variable name="doc" select="/"/>
    <xsl:variable name="lineWidth" select="$lingNum * $barInterval + 50"/>
    <xsl:template match="/">
        <svg height="100%" width="100%">
            <g transform="translate(40, 450)">
                <text x="{$lineWidth div 2}" y="-{$barHeight + 20}" text-anchor="middle" font-size="20px">
                    <xsl:apply-templates select="//albumTitle"/>
                </text>
                <line x1="20" x2="20" y1="0" y2="-{$barHeight + 20}" stroke="black" stroke-width="1"/>
                <line x1="20" x2="{$lineWidth}" y1="0" y2="0" stroke="black" stroke-width="1"/>
                <line x1="{20}" x2="{$lineWidth}" y1="-{$barHeight * .25}" y2="-{$barHeight * .25}"
                    stroke="black" opacity="0.5" stroke-dasharray="8 4" stroke-width="1"/>
                <line x1="{20}" x2="{$lineWidth}" y1="-{$barHeight * .5}" y2="-{$barHeight * .5}"
                    stroke="black" opacity="0.5" stroke-dasharray="8 4" stroke-width="1"/>
                <line x1="{20}" x2="{$lineWidth}" y1="-{$barHeight * .75}" y2="-{$barHeight * .75}"
                    stroke="black" opacity="0.5" stroke-dasharray="8 4" stroke-width="1"/>
                <line x1="{20}" x2="{$lineWidth}" y1="-{$barHeight}" y2="-{$barHeight}"
                    stroke="black" opacity="0.5" stroke-dasharray="8 4" stroke-width="1"/>
                <xsl:apply-templates select="//album"/>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="album">
        <xsl:for-each select="distinct-values(//li/AAVE/@type)">
            <xsl:sort select="."/>
            <xsl:variable name="lingPos" select="position()-1"/>
            <xsl:variable name="xPosition" select="$lingPos * $barInterval"/>
            <xsl:variable name="currentLing" select="."/>
            <xsl:variable name="lingCount" select="count($doc//*[name()=$currentLing])"/>
            <rect x="{$xPosition + $barShift}" y="-{$lingCount * 2}" stroke="black"
                stroke-width=".5" fill="gray" width="{$barWidth}" height="{$lingCount * 2}"/>
            <text x="{$xPosition + $barWidth div 2 + $barShift}" y="20" text-anchor="middle" font-size="11px">
                <xsl:value-of select="."/>
            </text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>