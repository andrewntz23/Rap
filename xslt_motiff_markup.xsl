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
                <table>
                    <xsl:for-each select="//song">
                        <tr>
                            <td>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="@title"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//oldschool)"/>
                            </td>
                            <td>
                                <xsl:value-of select="success"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//success)"/>
                            </td>
                            <td>
                                <xsl:value-of select="women"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//women)"/>
                            </td>
                            <td>
                                <xsl:value-of select="fashion"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//fashion)"/>
                            </td>
                            <td>
                                <xsl:value-of select="struggle"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//struggle)"/>
                            </td>
                            <td>
                                <xsl:value-of select="food"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//food)"/>
                            </td>
                            <td>
                                <xsl:value-of select="money"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//money)"/>
                            </td>
                            <td>
                                <xsl:value-of select="alcohol"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//alcohol)"/>
                            </td>
                            <td>
                                <xsl:value-of select="hiphop"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//hiphop)"/>
                            </td>
                            <td>
                                <xsl:value-of select="haters"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//haters)"/>
                            </td>
                            <td>
                                <xsl:value-of select="guns"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//guns)"/>
                            </td>
                            <td>
                                <xsl:value-of select="popculture"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//popculture)"/>
                            </td>
                            <td>
                                <xsl:value-of select="weed"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//weed)"/>
                            </td>
                            <td>
                                <xsl:value-of select="sports"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//sports)"/>
                            </td>
                            <td>
                                <xsl:value-of select="geo"/>
                                <xsl:text>&#x9;</xsl:text>
                                <xsl:value-of select="count(//geo)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="song">
        <li>
            <div class="bodyfont">
                <a href="#{generate-id(@title)}">
                    <q>
                        <xsl:apply-templates select="@title"/>
                    </q>
                </a>
            </div>
        </li>
    </xsl:template>
</xsl:stylesheet>
