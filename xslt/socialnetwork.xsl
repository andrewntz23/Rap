<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    <xsl:output method = "text"/>
    <xsl:template match="/">
        <!--   tokenize(//song[@title='RighteousMinds']//stanza[@type="interlude"]/@speaker, '\s+') works to tokenize      -->
        <xsl:variable name="doc" select="/"/>
        <xsl:variable name="speakers" select="distinct-values(tokenize(string-join(//stanza/@speaker, ' '), ' '))"/>
        <xsl:for-each select="$speakers">

            <xsl:variable name="thisSpeaker" select="."/>
            <xsl:variable name="otherSpeakers" select="remove($speakers, position())"/>
            <xsl:for-each select="$otherSpeakers">
                <xsl:variable name="otherSpeaker" select="."/> 
                <xsl:variable name="count" select="count($doc//song[.//stanza/@speaker=$thisSpeaker][.//stanza/@speaker=$otherSpeaker])"/>
                <xsl:if test="not($count=0)">
                <xsl:for-each select="for $i in 1 to $count return $i">                    
                    <xsl:value-of select="$thisSpeaker"/>
                  <!--  <xsl:value-of select="',', $count"/>-->
                    <xsl:value-of select="',rappedTogether,'"/>
                    <xsl:value-of select="$otherSpeaker"/>
                    <xsl:value-of select="'&#10;'"/>
                </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>

<!--We want to color them differently, filter to have a few different graph types-->