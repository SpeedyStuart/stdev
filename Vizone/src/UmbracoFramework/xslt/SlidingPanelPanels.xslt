<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" 
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ">


  <xsl:output method="xml" omit-xml-declaration="yes"/>

  <xsl:param name="currentPage"/>

  <xsl:template match="/">

    <div class="scroll">
      <div class="scrollContainer">
        <xsl:apply-templates select="$currentPage/SlidingPanelContent"/>
      </div>
    </div>
      
  <!-- start writing XSLT -->

  </xsl:template>

  <xsl:template match="SlidingPanelContent">
    <div class="panel">
      <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
      <h2>
        <xsl:value-of select="@nodeName"/>
      </h2>
      <p>
        <xsl:value-of disable-output-escaping="yes" select="panelContent"/>
      </p>
      <xsl:choose>
        <xsl:when test="string(caseStudy1Content) != '' and string(caseStudy1Logo) != ''">
          <a href="#" class="thickbox">
            <xsl:attribute name="href">/popup.aspx?csId=<xsl:value-of select="@id"/>&amp;cs=1&amp;keepThis=true&amp;TB_iframe=true&amp;height=510&amp;width=750</xsl:attribute>
            <xsl:call-template name="render-image">
              <xsl:with-param name="imageId">
                <xsl:value-of select="string(caseStudy1Logo)"/>
              </xsl:with-param>
              <xsl:with-param name="alt">Case study 1</xsl:with-param>
            </xsl:call-template>
          </a>  
        </xsl:when>
        <xsl:when test="string(caseStudy1Logo) != ''">
          <xsl:call-template name="render-image">
            <xsl:with-param name="imageId">
              <xsl:value-of select="string(caseStudy1Logo)"/>
            </xsl:with-param>
            <xsl:with-param name="alt">Case study 1</xsl:with-param>
          </xsl:call-template>
        </xsl:when>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="string(caseStudy2Content) != '' and string(caseStudy2Logo) != ''">
          <a href="#" class="thickbox">
            <xsl:attribute name="href">/popup.aspx?csId=<xsl:value-of select="@id"/>&amp;cs=2&amp;keepThis=true&amp;TB_iframe=true&amp;height=510&amp;width=750</xsl:attribute>
            <xsl:call-template name="render-image">
              <xsl:with-param name="imageId">
                <xsl:value-of select="string(caseStudy2Logo)"/>
              </xsl:with-param>
              <xsl:with-param name="alt">Case study 2</xsl:with-param>
            </xsl:call-template>
          </a>
        </xsl:when>
        <xsl:when test="string(caseStudy2Logo) != ''">
          <xsl:call-template name="render-image">
            <xsl:with-param name="imageId">
              <xsl:value-of select="string(caseStudy2Logo)"/>
            </xsl:with-param>
            <xsl:with-param name="alt">Case study 2</xsl:with-param>
          </xsl:call-template>
        </xsl:when>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="string(caseStudy3Content) != '' and string(caseStudy3Logo) != ''">
          <a href="#" class="thickbox">
            <xsl:attribute name="href">/popup.aspx?csId=<xsl:value-of select="@id"/>&amp;cs=3&amp;keepThis=true&amp;TB_iframe=true&amp;height=510&amp;width=750</xsl:attribute>
            <xsl:call-template name="render-image">
              <xsl:with-param name="imageId">
                <xsl:value-of select="string(caseStudy3Logo)"/>
              </xsl:with-param>
              <xsl:with-param name="alt">Case study 3</xsl:with-param>
            </xsl:call-template>
          </a>
        </xsl:when>
        <xsl:when test="string(caseStudy3Logo) != ''">
          <xsl:call-template name="render-image">
            <xsl:with-param name="imageId">
              <xsl:value-of select="string(caseStudy3Logo)"/>
            </xsl:with-param>
            <xsl:with-param name="alt">Case study 3</xsl:with-param>
          </xsl:call-template>
        </xsl:when>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="string(caseStudy4Content) != '' and string(caseStudy4Logo) != ''">
          <a href="#" class="thickbox">
            <xsl:attribute name="href">/popup.aspx?csId=<xsl:value-of select="@id"/>&amp;cs=4&amp;keepThis=true&amp;TB_iframe=true&amp;height=510&amp;width=750</xsl:attribute>
            <xsl:call-template name="render-image">
              <xsl:with-param name="imageId">
                <xsl:value-of select="string(caseStudy4Logo)"/>
              </xsl:with-param>
              <xsl:with-param name="alt">Case study 4</xsl:with-param>
            </xsl:call-template>
          </a>
        </xsl:when>
        <xsl:when test="string(caseStudy4Logo) != ''">
          <xsl:call-template name="render-image">
            <xsl:with-param name="imageId">
              <xsl:value-of select="string(caseStudy4Logo)"/>
            </xsl:with-param>
            <xsl:with-param name="alt">Case study 4</xsl:with-param>
          </xsl:call-template>
        </xsl:when>
      </xsl:choose>
    </div>
  </xsl:template>

  <xsl:template name="render-image">
    <xsl:param name="imageId"/>
    <xsl:param name="alt"/>
    <xsl:if test="string($imageId) != ''">
      <xsl:variable name="headingImage" select="umbraco.library:GetMedia($imageId, false())"/>
      <xsl:if test="string($headingImage/umbracoFile) != ''">
        <img src="{$headingImage/umbracoFile}">
          <xsl:attribute name="alt">
            <xsl:value-of select="$alt"/>
          </xsl:attribute>
        </img>
      </xsl:if>
    </xsl:if>
  </xsl:template>
 
</xsl:stylesheet>