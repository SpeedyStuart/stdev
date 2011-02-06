<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;">
  <!ENTITY ldquo "&#x201c;">
  <!ENTITY rdquo "&#x201d;">
  <!ENTITY ndash "&#x2013;"> ]>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" 
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ">


  <xsl:output method="xml" omit-xml-declaration="yes"/>

  <xsl:param name="currentPage"/>

  <xsl:template match="/">
    <div id="vital-slider">
      <div id="slider">
        <div class="scroll">
          <div class="scrollContainer">
            <xsl:apply-templates select="$currentPage/Person"/>
          </div>
        </div>
        <ul class="navigation">
          <xsl:apply-templates select="$currentPage/Person" mode="navigation"/>
        </ul>
      </div>
    </div>
    <xsl:apply-templates select="$currentPage/Person" mode="quote"/>
  </xsl:template>

  <!-- Do nothing templates -->
  <xsl:template match="Person">
  </xsl:template>
  <xsl:template match="Person" mode="navigation">
  </xsl:template>
  
  <!-- Divide list into to panels - currently 2 people per panel (Change all 2s to 10s when more data-->
  <xsl:template match="Person[(position()-1) mod 2 = 0]">
    <xsl:variable name="position" select="1 +((position()-1) div 2)"/>
    <div class="panel">
      <xsl:attribute name="id">page<xsl:value-of select="$position"/>
      </xsl:attribute>
      <xsl:apply-templates select="$currentPage/Person[position() &lt;= $position*2 and position() &gt; ($position*2)-2]" mode="person"/>
    </div>
  </xsl:template>

  <!-- Divide list into to panels - currently 2 people per panel (Change the mod 2 and div 2 to 10 when more data-->
  <!-- this oneis for the navigation but follows the exact same logic as above-->
  <xsl:template match="Person[(position()-1) mod 2 = 0]" mode="navigation">
    <xsl:variable name="position" select="1 +((position()-1) div 2)"/>
    <li>
      <a>
        <xsl:attribute name="href">#page<xsl:value-of select="@id"/></xsl:attribute>
        Page <xsl:value-of select="$position"/>
      </a>
    </li>
  </xsl:template>
  
  <!-- person images-->
  <xsl:template match="Person" mode="person">
    <div class="imageblock">
      <a href="" class="personImage">
        <xsl:attribute name="rel"><xsl:value-of select="@id"/></xsl:attribute>
        <span class="imagerollover">
          <span class="image-left">
            <xsl:call-template name="render-image">
              <xsl:with-param name="imageId" select="imageSmall"/>
            </xsl:call-template>
          </span>
          <span class="image-right">
            <xsl:call-template name="render-image">
              <xsl:with-param name="imageId" select="imageFull"/>
            </xsl:call-template>
          </span>
        </span>
      </a>
    </div>
  </xsl:template>

  <!-- Perosn name and quote-->
  <xsl:template match="Person" mode="quote">
    <div class="vitaltext" style="display:none;" >
      <xsl:attribute name="id">personText<xsl:value-of select="@id"/></xsl:attribute>
      <p><xsl:value-of select="name"/>
        <xsl:if test="string(quote) != ''">
          &ndash; &ldquo;<xsl:value-of select="quote"/>&rdquo;    
        </xsl:if>
      </p>
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