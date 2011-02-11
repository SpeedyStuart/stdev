<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets"
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ">


  <xsl:output method="xml" omit-xml-declaration="yes"/>

  <xsl:param name="currentPage"/>

  <xsl:template match="/">
    <!--xsl:apply-templates select="$currentPage" mode="content"/-->
    
    <xsl:if test="string($currentPage/faceUp) != ''">
      <xsl:variable name="image" select="umbraco.library:GetMedia($currentPage/faceUp, false())"/>
      <xsl:if test="string($image/umbracoFile) != ''">
        <div id="vintage-image">
          <img src="{$image/umbracoFile}">
            <xsl:attribute name="alt">
              <xsl:value-of select="$currentPage/heading"/>
            </xsl:attribute>
            <xsl:attribute name="id"><xsl:value-of select="$currentPage/faceUp"/>_up</xsl:attribute>
          </img>
          <xsl:if test="string($currentPage/faceDown) != ''">
            <xsl:variable name="imageDown" select="umbraco.library:GetMedia($currentPage/faceDown, false())"/>
            <xsl:if test="string($imageDown/umbracoFile) != ''">
              <img src="{$imageDown/umbracoFile}" style="display:none;">
                <xsl:attribute name="alt">
                  <xsl:value-of select="$currentPage/heading"/>
                </xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="$currentPage/faceUp"/>_down</xsl:attribute>
              </img>
            </xsl:if>
          </xsl:if>
          
        </div>
      </xsl:if>
    </xsl:if>
    
    <xsl:apply-templates select="$currentPage/SquareContent" />
  </xsl:template>

  <xsl:template match="SquareContent">

    <div class="block">
      <a href="#" class="squareBlock">
        <xsl:attribute name="id"><xsl:value-of select="$currentPage/faceUp"/></xsl:attribute>
        <span class="copy">
          <span class="copy-left">
            <strong>We</strong>&nbsp;
            <xsl:value-of select="weDo"/>
          </span>
          <span class="copy-right">
            <strong>We don't</strong>&nbsp;
            <xsl:value-of select="weDont"/>
          </span>
        </span>
      </a>
    </div>

    <xsl:if test="position() = 3 or position() = 6 or position() = 9">
      <div class="block">&nbsp;</div>
      <div class="block">&nbsp;</div>
    </xsl:if>

  </xsl:template>

</xsl:stylesheet>