<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tp="http://telepathy.freedesktop.org/wiki/DbusSpec#extensions-v0"
  exclude-result-prefixes="tp">

  <xsl:output method="text" indent="no" encoding="ascii"/>

  <xsl:template match="tp:error">
    <xsl:variable name="python">
      <xsl:choose>
        <xsl:when test="@python">
          <xsl:value-of select="@python"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="substring-after(@name, 'org.freedesktop.Telepathy.Error.')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    /* <xsl:value-of select="@name"/>
<xsl:value-of select="tp:docstring"/> */
<xsl:text>    </xsl:text><xsl:value-of select="$python"/>,
</xsl:template>

  <xsl:template match="text()"/>

  <xsl:template match="/tp:errors">/* Generated from the Telepathy spec
<xsl:value-of select="tp:copyright"/>
<xsl:value-of select="tp:license"/>
*/

typedef enum {
<xsl:apply-templates select="tp:error"/>} TelepathyErrors;
</xsl:template>

</xsl:stylesheet>

<!-- vim:set sw=2 sts=2 et noai noci: -->
