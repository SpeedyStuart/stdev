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
<xsl:variable name="level" select="1"/>
  
<xsl:template match="/">

  <p class="header-links">
    <xsl:for-each select="$currentPage/ancestor-or-self::* [@level = $level]/* [string(umbracoNaviHide) != '1' and @isDoc and string(topNavigation) = '1']">
      <a href="{umbraco.library:NiceUrl(@id)}">
        <xsl:if test="true">
          <xsl:attribute name="class">navLink</xsl:attribute>
        </xsl:if>
        <xsl:choose>
          <xsl:when test="$currentPage/@id=@id">
            <xsl:attribute name="class">selected<xsl:if test="@nodeType='1158'"> navLink</xsl:if></xsl:attribute>  
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="class"><xsl:if test="@nodeType='1158'">navLink</xsl:if></xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:attribute name="rel"><xsl:value-of select="100+position()+1"/></xsl:attribute>
        <xsl:value-of select="@nodeName"/>
      </a>
      <br class="hdn" />      
    </xsl:for-each>
  </p>

</xsl:template>

</xsl:stylesheet>