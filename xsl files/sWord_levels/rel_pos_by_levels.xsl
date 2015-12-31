<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="treebank">
        <sWord_document>
            <xsl:copy-of select="@*"/>
            
            <xsl:for-each select="comment">
                <xsl:copy-of select="."/>
            </xsl:for-each>
            <xsl:for-each select="annotator">
                <xsl:copy-of select="."/>
            </xsl:for-each>
            
            <xsl:for-each select="sentence">
                <sentence>
                <xsl:copy-of select="@*"/>
                <xsl:for-each select="word">
                    <xsl:choose>
                        <xsl:when test="./@relation != 'AuxX'">
                            
                                <xsl:variable name="head_1" select="./@head"/>
                                <xsl:variable name="head_2" select="parent::sentence/word[@id = $head_1]/@head"/>
                                <xsl:variable name="head_3" select="parent::sentence/word[@id = $head_2]/@head"/>
                                <xsl:variable name="head_4" select="parent::sentence/word[@id = $head_3]/@head"/>
                                <xsl:variable name="head_5" select="parent::sentence/word[@id = $head_4]/@head"/>
                                <xsl:variable name="head_6" select="parent::sentence/word[@id = $head_5]/@head"/>
                                <xsl:variable name="head_7" select="parent::sentence/word[@id = $head_6]/@head"/>
                                <xsl:variable name="head_8" select="parent::sentence/word[@id = $head_7]/@head"/>
                                <xsl:variable name="head_9" select="parent::sentence/word[@id = $head_8]/@head"/>
                                <xsl:variable name="head_10" select="parent::sentence/word[@id = $head_9]/@head"/>
                                <xsl:variable name="head_11" select="parent::sentence/word[@id = $head_10]/@head"/>
                                <xsl:variable name="head_12" select="parent::sentence/word[@id = $head_11]/@head"/>
                                <xsl:variable name="head_13" select="parent::sentence/word[@id = $head_12]/@head"/>
                                <xsl:variable name="head_14" select="parent::sentence/word[@id = $head_13]/@head"/>
                                <xsl:variable name="head_15" select="parent::sentence/word[@id = $head_14]/@head"/>
                                <xsl:variable name="head_16" select="parent::sentence/word[@id = $head_15]/@head"/>
                            
                            
                            
                            
                            <word>
                                <xsl:copy-of select="@*"/>
                                <sWord-0><xsl:value-of select="
                                    normalize-space(string-join((
                                    ./@relation,
                                    substring(./@postag, 1, 1)
                                    ), '-'))">                                    
                                </xsl:value-of>
                                </sWord-0>
                                <sWord-1>
                                    <xsl:choose>
                                        <xsl:when test="$head_1=0">#-<xsl:value-of select="
                                            normalize-space(string-join((
                                            ./@relation,
                                            substring(./@postag, 1, 1)
                                            ), '-'))">                                    
                                        </xsl:value-of>                                            
                                        </xsl:when>
                                        <xsl:when test="$head_1>0"><xsl:value-of select="
                                            normalize-space(string-join((                                                
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                            ./@relation,
                                            substring(./@postag, 1,1)
                                            ), '-'))"></xsl:value-of></xsl:when>
                                        
                                    </xsl:choose>
                                </sWord-1>
                                <xsl:choose>
                                    <xsl:when test="$head_2=0">
                                        <sWord-2>#-<xsl:value-of select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                            ./@relation,
                                            substring(./@postag, 1,1)
                                            ), '-'))"></xsl:value-of> 
                                        </sWord-2>
                                    </xsl:when>
                                    <xsl:when test="$head_2>0">
                                        <sWord-2>
                                            <xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> 
                                        </sWord-2>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$head_3=0">
                                        <sWord-3>#-<xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of>
                                        </sWord-3>
                                    </xsl:when>
                                    <xsl:when test="$head_3>0">
                                        <sWord-3>
                                        <xsl:value-of select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                            ./@relation,
                                            substring(./@postag, 1,1)
                                            ), '-'))"></xsl:value-of> </sWord-3>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$head_4=0">
                                        <sWord-4>#-<xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of>
                                        </sWord-4>
                                    </xsl:when>
                                    <xsl:when test="$head_4>0">
                                        <sWord-4>
                                            <xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> </sWord-4>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$head_5=0">
                                        <sWord-5>#-<xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of>
                                        </sWord-5>
                                    </xsl:when>
                                    <xsl:when test="$head_5>0">
                                        <sWord-5>
                                            <xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> </sWord-5>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$head_6=0">
                                        <sWord-6>#-<xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> 
                                        </sWord-6>
                                    </xsl:when>
                                    <xsl:when test="$head_6>0">
                                        <sWord-6>
                                            <xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_6]/@relation,
                                                substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> </sWord-6>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$head_7=0">
                                        <sWord-7>#-<xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_6]/@relation,
                                                substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> 
                                        </sWord-7>
                                    </xsl:when>
                                    <xsl:when test="$head_7>0">
                                        <sWord-7>
                                            <xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_7]/@relation,
                                                substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_6]/@relation,
                                                substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> </sWord-7>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$head_8=0">
                                        <sWord-8>#-<xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_7]/@relation,
                                                substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_6]/@relation,
                                                substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> 
                                        </sWord-8>
                                    </xsl:when>
                                    <xsl:when test="$head_8>0">
                                        <sWord-8>
                                            <xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_8]/@relation,
                                                substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_7]/@relation,
                                                substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_6]/@relation,
                                                substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> </sWord-8>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$head_9=0">
                                        <sWord-9>#-<xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_8]/@relation,
                                                substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_7]/@relation,
                                                substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_6]/@relation,
                                                substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> 
                                        </sWord-9>
                                    </xsl:when>
                                    <xsl:when test="$head_9>0">
                                        <sWord-9>
                                            <xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_9]/@relation,
                                                substring(parent::sentence/word[@id = $head_9]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_8]/@relation,
                                                substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_7]/@relation,
                                                substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_6]/@relation,
                                                substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> </sWord-9>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$head_10=0">
                                        <sWord-10>#-<xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_9]/@relation,
                                                substring(parent::sentence/word[@id = $head_9]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_8]/@relation,
                                                substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_7]/@relation,
                                                substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_6]/@relation,
                                                substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> 
                                        </sWord-10>
                                    </xsl:when>
                                    <xsl:when test="$head_10>0">
                                        <sWord-10>
                                            <xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_10]/@relation,
                                                substring(parent::sentence/word[@id = $head_10]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_9]/@relation,
                                                substring(parent::sentence/word[@id = $head_9]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_8]/@relation,
                                                substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_7]/@relation,
                                                substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_6]/@relation,
                                                substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> </sWord-10>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$head_11=0">
                                        <sWord-11>#-<xsl:value-of select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_10]/@relation,
                                            substring(parent::sentence/word[@id = $head_10]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_9]/@relation,
                                            substring(parent::sentence/word[@id = $head_9]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_8]/@relation,
                                            substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_7]/@relation,
                                            substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_6]/@relation,
                                            substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_5]/@relation,
                                            substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                            ./@relation,
                                            substring(./@postag, 1,1)
                                            ), '-'))"></xsl:value-of> 
                                        </sWord-11>
                                    </xsl:when>
                                    <xsl:when test="$head_11>0">
                                        <sWord-11>
                                            <xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_11]/@relation,
                                                substring(parent::sentence/word[@id = $head_11]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_10]/@relation,
                                                substring(parent::sentence/word[@id = $head_10]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_9]/@relation,
                                                substring(parent::sentence/word[@id = $head_9]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_8]/@relation,
                                                substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_7]/@relation,
                                                substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_6]/@relation,
                                                substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> </sWord-11>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$head_12=0">
                                        <sWord-12>#-<xsl:value-of select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_11]/@relation,
                                            substring(parent::sentence/word[@id = $head_11]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_10]/@relation,
                                            substring(parent::sentence/word[@id = $head_10]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_9]/@relation,
                                            substring(parent::sentence/word[@id = $head_9]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_8]/@relation,
                                            substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_7]/@relation,
                                            substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_6]/@relation,
                                            substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_5]/@relation,
                                            substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                            ./@relation,
                                            substring(./@postag, 1,1)
                                            ), '-'))"></xsl:value-of> 
                                        </sWord-12>
                                    </xsl:when>
                                    <xsl:when test="$head_12>0">
                                        <sWord-12>
                                            <xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_12]/@relation,
                                                substring(parent::sentence/word[@id = $head_12]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_11]/@relation,
                                                substring(parent::sentence/word[@id = $head_11]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_10]/@relation,
                                                substring(parent::sentence/word[@id = $head_10]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_9]/@relation,
                                                substring(parent::sentence/word[@id = $head_9]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_8]/@relation,
                                                substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_7]/@relation,
                                                substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_6]/@relation,
                                                substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> </sWord-12>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$head_13=0">
                                        <sWord-13>#-<xsl:value-of select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_12]/@relation,
                                            substring(parent::sentence/word[@id = $head_12]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_11]/@relation,
                                            substring(parent::sentence/word[@id = $head_11]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_10]/@relation,
                                            substring(parent::sentence/word[@id = $head_10]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_9]/@relation,
                                            substring(parent::sentence/word[@id = $head_9]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_8]/@relation,
                                            substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_7]/@relation,
                                            substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_6]/@relation,
                                            substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_5]/@relation,
                                            substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                            ./@relation,
                                            substring(./@postag, 1,1)
                                            ), '-'))"></xsl:value-of> 
                                        </sWord-13>
                                    </xsl:when>
                                    <xsl:when test="$head_13>0">
                                        <sWord-13>
                                            <xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_13]/@relation,
                                                substring(parent::sentence/word[@id = $head_13]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_12]/@relation,
                                                substring(parent::sentence/word[@id = $head_12]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_11]/@relation,
                                                substring(parent::sentence/word[@id = $head_11]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_10]/@relation,
                                                substring(parent::sentence/word[@id = $head_10]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_9]/@relation,
                                                substring(parent::sentence/word[@id = $head_9]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_8]/@relation,
                                                substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_7]/@relation,
                                                substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_6]/@relation,
                                                substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> </sWord-13>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$head_14=0">
                                        <sWord-14>#-<xsl:value-of select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_13]/@relation,
                                            substring(parent::sentence/word[@id = $head_13]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_12]/@relation,
                                            substring(parent::sentence/word[@id = $head_12]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_11]/@relation,
                                            substring(parent::sentence/word[@id = $head_11]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_10]/@relation,
                                            substring(parent::sentence/word[@id = $head_10]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_9]/@relation,
                                            substring(parent::sentence/word[@id = $head_9]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_8]/@relation,
                                            substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_7]/@relation,
                                            substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_6]/@relation,
                                            substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_5]/@relation,
                                            substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                            ./@relation,
                                            substring(./@postag, 1,1)
                                            ), '-'))"></xsl:value-of> 
                                        </sWord-14>
                                    </xsl:when>
                                    <xsl:when test="$head_14>0">
                                        <sWord-14>
                                            <xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_14]/@relation,
                                                substring(parent::sentence/word[@id = $head_14]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_13]/@relation,
                                                substring(parent::sentence/word[@id = $head_13]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_12]/@relation,
                                                substring(parent::sentence/word[@id = $head_12]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_11]/@relation,
                                                substring(parent::sentence/word[@id = $head_11]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_10]/@relation,
                                                substring(parent::sentence/word[@id = $head_10]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_9]/@relation,
                                                substring(parent::sentence/word[@id = $head_9]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_8]/@relation,
                                                substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_7]/@relation,
                                                substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_6]/@relation,
                                                substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> </sWord-14>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$head_15=0">
                                        <sWord-15>#-<xsl:value-of select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_14]/@relation,
                                            substring(parent::sentence/word[@id = $head_14]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_13]/@relation,
                                            substring(parent::sentence/word[@id = $head_13]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_12]/@relation,
                                            substring(parent::sentence/word[@id = $head_12]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_11]/@relation,
                                            substring(parent::sentence/word[@id = $head_11]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_10]/@relation,
                                            substring(parent::sentence/word[@id = $head_10]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_9]/@relation,
                                            substring(parent::sentence/word[@id = $head_9]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_8]/@relation,
                                            substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_7]/@relation,
                                            substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_6]/@relation,
                                            substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_5]/@relation,
                                            substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                            ./@relation,
                                            substring(./@postag, 1,1)
                                            ), '-'))"></xsl:value-of> 
                                        </sWord-15>
                                    </xsl:when>
                                    <xsl:when test="$head_15>0">
                                        <sWord-15>
                                            <xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_15]/@relation,
                                                substring(parent::sentence/word[@id = $head_15]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_14]/@relation,
                                                substring(parent::sentence/word[@id = $head_14]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_13]/@relation,
                                                substring(parent::sentence/word[@id = $head_13]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_12]/@relation,
                                                substring(parent::sentence/word[@id = $head_12]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_11]/@relation,
                                                substring(parent::sentence/word[@id = $head_11]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_10]/@relation,
                                                substring(parent::sentence/word[@id = $head_10]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_9]/@relation,
                                                substring(parent::sentence/word[@id = $head_9]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_8]/@relation,
                                                substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_7]/@relation,
                                                substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_6]/@relation,
                                                substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> </sWord-15>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:choose>
                                    <xsl:when test="$head_16=0">
                                        <sWord-16>#-<xsl:value-of select="
                                            normalize-space(string-join((
                                            parent::sentence/word[@id = $head_15]/@relation,
                                            substring(parent::sentence/word[@id = $head_15]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_14]/@relation,
                                            substring(parent::sentence/word[@id = $head_14]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_13]/@relation,
                                            substring(parent::sentence/word[@id = $head_13]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_12]/@relation,
                                            substring(parent::sentence/word[@id = $head_12]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_11]/@relation,
                                            substring(parent::sentence/word[@id = $head_11]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_10]/@relation,
                                            substring(parent::sentence/word[@id = $head_10]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_9]/@relation,
                                            substring(parent::sentence/word[@id = $head_9]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_8]/@relation,
                                            substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_7]/@relation,
                                            substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_6]/@relation,
                                            substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_5]/@relation,
                                            substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_4]/@relation,
                                            substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_3]/@relation,
                                            substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_2]/@relation,
                                            substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                            parent::sentence/word[@id = $head_1]/@relation,
                                            substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                            ./@relation,
                                            substring(./@postag, 1,1)
                                            ), '-'))"></xsl:value-of> 
                                        </sWord-16>
                                    </xsl:when>
                                    <xsl:when test="$head_16>0">
                                        <sWord-16>
                                            <xsl:value-of select="
                                                normalize-space(string-join((
                                                parent::sentence/word[@id = $head_16]/@relation,
                                                substring(parent::sentence/word[@id = $head_16]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_15]/@relation,
                                                substring(parent::sentence/word[@id = $head_15]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_14]/@relation,
                                                substring(parent::sentence/word[@id = $head_14]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_13]/@relation,
                                                substring(parent::sentence/word[@id = $head_13]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_12]/@relation,
                                                substring(parent::sentence/word[@id = $head_12]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_11]/@relation,
                                                substring(parent::sentence/word[@id = $head_11]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_10]/@relation,
                                                substring(parent::sentence/word[@id = $head_10]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_9]/@relation,
                                                substring(parent::sentence/word[@id = $head_9]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_8]/@relation,
                                                substring(parent::sentence/word[@id = $head_8]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_7]/@relation,
                                                substring(parent::sentence/word[@id = $head_7]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_6]/@relation,
                                                substring(parent::sentence/word[@id = $head_6]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_5]/@relation,
                                                substring(parent::sentence/word[@id = $head_5]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_4]/@relation,
                                                substring(parent::sentence/word[@id = $head_4]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_3]/@relation,
                                                substring(parent::sentence/word[@id = $head_3]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_2]/@relation,
                                                substring(parent::sentence/word[@id = $head_2]/@postag, 1,1),
                                                parent::sentence/word[@id = $head_1]/@relation,
                                                substring(parent::sentence/word[@id = $head_1]/@postag, 1,1),
                                                ./@relation,
                                                substring(./@postag, 1,1)
                                                ), '-'))"></xsl:value-of> </sWord-16>
                                    </xsl:when>
                                </xsl:choose>
                            </word>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
                </sentence>
            </xsl:for-each>
        </sWord_document>
    </xsl:template>
    
    
</xsl:stylesheet>