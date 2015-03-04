<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Joey Bada$$</title>
                <link href="splash.css" rel="stylesheet" type="text/css"/>
                <link href="http://fonts.googleapis.com/css?family=Rock+Salt|Slabo+27px" rel="stylesheet"
                    type="text/css" />
            </head>
            <body>
                <h1 class="headfont">Summer Knights</h1>
                <h2 id="top" class="headfont">Track List</h2>
                <ul>
                    <xsl:apply-templates select="//song" mode="toc">
                        <xsl:sort/>
                    </xsl:apply-templates>
                </ul>
                <hr/>
                <xsl:apply-templates select="//song"/>
                
            </body>
        </html>
    </xsl:template>
    <xsl:template match="song" mode="toc">
        <li>
            <div class="bodyfont">
                <a href="#song{@title}">
                    <q>
                        <xsl:apply-templates select="@title" mode="toc"/>
                    </q>
                    <xsl:text> ft. </xsl:text>
                    
                </a>
                
            </div>
        </li>
    </xsl:template>
    <xsl:template match="song">
<div class="box">        <div class="bodyfont">
            <a href="#top"><h3 id="song{@title}">
                <xsl:apply-templates select="@title"/>
            </h3></a>
            <p>
                <xsl:apply-templates select="stanza"/>
            </p>
            
        </div></div>
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
</xsl:stylesheet>
