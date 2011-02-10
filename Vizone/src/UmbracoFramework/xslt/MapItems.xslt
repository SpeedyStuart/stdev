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

  <div id="maptext2" class="maptext" style="display:none;" >
    <h2>Americas</h2>
    <ul>
      <xsl:call-template name="break">
        <xsl:with-param name="text" select="$currentPage/americasList"/>
      </xsl:call-template>
    </ul>
  </div>

  <div id="maptext3" class="maptext" style="display:none;" >
    <h2>EMEA</h2>
    <ul>
      <xsl:call-template name="break">
        <xsl:with-param name="text" select="$currentPage/eMEAList"/>
      </xsl:call-template>
    </ul>
  </div>

  <div id="maptext4" class="maptext" style="display:none;" >
    <h2>Asia Pacific</h2>
    <ul>
      <xsl:call-template name="break">
        <xsl:with-param name="text" select="$currentPage/asiaList"/>
      </xsl:call-template>
    </ul>
  </div>
</xsl:template>


  <xsl:template name="break">
    <xsl:param name="text" select="."/>
    <xsl:choose>
      <xsl:when test="contains($text, '&#xA;')">
        <li>
          <xsl:value-of select="substring-before($text, '&#xA;')"/>
        </li>
        <xsl:call-template name="break">
          <xsl:with-param name="text" select="substring-after($text,'&#xA;')"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <li>
          <xsl:value-of select="$text"/>
        </li>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>