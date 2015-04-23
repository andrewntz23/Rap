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
                <link href="../css/textview.css" rel="stylesheet" type="text/css"/>
                <link href="http://fonts.googleapis.com/css?family=Rock+Salt%7CSlabo+27px"
                    rel="stylesheet" type="text/css"/>
                <script type="text/javascript" src="../js/textview.js">/**/</script>
            </head>
            <body>
                <form>
                    <label><input id="overall" name="cssRadio" type="radio" data-href="css_file"
                        />overall</label>
                    <label><input id="poetic" name="cssRadio" type="radio" data-href="css_file"
                        />poetic</label>
                    <label><input id="ling" name="cssRadio" type="radio" data-href="css_file"
                        />linguistic</label>
                    <label><input id="motif" name="cssRadio" type="radio" data-href="css_file"
                        />motif</label>
                </form>
                <div id="meta">
                    <p id="dropping">This attribute is used when a sound is dropped from a word.  The tag also includes a sound
                        attribute that describes the sound that is being dropped as well as the
                        position of that sound.</p>
                    <p id="tense">This attribute is used when the wrong tense is used in a phrase.
                        For instance ‘We wasn’t on the grind’ would be tagged.  This is accompanied by the attribute person which is
                        marked as the person that the word should be, in this case first person
                        plural.</p>
                    <p id="deletion">This attribute is used when a word is deleted from a sentence.
                        It is like dropping but on a word level rather than sound. The tag is typically used for
                        copula deletion (the deletion of to be words) and is always an empty tag.
                         It is accompanied by the class attribute
                        which describes the word class of the missing word. It can be one of the
                        following: "copula", "preposition", "auxiliary", "to", "object".</p>
                    <p id="aspect">This attribute is used when a phrase uses tense/aspect in a
                        manner that is different than Standard American English (SAE)  This
                        attribute is accompanied by the tense attribute which describes one of the
                        tenses used, which are described below: <table border="1" align="right">
                            <caption>Aspect of AAVE</caption>
                            <tr>
                                <th>Tense</th>
                                <th>Example</th>
                            </tr>
                            <tr>
                                <th>Past</th>
                                <td><i>I been/done/did flown it</i></td>
                            </tr>
                            <tr>
                                <th>Progressive</th>
                                <td><i>He been working</i></td>
                            </tr>
                            <tr>
                                <th>Habitual</th>
                                <td><i>He be working Tuesdays</i></td>
                            </tr>
                            <tr>
                                <th>Present</th>
                                <td><i>He be working it</i></td>
                            </tr>
                            <tr>
                                <th>Future</th>
                                <td><i>I'mma/ I gonna fly it</i></td>
                            </tr>
                        </table></p>
                    <p id="negative">This attribute is used when there is a double negative or a
                        negative concord.  This has no accompanying attributes</p>
                    <p id="contraction">This attribute is used when a word is contracted that is
                        abnormal to SAE. This means that words like "it’s" will not be tagged by
                        words like "tryna" will be tagged. The attribute is accompanied with the
                        word1, word2, and an optional word3 attribute. These describe the
                        non-concatenated words.</p>
                    <p id="alcohol"> References to: brands of alcohol, consumption of alcohol,
                        drinking games, effects of alcohol, and colloquial terms for types of
                        alcohol.
                    </p>
                    <p id="criticism"> Criticism of the rap game and of phony rappers.
                    </p>
                    <p id="drugs"> References to: drugs, the use and sale of drugs, and users of
                        drugs. Marijuana is not included in this category. 
                    </p>
                    <p id="fashion"> References to fashion designers and brands, as well as
                        references to articles of clothing. 
                    </p>
                    <p id="food"> Any mention of food, in any form. Also, mentions of consumption of
                        food. 
                    </p>
                    <p id="geo"> All references to geographical locations, whether explicit or
                        implicit. The ref attribute contains the official name of the reference, due
                        to the fact that some references are nicknames or abbreviations. 
                    </p>
                    <p id="guns"> References to guns, both direct and indirect. 
                    </p>
                    <p id="haters"> This tag denotes those who do not enjoy Joey's music or who do
                        not support him. Also refers to those who are only interested in being
                        around Joey due to his fame and fortune. 
                    </p>
                    <p id="hiphop"> The hip hop tag always refers to a rapper or rap group, but
                        these references occur in several ways: directly referencing a song or
                        artist name (this example refers to a song by rapper Rick Ross entitled BMF:
                        Blowing Money Fast); indirectly referencing a figure in hip
                        hop using symbolism and figurative language (this example refers to Joey's
                        hip hop collective Pro Era, which has 47 closeknit members); and references to figures in hip hop
                        by quoting or paraphrasing another rapper's raps (this example shows Joey
                        rapping lyrics from Jay-Z's Song Cry).
                    </p>
                    <p id="history"> This tag denotes a reference to a historical event or figure
                        (including figures in ancient mythology).
                    </p>
                    <p id="money"> This tag is used to mark any references to money, divided into
                        two qualifications, pursuit of money and possession of money.
                    </p>
                    <p id="oldschool"> This tag marks a reference or phrase indicating that Joey is
                        talking about things that invoke nostalgia and hearken back to past times.
                    </p>
                    <p id="popculture"> The popculture tag denotes a reference to a pop culture
                        entity, whether blatantly or indirectly.
                    </p>
                    <p id="power"> The power tag marks figures and ideas that have power/control in
                        society, such as police or racism.
                    </p>
                    <p id="religion"> The religion tag here is reflective of the spiritual beliefs
                        found in the lyrics of our corpus. In some cases this refers to Christian
                        ideas, while in other cases this tag marks references to third eye spiritualism.
                    </p>
                    <p id="sex"> This tag marks references to a sexual act, whether tacit and
                        blatant.</p>
                    <p id="sports"> This tag marks all sports references. The sports tag can refer
                        to an athlete or sports figure as well as to general sports-related terms
                        and objects.
                    </p>
                    <p id="struggle"> The purpose of this tag is to indicate any raps that talk
                        about the difficulties of life at various stages of life and wealth.
                    </p>
                    <p id="success"> This tag indicates either Joey's pursuit of or possession of
                        success. This comes in a variety of colorful expressions that are all quite
                        varied.</p>
                    <p id="violence"> The violence tag is used to denote any indication of violent
                        behavior, both from Joey and his people and simply generally in the hood.
                    </p>
                    <p id="weed"> This tag is used to mark any instance where Joey discusses
                        marijuana-related activities.
                    </p>
                    <p id="women"> This tag marks references to women, and is divided into two
                        groups using qualifiers positive and negative, which label the connotation
                        of the marked word or phrase.
                    </p>
                    <p id="alliteration">A poetic device in which there is a repetition of the first
                        consonant in a series of multiple words.</p>
                    <p id="assimilation">A poetic device in which one word becomes more
                        phonologically similar to at least one other word, esentially the rappers
                        delivery of the words produces a transformation in which the previously
                        dissimilar words now seem to rhyme.
                    </p>
                    <p id="assonance">A poetic device in which words near each other have a
                        repetition of a vowel in nonrhyming stressed syllables.
                    </p>
                    <p id="rhyme">A poetic device in which there is a correspondence of sound
                        between words or the endings of words.
                    </p>
                    <p id="slantrhyme">A poetic device in which a rhyme is formed by words with
                        similar but not identical sounds. Typically, either the vowels are different
                        while the consonants are identical, or the consonants are different while
                        the vowels are identical.
                    </p>
                </div>
                <div id="container">
                    <!--#include virtual="../inc/menu.xhtml" -->
                    <div id="">
                        <div class="headfont">
                            <h1 id="top" class="headfont">
                                <xsl:apply-templates select="//meta/albumTitle"/>
                            </h1>
                        </div>
                    </div>
                    <div id="content">
                        <div class="box">
                            <div class="headfont">
                                <h2>Track List</h2>
                                <ul>
                                    <xsl:apply-templates select="//song" mode="toc">
                                        <xsl:sort/>
                                    </xsl:apply-templates>
                                </ul>
                            </div>
                        </div>
                        <!-- ends box -->
                        <xsl:apply-templates select="//song"/>
                        <xsl:apply-templates select="li"/>
                    </div>
                    <!-- ends content -->
                </div>
                <!-- ends container -->
            </body>
        </html>
    </xsl:template>
    <xsl:template match="meta/albumTitle">
            <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="song" mode="toc">
        <li>
            <div class="bodyfont">
                <a href="#{generate-id(title)}">
                    <q>
                        <xsl:apply-templates select="title" mode="toc"/>
                    </q>
                    <!-- get featured artists -->
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
                        <iframe class="video" width="300" height="300"
                            src="{audlink}"
                        > </iframe>
                    </div>
                </div>
                <button>Lyrics</button>
                <p style="display: none;">
                    <xsl:apply-templates select="stanza"/>
                </p>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="stanza">
        <xsl:apply-templates/>
        <br/>
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
        <span class="ling" data-head="{@head}" data-stem="{@stem}" data-ctype="{@type}"
            data-type="compound">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="language">
        <span class="ling" data-lang="{@lang}" data-trans="{@trans}">
            <xsl:apply-templates/>
        </span>
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
