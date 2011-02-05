<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY nbsp "&#x00A0;">
    <!ENTITY copy "&#x00A9;">
]>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library"
  exclude-result-prefixes="msxml umbraco.library">

    <xsl:output method="xml" omit-xml-declaration="yes" />

    <xsl:param name="currentPage"/>

    <xsl:variable name="level" select="1"/>

    <xsl:template match="/">
        <ul id="menu">
            <xsl:for-each select="$currentPage/ancestor-or-self::* [@level = $level]/* [string(umbracoNaviHide) != '1' and @isDoc]">
                <li>
                  <a href="{umbraco.library:NiceUrl(@id)}">
                    <xsl:attribute name="onmouseover">hidetext('hptext1');displaytext('hptext<xsl:value-of select="position()+1"/>');change1('pic1','image<xsl:value-of select="position()+1"/>');</xsl:attribute>
                    <xsl:attribute name="onmouseout">hidetext('hptext<xsl:value-of select="position()+1"/>');displaytext('hptext1');change1('pic1','image_off');setTimeout('runImage()', 5000);</xsl:attribute>
                    <xsl:if test="$currentPage/@id=@id">
                      <xsl:attribute name="class">selected</xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="@nodeName"/>
                    </a>
                </li>
            </xsl:for-each>
          <li class="smallmenu">&copy; Copyright Vizone International 2011</li>
          <li class="smallmenu1">
            <a href="privacy.html?keepThis=true&amp;TB_iframe=true&amp;height=510&amp;width=750" title="" class="thickbox">privacy</a>
          </li>
        </ul>
    </xsl:template>

</xsl:stylesheet>