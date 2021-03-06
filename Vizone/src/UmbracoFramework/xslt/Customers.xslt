<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#x00A0;">
  <!ENTITY ldquo "&#x201c;">
  <!ENTITY rdquo "&#x201d;">
  <!ENTITY ndash "&#x2013;">]>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" 
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ">


<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>

  <xsl:template match="/">
    <div id="victory-slider">
      <div id="slider">
        <div class="scroll">
          <div class="scrollContainer">
            <xsl:apply-templates select="$currentPage/Customer"/>
          </div>
        </div>
        <ul class="navigation">
          <xsl:apply-templates select="$currentPage/Customer" mode="navigation"/>
        </ul>
      </div>
    </div>
  </xsl:template>

  <!-- Do nothing templates -->
  <xsl:template match="Customer">
  </xsl:template>
  <xsl:template match="Customer" mode="navigation">
  </xsl:template>

  <!-- Divide list into to panels - currently 2 people per panel (Change all 2s to 10s when more data-->
  <xsl:template match="Customer[(position()-1) mod 15 = 0]">
    <xsl:variable name="position" select="1 +((position()-1) div 15)"/>
    <div class="panel">
      <xsl:attribute name="id">page<xsl:value-of select="$position"/>
      </xsl:attribute>
      <xsl:apply-templates select="$currentPage/Customer[position() &lt;= $position*15 and position() &gt; ($position*15)-15]" mode="customer"/>
    </div>
  </xsl:template>

  <!-- Divide list into to panels - currently 2 people per panel (Change the mod 2 and div 2 to 10 when more data-->
  <!-- this oneis for the navigation but follows the exact same logic as above-->
  <xsl:template match="Customer[(position()-1) mod 15 = 0]" mode="navigation">
    <xsl:variable name="position" select="1 +((position()-1) div 15)"/>
    <li>
      <a>
        <xsl:attribute name="href">#page<xsl:value-of select="@id"/></xsl:attribute>
        Clients <xsl:value-of select="$position"/>
      </a>
    </li>
  </xsl:template>

  <!-- person images-->
  <xsl:template match="Customer" mode="customer">

    <div class="victoryblock">
      <xsl:choose>
        <xsl:when test="string(caseStudyContent) != ''">
          <a class="thickbox">
            <xsl:attribute name="href">/popup.aspx?csId=<xsl:value-of select="@id"/>&amp;cs=-1&amp;keepThis=true&amp;TB_iframe=true&amp;height=510&amp;width=750</xsl:attribute>
            <span class="victoryrollover">
              <span class="victory-left">
                <xsl:call-template name="render-image">
                  <xsl:with-param name="imageId" select="logo"/>
                </xsl:call-template>
              </span>
              <xsl:choose>
                <xsl:when test="string(customerQuote) !=''">
                  <span class="victory-right">
                    <span class="description">
                      <em>
                        &ldquo;<xsl:value-of select="customerQuote"/>&rdquo; <span class="lime">>></span>
                      </em><br /><br /><span class="lime">
                        <strong>
                          <xsl:value-of select="quoteAttributionName"/> -</strong>
                      </span><br /><xsl:value-of select="quoteAttributionJobTitle"/>
                    </span>
                  </span>
                </xsl:when>
                <xsl:otherwise>
                  <span class="victory-left">
                    <xsl:call-template name="render-image">
                      <xsl:with-param name="imageId" select="logo"/>
                    </xsl:call-template>
                  </span>
                </xsl:otherwise>
              </xsl:choose>
            </span>
          </a>    
        </xsl:when>
        <xsl:otherwise>
          <span class="victoryrollover">
            <span class="victory-left">
              <xsl:call-template name="render-image">
                <xsl:with-param name="imageId" select="logo"/>
              </xsl:call-template>
            </span>
            <xsl:if test="string(customerQuote) !=''">
              <span class="victory-right">
                <span class="description">
                  <em>
                    &ldquo;<xsl:value-of select="customerQuote"/>&rdquo; <span class="lime">>></span>
                  </em>
                  <br />
                  <br />
                  <span class="lime">
                    <strong>
                      <xsl:value-of select="quoteAttributionName"/> -
                    </strong>
                  </span>
                  <br />
                  <xsl:value-of select="quoteAttributionJobTitle"/>
                </span>
              </span>
            </xsl:if>
          </span>
        </xsl:otherwise>
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

  <xsl:template match="*" mode="content">
    <!-- since we're using XHTML, all element names should be lower case -->
    <xsl:element name="{translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')}">
      <!-- copy all of the attributes -->
      <xsl:for-each select="@*">
        <!-- strip out XSS hacks if present -->
        <xsl:if test="name() != 'style' and name() != 'onclick'">
          <xsl:attribute name="{translate(name(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')}">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </xsl:if>
      </xsl:for-each>

      <xsl:apply-templates mode="content"/>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>