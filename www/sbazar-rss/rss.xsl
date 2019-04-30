<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output encoding="utf-8" />

    <xsl:template match="/">
        <rss version="2.0">
            <channel>
                <title>
                    <xsl:value-of select="/html/head/meta[@property='og:title']/@content" />
                </title>
                <language>cs</language>
                <xsl:for-each select="//li/div/div[@class='c-item__group']">
                    <item>
                        <title>
                            <xsl:value-of select="./a/div/span[@class='c-item__name-text']" />
                        </title>
                        <description>
                            <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                            <xsl:element name="img">
                                <xsl:attribute name="src">
                                    <xsl:text>http:</xsl:text>
                                    <xsl:value-of select="./span/div/noscript/img/@src" />
                                </xsl:attribute>
                            </xsl:element>
                            <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
                            <xsl:apply-templates select="./div[@class='c-item__attrs']" />
                        </description>
                        <link>
                            <xsl:value-of select="./a[@class='c-item__link']/@href" />
                        </link>
                        <guid>
                            <xsl:value-of select="./a[@class='c-item__link']/@href" />
                        </guid>
                    </item>
                </xsl:for-each>
            </channel>
        </rss>
    </xsl:template>

    <xsl:template match="div[@class='c-item__attrs']">
        <xsl:value-of select="span[@class='c-price c-item__price']" />
        <xsl:text>, </xsl:text>
        <xsl:value-of select="span[@class='c-item__locality']" />
    </xsl:template>

</xsl:stylesheet>
