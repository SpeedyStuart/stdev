<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;">
  <!ENTITY ldquo "&#x201c;">
  <!ENTITY rdquo "&#x201d;"> ]>
<xsl:stylesheet 
	version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:msxml="urn:schemas-microsoft-com:xslt"
	xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" 
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ">


<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>
<xsl:variable name="level" select="1"/>
  
<xsl:template match="/">
  <!--xsl:apply-templates select="$currentPage" mode="content"/-->

  <div id="hptext1" class="hptext" >
    <xsl:if test="string($currentPage/headingImage) != ''">
      <xsl:variable name="headingImage" select="umbraco.library:GetMedia($currentPage/headingImage, false())"/>
      <xsl:if test="string($headingImage/umbracoFile) != ''">
        <img src="{$headingImage/umbracoFile}">
          <xsl:attribute name="alt">
            <xsl:value-of select="heading"/>
          </xsl:attribute>
        </img>
      </xsl:if>
    </xsl:if>
    <p>
      <xsl:value-of disable-output-escaping="yes" select="$currentPage/summaryParagraph" />
    </p>
    <p class="hpquote">
      <em>&ldquo;<xsl:value-of select="$currentPage/quote"/>&rdquo;</em>   >>
    </p>
    <p class="hpquote1"><xsl:value-of select="$currentPage/quoteAttribution"/></p>
  </div>
  
  <xsl:for-each select="$currentPage/ancestor-or-self::* [@level = $level]/* [string(umbracoNaviHide) != '1' and @isDoc]">
    
    <div class="hptext" style="display:none;">
      <xsl:attribute name="id">hptext<xsl:value-of select="position()+1"/></xsl:attribute>
      <!-- Not used div class="heading">
        <xsl:value-of select="heading"/>
      </div-->
      <xsl:if test="string(homepageHeadingImage) != ''">
        <xsl:variable name="image" select="umbraco.library:GetMedia(homepageHeadingImage, false())"/>
          <xsl:if test="string($image/umbracoFile) != ''">
            <img src="{$image/umbracoFile}" alt="[image]">
              <xsl:attribute name="alt">
                <xsl:value-of select="heading"/>
              </xsl:attribute>
            </img>
          </xsl:if>
        </xsl:if>
      
      <p>
        <xsl:value-of select="homepageSummaryParagraph"/>
      </p>
      <xsl:if test="string(homepageQuote) != ''">
        <p class="hpquote">
          <em>&ldquo;<xsl:value-of select="homepageQuote"/>&rdquo;</em>
        </p>
        <p class="hpquote1"><xsl:value-of select="homepageQuoteAttribution"/></p>
      </xsl:if>
    </div>
    
  </xsl:for-each>
  
  

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