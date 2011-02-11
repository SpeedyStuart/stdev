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
    <xsl:variable name="caseStudyId" select="umbraco.library:RequestQueryString('csId')"/>
    <xsl:variable name="caseStudyType" select="umbraco.library:RequestQueryString('cs')"/>
    <xsl:choose>
      <xsl:when test="$caseStudyType='1'">
        <xsl:apply-templates select="$currentPage/../Home/SlidingPanel/SlidingPanelContent[@id=$caseStudyId]/caseStudy1Content"/>
      </xsl:when>
      <xsl:when test="$caseStudyType='2'">
        <xsl:apply-templates select="$currentPage/../Home/SlidingPanel/SlidingPanelContent[@id=$caseStudyId]/caseStudy2Content"/>
      </xsl:when>
      <xsl:when test="$caseStudyType='3'">
        <xsl:apply-templates select="$currentPage/../Home/SlidingPanel/SlidingPanelContent[@id=$caseStudyId]/caseStudy3Content"/>
      </xsl:when>
      <xsl:when test="$caseStudyType='4'">
        <xsl:apply-templates select="$currentPage/../Home/SlidingPanel/SlidingPanelContent[@id=$caseStudyId]/caseStudy4Content"/>
      </xsl:when>
      <xsl:when test="$caseStudyType='-1'">
        <xsl:apply-templates select="$currentPage/../Home/Customers/Customer[@id=$caseStudyId]/caseStudyContent"/>
      </xsl:when>
      <xsl:when test="$caseStudyType='-2'">
        <xsl:apply-templates select="$currentPage/../Privacy[@id=$caseStudyId]/privacyContent"/>
      </xsl:when>
    </xsl:choose>

  </xsl:template>

  <xsl:template match="caseStudy1Content">
    <xsl:value-of disable-output-escaping="yes" select="."/>
  </xsl:template>
  <xsl:template match="caseStudy2Content">
    <xsl:value-of disable-output-escaping="yes" select="."/>
  </xsl:template>
  <xsl:template match="caseStudy3Content">
    <xsl:value-of disable-output-escaping="yes" select="."/>
  </xsl:template>
  <xsl:template match="caseStudy4Content">
    <xsl:value-of disable-output-escaping="yes" select="."/>
  </xsl:template>
  <xsl:template match="caseStudyContent">
    <xsl:value-of disable-output-escaping="yes" select="."/>
  </xsl:template>
  <xsl:template match="privacyContent">
    <xsl:value-of disable-output-escaping="yes" select="."/>
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