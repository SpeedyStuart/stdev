<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY nbsp "&#x00A0;">
    <!ENTITY copy "&#x00A9;">
    <!ENTITY quot "&#x00A9;">
]>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets"
	exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets ">

    <xsl:output method="xml" omit-xml-declaration="yes" />

    <xsl:param name="currentPage"/>
  
    <xsl:variable name="level" select="1"/>

    <xsl:template match="/">
        <ul id="menu">
            <xsl:for-each select="$currentPage/ancestor-or-self::* [@level = $level]/* [string(umbracoNaviHide) != '1' and @isDoc and string(topNavigation) != '1']">
                <li>
                  <a href="{umbraco.library:NiceUrl(@id)}" class="navLink">
                    <xsl:if test="$currentPage/@id=@id">
                      <xsl:attribute name="class">selected</xsl:attribute>
                    </xsl:if>
                    <xsl:attribute name="rel"><xsl:value-of select="position()+1"/></xsl:attribute>
                    <xsl:value-of select="@nodeName"/>
                    </a>
                </li>
            </xsl:for-each>
          <li class="smallmenu">&copy; Copyright Vizone International <xsl:value-of select="Exslt.ExsltDatesAndTimes:year()"/>
        </li>
          <li class="smallmenu1">
            <a class="thickbox">
              <xsl:attribute name="href">/popup.aspx?csId=<xsl:value-of select="$currentPage/../../Privacy/@id"/>&amp;cs=-2&amp;keepThis=true&amp;TB_iframe=true&amp;height=510&amp;width=750</xsl:attribute>
              <xsl:value-of select="$currentPage/../../Privacy/@nodeName"/>
            </a>
          </li>
        </ul>
    </xsl:template>

</xsl:stylesheet>