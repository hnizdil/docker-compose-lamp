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
                <xsl:for-each select="//li/div[contains(@class, 'c-item__box')]">
                    <item>
                        <title>
                            <xsl:value-of select=".//span[@class='c-item__name-text']" />
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select=".//b[@class='c-price__price']" />
                            <xsl:value-of select=".//span[@class='c-price__currency']" />
                        </title>
                        <description>
                            <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                            <xsl:element name="img">
                                <xsl:attribute name="src">
                                    <xsl:text>http:</xsl:text>
                                    <xsl:value-of select=".//img/@src" />
                                </xsl:attribute>
                            </xsl:element>
                            <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
                        </description>
                        <link>
                            <xsl:value-of select=".//a[@class='c-item__link']/@href" />
                        </link>
                        <guid>
                            <xsl:value-of select=".//a[@class='c-item__link']/@href" />
                        </guid>
                    </item>
                </xsl:for-each>
            </channel>
        </rss>
    </xsl:template>
</xsl:stylesheet>
