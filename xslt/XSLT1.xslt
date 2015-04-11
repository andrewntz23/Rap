<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Joey Bada$$</title>
                <link href="../css/splash.css" rel="stylesheet" type="text/css"/>
                <link href="http://fonts.googleapis.com/css?family=Rock+Salt|Slabo+27px"
                    rel="stylesheet" type="text/css"/>
            </head>
            <body>

                <xsl:apply-templates select="//meta/albumTitle"/>

                <h2 id="top" class="headfont">Track List</h2>
                <ul>
                    <xsl:apply-templates select="//song" mode="toc">
                        <xsl:sort/>
                    </xsl:apply-templates>
                </ul>
                <hr/>
                <xsl:apply-templates select="//song"/>
                <xsl:apply-templates select="li"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="meta/albumTitle">
        <h1 class="headfont">
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    <xsl:template match="song" mode="toc">
        <li>
            <div class="bodyfont">
                <a href="#{generate-id(title)}">
                    <q>
                        <xsl:apply-templates select="title" mode="toc"/>
                    </q>
                    <xsl:text> ft. </xsl:text>
                </a>
            </div>
        </li>
    </xsl:template>
    <xsl:template match="song">
        <div class="box">
            <div class="bodyfont">
                <a href="#top">
                    <h3 id="{generate-id(title)}">
                        <xsl:apply-templates select="title"/>
                    </h3>
                </a>
                <div style="position:relative;width:267px;height:25px;overflow:hidden;">
                    <div style="position:absolute;top:-276px;left:-5px">
                        <iframe width="300" height="300" 
                            src="{audlink}">
                        </iframe>
                    </div>
                </div>
                <p>
                    <xsl:apply-templates select="stanza"/>
                </p>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="stanza">
        <xsl:apply-templates/>
        <br/>
        <xsl:apply-templates select="li"/>
    </xsl:template>
    <xsl:template match="li">
        <xsl:apply-templates/>
        <br/>
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
                <xsl:attribute name="data-slantrhyme" select="@slantRhyme"/>
            </xsl:if>
            <xsl:apply-templates/>
       </span>
    </xsl:template>
    <xsl:template match="AAVE">
        <span class="ling">
            <xsl:if test="@type eq 'deletion'">
                <xsl:attribute name="data-type" select="@type"/>
                <xsl:attribute name="data-field" select="@field"/>
                <xsl:attribute name="data-class" select="@class"/>
            </xsl:if>
            <xsl:if test="@type eq 'dropping'">
                <xsl:attribute name="data-type" select="@type"/>
                <xsl:attribute name="data-field" select="@field"/>
                <xsl:attribute name="data-sound" select="@sound"/>
                <xsl:attribute name="data-position" select="@position"/>
            </xsl:if>
            <xsl:if test="@type eq 'contraction'">
                <xsl:attribute name="data-type" select="@type"/>
                <xsl:attribute name="data-field" select="@field"/>
                <xsl:attribute name="data-word1" select="@word1"/>
                <xsl:attribute name="data-word2" select="@word2"/>
                <xsl:if test="@word3">
                    <xsl:attribute name="data-word3" select="@word3"/>
                </xsl:if>
            </xsl:if>
            <xsl:if test="@type eq 'negative'">
                <xsl:attribute name="data-type" select="@type"/>
                <xsl:attribute name="data-field" select="@field"/>
            </xsl:if>
            <xsl:if test="@type eq 'tense'">
                <xsl:attribute name="data-type" select="@type"/>
                <xsl:attribute name="data-field" select="@field"/>
                <xsl:attribute name="data-person" select="@person"/>
            </xsl:if>
            <xsl:if test="@type eq 'aspect'">
                <xsl:attribute name="data-type" select="@type"/>
                <xsl:attribute name="data-field" select="@field"/>
                <xsl:attribute name="data-tense" select="@tense"/>
            </xsl:if>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="compound">
        <span class="ling" data-head="{@head}" data-stem="{@stem}" data-ctype="{@type}" data-type="compound"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template
        match="oldschool|success|women|fashion|struggle|food|money|alcohol|hiphop|haters|guns|popculture|weed|sports|geo">
        <span class="motif" data-type="{name()}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
</xsl:stylesheet>
<!-- generate-id xpath function 
change the url 
change titles to child element
change markup to span with element value as class-->
