<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="barWidth" select="30"/>
    <xsl:variable name="barInterval" select="$barWidth + 17"/>
    <xsl:variable name="barHeight" select="400"/>
    <xsl:variable name="barShift" select="$barInterval + 1"/>
    <xsl:variable name="ling"
        select="//li/language|//li/compound"/>
    <xsl:variable name="distLing" select="distinct-values($ling/name())"/>
    <xsl:variable name="distAAVE" select="distinct-values(//li/AAVE/@type)"/>
    <xsl:variable name="lingNum" select="count($distAAVE)+ count($distLing)"/>
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
                <text x="10" y="0" text-anchor="end">0</text>
                <text x="10" y="{5-20}" text-anchor="end">10</text>
                <text x="10" y="{5-40}" text-anchor="end">20</text>
                <text x="10" y="{5-60}" text-anchor="end">30</text>
                <text x="10" y="{5-80}" text-anchor="end">40</text>
                <text x="10" y="{5-100}" text-anchor="end">50</text>
                <text x="10" y="{5-120}" text-anchor="end">60</text>
                <text x="10" y="{5-140}" text-anchor="end">70</text>
                <text x="10" y="{5-160}" text-anchor="end">80</text>
                <text x="10" y="{5-180}" text-anchor="end">90</text>
                <text x="10" y="{5-200}" text-anchor="end">100</text>
                <text x="10" y="{5-220}" text-anchor="end">110</text>
                <text x="10" y="{5-240}" text-anchor="end">120</text>
                <text x="10" y="{5-260}" text-anchor="end">130</text>
                <text x="10" y="{5-280}" text-anchor="end">140</text>
                <text x="10" y="{5-300}" text-anchor="end">150</text>
                <text x="10" y="{5-320}" text-anchor="end">160</text>
                <text x="10" y="{5-340}" text-anchor="end">170</text>
                <text x="10" y="{5-360}" text-anchor="end">180</text>
                <text x="10" y="{5-380}" text-anchor="end">190</text>
                <text x="10" y="{5 - $barHeight}" text-anchor="end">200</text>
                <xsl:apply-templates select="//album"/>
            </g>
        </svg>
    </xsl:template>
    <xsl:template match="album">
        <xsl:for-each select="$distAAVE">
            <xsl:sort select="."/>
            <xsl:variable name="AAVEPos" select="position()-1"/>
            <xsl:variable name="xPos" select="$AAVEPos * $barInterval"/>
            <xsl:variable name="currentAAVE" select="."/>
            <xsl:variable name="AAVECount" select="count($doc//*[@type=$currentAAVE])"/>
            <rect x="{$xPos + $barShift}" y="-{$AAVECount * 2}" stroke="black"
                stroke-width=".5" fill="gray" width="{$barWidth}" height="{$AAVECount * 2}"/>
            <text x="{$xPos + $barWidth div 2 + $barShift}" y="20" text-anchor="middle" font-size="11px">
                <xsl:value-of select="."/>
            </text>
        </xsl:for-each>
        <xsl:for-each select="$distLing">
            <xsl:sort select="."/>
            <xsl:variable name="lingPos" select="position()-1"/>
            <xsl:variable name="xPosition" select="$lingPos * $barInterval + 283"/>
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