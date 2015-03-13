<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>1999 Motif Count</title>
            </head>
            <body>
                <xsl:for-each select="//song">
                    <th>
                        <xsl:value-of select="oldschool"/>
                        <xsl:text>&#x9;</xsl:text>
                        <xsl:value-of select="count(//oldschool)"/>
                    </th>
                </xsl:for-each>
                    <xsl:for-each select="//song">
                        <th>
                            <xsl:value-of select="success"/>
                            <xsl:text>&#x9;</xsl:text>
                            <xsl:value-of select="count(//success)"/>
                        </th>
                </xsl:for-each>
                <xsl:for-each select="//song">
                    <th>
                        <xsl:value-of select="women"/>
                        <xsl:text>&#x9;</xsl:text>
                        <xsl:value-of select="count(//women)"/>
                    </th>
                </xsl:for-each>
                <xsl:for-each select="//song">
                    <th>
                        <xsl:value-of select="fashion"/>
                        <xsl:text>&#x9;</xsl:text>
                        <xsl:value-of select="count(//fashion)"/>
                    </th>
                </xsl:for-each>
                <xsl:for-each select="//song">
                    <th>
                        <xsl:value-of select="struggle"/>
                        <xsl:text>&#x9;</xsl:text>
                        <xsl:value-of select="count(//struggle)"/>
                    </th>
                </xsl:for-each>
                <xsl:for-each select="//song">
                    <th>
                        <xsl:value-of select="food"/>
                        <xsl:text>&#x9;</xsl:text>
                        <xsl:value-of select="count(//food)"/>
                    </th>
                </xsl:for-each>
                <xsl:for-each select="//song">
                    <th>
                        <xsl:value-of select="money"/>
                        <xsl:text>&#x9;</xsl:text>
                        <xsl:value-of select="count(//money)"/>
                    </th>
                </xsl:for-each>
                <xsl:for-each select="//song">
                    <th>
                        <xsl:value-of select="alcohol"/>
                        <xsl:text>&#x9;</xsl:text>
                        <xsl:value-of select="count(//alcohol)"/>
                    </th>
                </xsl:for-each>
                <xsl:for-each select="//song">
                    <th>
                        <xsl:value-of select="hiphop"/>
                        <xsl:text>&#x9;</xsl:text>
                        <xsl:value-of select="count(//hiphop)"/>
                    </th>
                </xsl:for-each>
                <xsl:for-each select="//song">
                    <th>
                        <xsl:value-of select="haters"/>
                        <xsl:text>&#x9;</xsl:text>
                        <xsl:value-of select="count(//haters)"/>
                    </th>
                </xsl:for-each>
                <xsl:for-each select="//song">
                    <th>
                        <xsl:value-of select="guns"/>
                        <xsl:text>&#x9;</xsl:text>
                        <xsl:value-of select="count(//guns)"/>
                    </th>
                </xsl:for-each>
                <xsl:for-each select="//song">
                    <th>
                        <xsl:value-of select="popculture"/>
                        <xsl:text>&#x9;</xsl:text>
                        <xsl:value-of select="count(//popculture)"/>
                    </th>
                </xsl:for-each>
                <xsl:for-each select="//song">
                    <th>
                        <xsl:value-of select="weed"/>
                        <xsl:text>&#x9;</xsl:text>
                        <xsl:value-of select="count(//weed)"/>
                    </th>
                </xsl:for-each>
                <xsl:for-each select="//song">
                    <th>
                        <xsl:value-of select="sports"/>
                        <xsl:text>&#x9;</xsl:text>
                        <xsl:value-of select="count(//sports)"/>
                    </th>
                </xsl:for-each>
                <xsl:for-each select="//song">
                    <th>
                        <xsl:value-of select="geo"/>
                        <xsl:text>&#x9;</xsl:text>
                        <xsl:value-of select="count(//geo)"/>
                    </th>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>