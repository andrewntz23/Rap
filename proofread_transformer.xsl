<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    <xsl:output method="xhtml"/>
    <xsl:template match="/">
        <head>
<!--     All of the stuff here      -->
        </head>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="song">
        <div class="song"><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="stanza">
        <div class="stanza"><xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="li">
        <xsl:apply-templates/><br/>
    </xsl:template>
    <xsl:template match="group">
        <span class="poetics">
            <xsl:if test="@alliteration">
                <xsl:attribute name="data-alliteration" select="@alliteration"/>
            </xsl:if>
            <xsl:if test="@assonance">
                <xsl:attribute name="data-assonance" select="@assonance"/>
            </xsl:if>
            <xsl:if test="@assimilation">
                <xsl:attribute name="data-assimilation" select="@assimilation"/>
            </xsl:if>    
            <xsl:if test="@consonance">
                <xsl:attribute name="data-consonance" select="@consonance"/>
            </xsl:if>
            <xsl:if test="@repetition">
                <xsl:attribute name="data-repetition" select="@repetition"/>
            </xsl:if>
            <xsl:if test="@rhyme">
                <xsl:attribute name="data-rhyme" select="@rhyme"/>
            </xsl:if>
            <xsl:if test="@slantRhyme">
                <xsl:attribute name="data-slantRhyme" select="@slantRhyme"/>
            </xsl:if>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
</xsl:stylesheet>