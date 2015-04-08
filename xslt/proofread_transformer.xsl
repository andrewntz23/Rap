<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Joey Bada$$</title>
                <link rel="stylesheet" type="text/css" href="proofread.css"/>
                <script type="text/javascript" src="proofread.js">//</script>
            </head>
            <body>
                
                <xsl:apply-templates select="//meta/albumTitle"/>
                
                <hr/>
                
                <xsl:apply-templates select="//song"/>
                <xsl:apply-templates select="li"/>
                <form action="" id="radios">
                    <label for="all" onclick="clearAllColor()"><input type="radio" name="device" value="all"
                        id="all" checked="checked" onclick="clearAllColor()" />all</label>
                    <label for="alliteration" onclick="clearAllColor()"><input type="radio" name="device"
                        value="alliteration" id="alliteration" onclick="clearAllColor()"
                    />alliteration</label>
                    <label for="assimilation" onclick="clearAllColor()"><input type="radio" name="device"
                        value="assimilation" id="assimilation" onclick="clearAllColor()"
                    />assimilation</label>
                    <label for="assonance" onclick="clearAllColor()"><input type="radio" name="device"
                        value="assonance" id="assonance" onclick="clearAllColor()" />assonance</label>
                    <label for="consonance" onclick="clearAllColor()"><input type="radio" name="device"
                        value="consonance" id="consonance" onclick="clearAllColor()"
                    />consonance</label>
                    <label for="repetition" onclick="clearAllColor()"><input type="radio" name="device"
                        value="repetition" id="repetition" onclick="clearAllColor()"
                    />repetition</label>
                    <label for="rhyme" onclick="clearAllColor()"><input type="radio" name="device"
                        value="rhyme" id="rhyme" onclick="clearAllColor()" /> rhyme</label>
                    <label for="slantRhyme" onclick="clearAllColor()"><input type="radio" name="device"
                        value="slantRhyme" id="slantRhyme" onclick="clearAllColor()" /> slant rhyme</label>
                </form>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="meta/albumTitle">
        <h1 class="headfont">
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    <xsl:template match="song">
        <h2><xsl:value-of select="@title"/></h2>
        <div class="song">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="stanza">
        <div class="stanza">
            <xsl:apply-templates/>
        </div>
        <br/>
    </xsl:template>
    <xsl:template match="li">
        <xsl:apply-templates/>
        <br/>
        <br/>
    </xsl:template>
    <xsl:template match="group">
        <div class="spanWrapper"><span>
            <xsl:attribute name="data-all" select="0"/>
            <xsl:attribute name="title" select="@label"/>
            <xsl:attribute name="data-num" select="@num"/>
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
        </span></div>
    </xsl:template>

</xsl:stylesheet>
<!-- generate-id xpath function 
change the url 
change titles to child element
change markup to span with element value as class-->
