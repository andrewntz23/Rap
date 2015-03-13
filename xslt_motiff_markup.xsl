<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <html>
            <head>
                <h1>1999 Motif Count</h1>
            </head>
            <body>
                    <xsl:for-each select="//song">
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="@title"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//oldschool)"/>
                                <xsl:value-of select="success"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//success)"/>
                                <xsl:value-of select="women"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//women)"/>
                                <xsl:value-of select="fashion"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//fashion)"/>
                                <xsl:value-of select="struggle"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//struggle)"/>
                                <xsl:value-of select="food"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//food)"/>
                                <xsl:value-of select="money"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//money)"/>
                                <xsl:value-of select="alcohol"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//alcohol)"/>
                                <xsl:value-of select="hiphop"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//hiphop)"/>
                                <xsl:value-of select="haters"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//haters)"/>
                                <xsl:value-of select="guns"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//guns)"/>
                                <xsl:value-of select="popculture"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//popculture)"/>
                                <xsl:value-of select="weed"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//weed)"/>
                                <xsl:value-of select="sports"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//sports)"/>
                                <xsl:value-of select="geo"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//geo)"/>
                    </xsl:for-each>
                
            </body>
        </html>
        </xsl:template>
</xsl:stylesheet>
