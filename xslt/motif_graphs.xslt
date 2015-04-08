<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="barWidth" select="30"/>
    <xsl:variable name="barInterval" select="$barWidth + 20"/>
    <xsl:variable name="barHeight" select="300"/>
    <xsl:variable name="barShift" select="$barInterval + 2"/>
    <xsl:variable name="motif"
        select="//li/descendant::*[not(self::group)][not(self::AAVE)][not(self::compound)]"/>
    <xsl:variable name="distMotif" select="distinct-values($motif/name())"/>
    <xsl:variable name="motifNum" select="count($distMotif)"/>
    <xsl:variable name="doc" select="/"/>
    <xsl:variable name="lineWidth" select="$motifNum * $barInterval + 50"/>
    <xsl:template match="/">
        <svg height="100%" width="100%">
            <g transform="translate(40, 350)">
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
                <text x="10" y="5" text-anchor="end">0</text>
                <text x="10" y="{5 - $barHeight * .1}" text-anchor="end">10</text>
                <text x="10" y="{5 - $barHeight * .2}" text-anchor="end">20</text>
                <text x="10" y="{5 - $barHeight * .3}" text-anchor="end">30</text>
                <text x="10" y="{5 - $barHeight * .4}" text-anchor="end">40</text>
                <text x="10" y="{5 - $barHeight * .5}" text-anchor="end">50</text>
                <text x="10" y="{5 - $barHeight * .6}" text-anchor="end">60</text>
                <text x="10" y="{5 - $barHeight * .7}" text-anchor="end">70</text>
                <text x="10" y="{5 - $barHeight * .8}" text-anchor="end">80</text>
                <text x="10" y="{5 - $barHeight * .9}" text-anchor="end">90</text>
                <text x="10" y="{5 - $barHeight}" text-anchor="end">100</text>
                <xsl:apply-templates select="//album"/>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="album">
        <xsl:for-each select="$distMotif">
            <xsl:variable name="motifPos" select="position()-1"/>
            <xsl:variable name="xPosition" select="$motifPos * $barInterval"/>
            <xsl:variable name="currentMotif" select="."/>
            <xsl:variable name="motifCount" select="count($doc//*[name()=$currentMotif])"/>
            <rect x="{$xPosition + $barShift}" y="-{$motifCount * 3}" stroke="black"
                stroke-width=".5" fill="gray" width="{$barWidth}" height="{$motifCount * 3}"/>
            <text x="{$xPosition + $barWidth div 2 + $barShift}" y="20" text-anchor="middle" font-size="12px">
                <xsl:value-of select="."/>
            </text>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
