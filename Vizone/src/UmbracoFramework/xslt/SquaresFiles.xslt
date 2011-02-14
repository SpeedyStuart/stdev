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

    <div id="vitools-sub-container">

      <xsl:if test="string($currentPage/faceUp) != ''">
        <xsl:variable name="image" select="umbraco.library:GetMedia($currentPage/faceUp, false())"/>
        <xsl:if test="string($image/umbracoFile) != ''">
          <div id="vitools-image">
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
      <div class="teamblock">
        <xsl:attribute name="id"><xsl:value-of select="$currentPage/faceUp"/></xsl:attribute>
        <xsl:apply-templates select="$currentPage/downloadFile" />
      </div>
    </div>
  </xsl:template>

  <xsl:template match="downloadFile">
      <span class="teamcopy">
        <a>
          <xsl:attribute name="href"><xsl:call-template name="get-file-link"><xsl:with-param name="mediaId"><xsl:value-of select="file"/></xsl:with-param></xsl:call-template></xsl:attribute>
          <xsl:value-of select="title"/><span class="arrow"> >></span>
        </a>
      </span>
      <br class="hdn"/>
    <xsl:if test="position() = 3 or position() = 6 or position() = 9">
      <span class="teamcopy">
        <span class="blank">&nbsp;</span>
      </span>
      <br class="hdn" />
      <span class="teamcopy">
        <span class="blank">&nbsp;</span>
      </span>
      <br class="hdn" />
    </xsl:if>

  </xsl:template>

  <xsl:template name="get-file-link">
    <xsl:param name="mediaId"/>
    
    <xsl:if test="string($mediaId) != ''">
      <xsl:variable name="file" select="umbraco.library:GetMedia($mediaId, false())"/>
      <xsl:if test="string($file/umbracoFile) != ''"><xsl:value-of select="$file/umbracoFile"/></xsl:if>
    </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>