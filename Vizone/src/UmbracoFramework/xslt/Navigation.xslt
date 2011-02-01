<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library"
  exclude-result-prefixes="msxml umbraco.library">


    <xsl:output method="xml" omit-xml-declaration="yes" />

    <xsl:param name="currentPage"/>

    <!-- Input the documenttype you want here -->
    <xsl:variable name="level" select="1"/>

    <xsl:template match="/">

        <!-- The fun starts here -->
        <ul id="topnavigation">
            <xsl:for-each select="$currentPage/ancestor-or-self::* [@level = $level]/* [string(umbracoNaviHide) != '1' and @isDoc]">
                <li>
                    <xsl:if test="$currentPage/@id=@id"><xsl:attribute name="class">selected</xsl:attribute></xsl:if>
                    <a href="{umbraco.library:NiceUrl(@id)}">
                        <xsl:value-of select="@nodeName"/>
                    </a>
                </li>
            </xsl:for-each>
        </ul>

    </xsl:template>

</xsl:stylesheet>