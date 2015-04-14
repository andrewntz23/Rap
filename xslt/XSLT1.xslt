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
                <script type="text/javascript" src="../js/lyrics.js">/**/</script>
            </head>
            <body>
                <div id="meta"><p id="dropping">This attribute is used when a sound is dropped from a word. For
                    example, the word somthin’ would be tagged as <code>&lt;AAVE
                        field="phon" type="dropping" sound="g" position="initial"
                        &gt;somthin’&lt;/AAVE&gt;</code>. The tag also includes a sound
                    attribute that describes the sound that is being dropped as well as
                    the position of that sound.</p>
                    <p id="tense">This attribute is used when the wrong tense is used in a phrase. For
                        instance ‘We wasn’t on the grind’ would be tagged as <code>We
                            &lt;AAVE field="syn" type="tense" person="first
                            plural"&gt;wasn't&lt;/AAVE&gt; on the grind</code>. This is
                        accompanied by the attribute person which is marked as the person
                        that the word should be, in this case first person plural.</p>
                    <p id="deletion">This attribute is used when a word is deleted from a sentence. It is
                        like dropping but on a sentence level. The tag is typically used for
                        copula deletion (the deletion of to be words) and is always an empty
                        tag that looks like this <code>&lt;AAVE field="syn" type="deletion"
                            class="copula"/AAVE&gt;</code>. It is accompanied by the class
                        attribute which describes the word class of the missing word. It can
                        be one of the following: "copula", "preposition", "auxiliary", "to",
                        "object".</p>
                    <p id="aspect">This attribute is used when a phrase uses tense/aspect in a manner
                        that is different than Standard American English (SAE) The tag is
                        typically used as follows: <code>&lt;AAVE field="syn" type="aspect"
                            tense="habitual"&gt;sounds been profound&lt;/AAVE&gt;</code>.
                        This attribute is accompanied by the tense attribute which describes
                        one of the tenses used, which are described below: TABLE</p>
                    <p id="negative">This attribute is used when there is a double negative or a negative
                        concord. This is commonly seen in phrases like <code>‘Cause it
                            &lt;AAVE field="syn" type="negative"&gt;ain’t no fun if the
                            homies don’t get none&lt;/AAVE&gt;</code>. This has no
                        accompanying attributes</p>
                    <p id="contraction">This attribute is used when a word is contracted that is abnormal to
                        SAE. This means that words like ‘it’s’ will not be tagged by words
                        like ‘tryna’ will be tagged. The tag looks like <code>&lt;AAVE
                            field="phon" type="contraction" word1="trying" word2="to"
                            &gt;tryna&lt;/AAVE&gt;</code>. The attribute is accompanied with
                        the word1, word2, and an optional word3 attribute. These describe
                        the non-concatenated words.</p>
                    <p id="alcohol"> References to:
                        brands of alcohol, consumption of alcohol, drinking games, effects
                        of alcohol, and colloquial terms for types of alcohol. Example:
                        <code>&lt;alcohol&gt;Moet&lt;/alcohol&gt;</code>
                    </p>
                    <p id="criticism"> Criticism of the rap game and
                        of phony rappers. Example: <code>&lt;criticism&gt;Slipping like
                            fishes, choking when you hit the cypher&lt;/criticism&gt;</code>
                    </p>
                    <p id="drugs"> References to: drugs, the use and sale
                        of drugs, and users of drugs. Marijuana is not included in this
                        category. Example: <code>&lt;drugs&gt;the crack, they
                            overdose&lt;/drugs&gt;</code>
                    </p>
                    <p id="fashion"> References to fashion designers and
                        brands, as well as references to articles of clothing. Example:
                        <code>&lt;fashion&gt;lo, like Ralph&lt;/fashion&gt;</code>
                    </p>
                    <p id="food"> Any mention of food, in any form. Also,
                        mentions of consumption of food. Example:
                        <code>&lt;food&gt;kiwi&lt;/food&gt;</code>
                    </p>
                    <p id="geo"> All
                        references to geographical locations, whether explicit or implicit.
                        The ref attribute contains the official name of the reference, due
                        to the fact that some references are nicknames or abbreviations.
                        Example: <code>&lt;geo ref="Brooklyn"&gt;Brooklyn&lt;/geo&gt;</code>
                    </p>
                    <p id="guns"> References to guns, both direct and
                        indirect. Example: <code>&lt;guns&gt;the heater&lt;/guns&gt;</code>
                    </p>
                    <p id="haters"> This tag denotes those who do not
                        enjoy Joey's music or who do not support him. Also refers to those
                        who are only interested in being around Joey due to his fame and
                        fortune. Example: <code>&lt;haters&gt;Closed-minded
                            men&lt;/haters&gt;</code>
                    </p>
                    <p id="hiphop"> The hip hop tag always refers to a
                        rapper or rap group, but these references occur in several ways:
                        directly referencing a song or artist name (this example refers to a
                        song by rapper Rick Ross entitled BMF: Blowing Money Fast); Example:
                        <code>&lt;hiphop ref="RickRoss"&gt;BMF like Ross
                            man&lt;/hiphop&gt;</code> indirectly referencing a figure in hip
                        hop using symbolism and figurative language (this example refers to
                        Joey's hip hop collective Pro Era, which has 47 closeknit members);
                        Example: <code>&lt;hiphop ref="ProEra"&gt;47 friends in my
                            circumference&lt;/hiphop&gt;</code> and references to figures in
                        hip hop by quoting or paraphrasing another rapper's raps (this
                        example shows Joey rapping lyrics from Jay-Z's Song Cry). Example:
                        <code>&lt;hiphop ref="Jay-Z"&gt;I couldn't see it coming down my
                            eye&lt;/hiphop&gt;</code>
                        <br/>
                        <code>&lt;hiphop
                            ref="Jay-Z"&gt;So I hat to make the song
                            cry&lt;/hiphop&gt;</code>
                    </p>
                    <p id="history"> This tag denotes a reference to a
                        historical event or figure (including figures in ancient mythology).
                        Example: <code>&lt;history&gt;Underground
                            Railroad&lt;/history&gt;</code>
                    </p>
                    <p id="money"> This tag is used to mark any references
                        to money, divided into two qualifications, pursuit of money and
                        possession of money. example of pursuit of money: Example:
                        <code>&lt;money qual="pursuit"&gt;plotting on that
                            dime&lt;/money&gt;</code> example of possession of money:
                        Example: <code>&lt;money qual="possession"&gt;pockets
                            healthy&lt;/money&gt;</code>
                    </p>
                    <p id="oldschool"> This tag marks a reference or
                        phrase indicating that Joey is talking about things that invoke
                        nostalgia and hearken back to past times. Example:
                        <code>&lt;oldschool&gt;back in the days&lt;/oldschool&gt;</code>
                    </p>
                    <p id="popculture"> The popculture tag denotes a
                        reference to a pop culture entity, whether blatantly: Example:
                        <code>&lt;popculture
                            ref="Twitter"&gt;Twitter&lt;/popculture&gt;</code> or
                        indirectly: Example: <code>&lt;popculture ref="JackSparrow"&gt;jack
                            the booty like I'm Sparrow&lt;/popculture&gt;</code>
                    </p>
                    <p id="power"> The power tag marks figures and ideas
                        that have power/control in society, such as police: Example:
                        <code>&lt;power&gt;jakes&lt;/power&gt;</code> or racism:
                        Example: <code>&lt;power&gt;Jim Crow Laws&lt;/power&gt;</code>
                    </p>
                    <p id="religion"> The religion tag here is
                        reflective of the spiritual beliefs found in the lyrics of our
                        corpus. In some cases this refers to Christian ideas: Example:
                        <code>&lt;religion&gt;God bless the
                            heaven&lt;/religion&gt;</code> while in other cases this tag
                        marks references to third eye spiritualism: Example:
                        <code>&lt;religion&gt;on some third eye
                            shit&lt;/religion&gt;</code>
                    </p>
                    <p id="sex"> This tag marks references to a sexual act,
                        whether tacit and blatant. Example:
                        <code>&lt;sex&gt;bacchanalian&lt;/sex&gt;</code> This example,
                        bacchanalian, is a word for 'drunken orgy' that comes from an
                        ancient Greek festival celebrating Bacchus, god of wine. </p>
                    <p id="sports"> This tag marks all sports references. The
                        sports tag can refer to an athlete or sports figure: Example:
                        <code>&lt;sports&gt;Al Pujols&lt;/sports&gt;</code> as well as
                        to general sports-related terms and objects: Example:
                        <code>&lt;sports&gt;hoops&lt;/sports&gt;</code>
                    </p>
                    <p id="struggle"> The purpose of this tag is to
                        indicate any raps that talk about the difficulties of life at
                        various stages of life and wealth. Example:
                        <code>&lt;struggle&gt;And I'm from the blocks where they
                            sell&lt;/struggle&gt;</code>
                    </p>
                    <p id="success"> This tag indicates either Joey's
                        pursuit of or possession of success. This comes in a variety of
                        colorful expressions that are all quite varied. an example of
                        possession of success is the boast: Example: <code>&lt;success
                            qual="possession"&gt;I'm killin' this
                            shit&lt;/success&gt;</code> while an example of pursuit of
                        success is the statement that Joey will continue to work hard until
                        he gets to the point where he is famous enough to be on Jay-Z's
                        radar, and wealthy enough to afford to purchase a Range Rover for
                        his mother. Example: <code>&lt;success qual="pursuit"&gt;Won't stop
                            'til I meet Hova and my momma's in a
                            Rover&lt;/success&gt;</code>
                    </p>
                    <p id="violence"> The violence tag is used to
                        denote any indication of violent behavior, both from Joey and his
                        people and simply generally in the hood. Example:
                        <code>&lt;violence&gt;Rip your lips off your
                            mouth&lt;/violence&gt;</code>
                    </p>
                    <p id="weed"> This tag is used to mark any instance
                        where Joey discusses marijuana-related activities. Example:
                        <code>&lt;weed&gt;exotic piff&lt;/weed&gt;</code>
                    </p>
                    <p id="women"> This tag marks references to women, and
                        is divided into two groups using qualifiers positive and negative,
                        which label the connotation of the marked word or phrase. an example
                        of women negative: Example: <code>&lt;women
                            qual="neg"&gt;bitches&lt;/women&gt;</code> an example of women
                        positive: Example: <code>&lt;women
                            qual="pos"&gt;Mama&lt;/women&gt;</code>
                    </p>
                    <p id="alliteration">A poetic device in which there is a repetition of the first consonant in
                        a series of multiple words.<br/> e.g. "<em>pride</em> is higher than
                        the <em>prices</em> on your <em>Pradas</em>"</p>
                    <p id="assimilation">A poetic device in which one word becomes more phonologically similar to
                        at least one other word, esentially the rappers delivery of the words
                        produces a transformation in which the previously dissimilar words now
                        seem to rhyme.<br/> e.g. And I know the landlord fed up with <em>our
                            lies</em>
                        <br/> So we pray to the Gods, the Jahs, and the
                        <em>Allahs</em>
                        <br/> To keep us safe and watch <em>our
                            lives</em>.<br/>
                    </p>
                    <p id="assonance">A poetic device in which words near each other have a repetition of a
                        vowel in nonrhyming stressed syllables.<br/> e.g. Tend this
                        <em>racket</em> while I'm <em>cracking</em> a Serena.</p>
                    <p id="consonance">A poetic device in which words near each other have a repetition of a
                        consonants in nonrhyming stressed syllables.<br/> e.g. Show's
                        <em>too</em>
                        <em>turnt</em>
                        <em>out</em>
                        <em>return</em> home <em>burnt</em>
                        <em>out</em>
                    </p>
                    <p id="rhyme">A poetic device in which there is a correspondence of sound between words
                        or the endings of words.<br/> e.g. I know she always think of little
                        me, but now I got big <em>literally</em>
                        <br/> Worldwide and
                        <em>physically</em>
                        <br/> I'm saying I used to take walks around
                        <em>Little Italy</em>
                        <br/> Now I roam 'round <em>Sicily</em>
                        <br/>
                        And I'm plotting on a <em>milli</em>
                        <br/>
                    </p>
                    <p id="slantrhyme">A poetic device in which a rhyme is formed by words with similar but not
                        identical sounds. Typically, either the vowels are different while the
                        consonants are identical, or the consonants are different while the
                        vowels are identical.<br/> e.g. But it's <em>definite</em> I spit more
                        than speech <em>impediments</em>
                        <br/> Brooklyn's the
                        <em>residence</em>, the best and it's <em>evident</em>
                        <br/>
                    </p></div>
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
            <div class="leftfont">
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
            <div class="leftfont">
                <a href="#top">
                    <h3 id="{generate-id(title)}">
                        <xsl:apply-templates select="title"/>
                    </h3>
                </a>
                <div style="position:relative;width:267px;height:25px;overflow:hidden;">
                    <div style="position:absolute;top:-276px;left:-5px">
                        <iframe width="300" height="300"
                            src="{audlink}" origin="http://joey.obdurodon.org" enablejsapi="1">
                        </iframe>
                    </div>
                </div>
                <button style="display: none;">Lyrics</button>
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
        <span class="poetics" data-num="{@num}" data-group="{@label}">
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
    <xsl:template match="language">
        <span class="ling" data-lang="{@lang}" data-trans="{@trans}"><xsl:apply-templates/></span>
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
