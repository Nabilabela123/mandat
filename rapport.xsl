<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">
    <xsl:template match="/">
        <html>
            <head>
                <title> Rapport</title>
            </head>
            <body>
                <table border="1" width="90%">
                    <tr>
                        <th>Num</th>
                        <th>Date</th>
                        <th>Exp</th>
                        <th>Dest</th>
                        <th>Montant</th>
                    </tr>
                    <xsl:for-each select="rapport/mandat">
                        <tr>
                            <td><xsl:value-of select="@num"/></td>
                            <td><xsl:value-of select="@date"/></td>
                            <td>
                                <ul>
                                    <li>CIN :<xsl:value-of select="expediteur/@cin"/></li>
                                    <li>Nom :<xsl:value-of select="expediteur/@nom"/></li>
                                </ul>
                            </td>
                            <td>
                                <ul>
                                    <li>CIN :<xsl:value-of select="destinataire/@cin"/></li>
                                    <li>Nom :<xsl:value-of select="expediteur/@nom"/></li>
                                </ul>
                            </td>
                            <td><xsl:value-of select="@etat"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>