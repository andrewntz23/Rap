<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="barWidth" select="30"/>
    <xsl:variable name="barInterval" select="$barWidth + 20"/>
    <xsl:variable name="barHeight" select="300"/>
    <xsl:variable name="barShift" select="52"/>
    <xsl:variable name="motif"
        select="//li/descendant::*[not(self::group)][not(self::AAVE)][not(self::compound)]"/>
    <xsl:variable name="distMotif" select="distinct-values($motif/name())"/>
    <xsl:variable name="motifNum" select="count($distMotif)"/> 
    <xsl:variable name="doc" select="/"/>
    <xsl:variable name="lineWidth" select="$motifNum * $barInterval + 50"/>    
    <xsl:template match="/">
        <svg height="100%" width="100%">
            <g transform="translate(40, 350)">
                <text x="{$lineWidth div 2}" y="-{$barHeight + 20}" text-anchor="middle"><xsl:apply-templates select="//albumTitle"/></text>
                <line x1="20" x2="20" y1="0" y2="-{$barHeight + 20}" stroke="black" stroke-width="1"/>
                <line x1="20" x2="{$lineWidth}" y1="0" y2="0" stroke="black"
                    stroke-width="1"/>
                <line x1="{20}" x2="{$lineWidth}" y1="-{$barHeight div 2}"
                    y2="-{$barHeight div 2}" stroke="black" opacity="0.5" stroke-dasharray="8 4"
                    stroke-width="1"/>
                <text x="10" y="5" text-anchor="end">0%</text>
                <text x="10" y="{5 - $barHeight div 2}" text-anchor="end">50%</text>
                <text x="10" y="{5 - $barHeight}" text-anchor="end">100%</text>
                <xsl:apply-templates select="//album"/>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="album">
        <xsl:variable name="motifPos" select="position()-1"/>
        <xsl:variable name="xPosition" select="$motifPos * $barInterval"/>
        <xsl:variable name="motifCount" select="count($doc//*[name()=.])"/>
        <xsl:for-each select="$distMotif">          
            <rect x="{$xPosition + $barShift}" y="-{$motifCount * 3}" stroke="black"
                stroke-width=".5" fill="gray" width="{$barWidth}" height="{$motifCount * 3}"/>
            <text x="{$xPosition + $barWidth div 2 + $barShift}" y="20" text-anchor="middle">
                <xsl:value-of select="."/></text>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>