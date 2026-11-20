<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0">
    
      <xsl:template match="/">

        <html>
        <head>
            <title>Gestion des mandats</title>

            <style>
                * {
                    box-sizing: border-box;
                }

                body {
                    margin: 0;
                    padding: 40px 25px;
                    font-family: 'Segoe UI', Arial, sans-serif;
                    background: #f1f4fa;
                    color: #273449;
                }

                .container {
                    max-width: 1250px;
                    margin: auto;
                }

                .header {
                    text-align: center;
                    margin-bottom: 35px;
                }

                .header h1 {
                    color: #243b67;
                    font-size: 34px;
                    margin-bottom: 8px;
                }

                .header p {
                    color: #8491a5;
                    font-size: 15px;
                }

                .line {
                    width: 75px;
                    height: 4px;
                    background: #7657d5;
                    margin: 15px auto;
                    border-radius: 10px;
                }

                .table-card {
                    background: white;
                    padding: 25px;
                    border-radius: 15px;
                    box-shadow: 0 8px 30px rgba(31, 45, 80, 0.08);
                    overflow-x: auto;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    text-align: left;
                }

                thead {
                    background: #263c68;
                    color: white;
                }

                th {
                    padding: 17px 14px;
                    font-size: 14px;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                th:first-child {
                    border-radius: 8px 0 0 0;
                }

                th:last-child {
                    border-radius: 0 8px 0 0;
                }

                td {
                    padding: 16px 14px;
                    border-bottom: 1px solid #edf0f5;
                    font-size: 14px;
                }

                tbody tr:hover {
                    background: #f5f3ff;
                    transition: 0.3s;
                }

                ul {
                    margin: 0;
                    padding-left: 18px;
                    line-height: 1.8;
                }

                .num {
                    font-weight: bold;
                    color: #7657d5;
                }

                .amount {
                    font-weight: bold;
                    color: #243b67;
                }

                .status {
                    display: inline-block;
                    padding: 6px 13px;
                    border-radius: 20px;
                    font-size: 12px;
                    font-weight: bold;
                }

                .recu {
                    background: #dcfce7;
                    color: #15803d;
                }

                .non-recu {
                    background: #fee2e2;
                    color: #b91c1c;
                }

                .other {
                    background: #eee8ff;
                    color: #7657d5;
                }

                .total td {
                    background: #263c68;
                    color: white;
                    font-weight: bold;
                    padding: 16px;
                    border: none;
                }

                .total-final td {
                    background: #7657d5;
                    color: white;
                    font-weight: bold;
                    padding: 16px;
                    border: none;
                }

                .empty {
                    text-align: center;
                    padding: 30px;
                    color: #8491a5;
                }

                .footer {
                    text-align: center;
                    margin-top: 25px;
                    color: #8491a5;
                    font-size: 12px;
                }

                @media(max-width: 700px) {
                    body {
                        padding: 20px 10px;
                    }

                    .header h1 {
                        font-size: 25px;
                    }

                    .table-card {
                        padding: 12px;
                    }

                    table {
                        min-width: 750px;
                    }
                }
            </style>
        </head>

        <body>

            <div class="container">

                <div class="header">
                    <h1>Gestion des mandats</h1>
                    <div class="line"></div>
                    <p>Rapport détaillé des opérations de transfert</p>
                </div>

                <div class="table-card">

                    <table>

                        <thead>
                            <tr>
                                <th>Numéro</th>
                                <th>Date</th>
                                <th>Expéditeur</th>
                                <th>Destinataire</th>
                                <th>État</th>
                                <th>Montant</th>
                            </tr>
                        </thead>

                        <tbody>

                            <xsl:choose>
                                <xsl:when test="//mandat">

                                    <xsl:for-each select="//mandat">

                                        <tr>
                                            <td class="num">
                                                <xsl:value-of select="@num"/>
                                            </td>

                                            <td>
                                                <xsl:value-of select="@date"/>
                                            </td>

                                            <td>
                                                <ul>
                                                    <li>
                                                        CIN :
                                                        <xsl:value-of select="expediteur/@cin"/>
                                                    </li>
                                                    <li>
                                                        Nom :
                                                        <xsl:value-of select="expediteur/@nom"/>
                                                    </li>
                                                </ul>
                                            </td>

                                            <td>
                                                <ul>
                                                    <li>
                                                        CIN :
                                                        <xsl:value-of select="destinataire/@cin"/>
                                                    </li>
                                                    <li>
                                                        Nom :
                                                        <xsl:value-of select="destinataire/@nom"/>
                                                    </li>
                                                </ul>
                                            </td>

                                            <td>
                                                <span class="status">
                                                    <xsl:attribute name="class">
                                                        <xsl:text>status </xsl:text>
                                                        <xsl:choose>
                                                            <xsl:when test="@etat='recu'">
                                                                <xsl:text>recu</xsl:text>
                                                            </xsl:when>
                                                            <xsl:when test="@etat='non_recu'">
                                                                <xsl:text>non-recu</xsl:text>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:text>other</xsl:text>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:attribute>

                                                    <xsl:value-of select="@etat"/>
                                                </span>
                                            </td>

                                            <td class="amount">
                                                <xsl:value-of select="@montant"/>
                                                <xsl:text> DH</xsl:text>
                                            </td>
                                        </tr>

                                    </xsl:for-each>

                                </xsl:when>

                                <xsl:otherwise>
                                    <tr>
                                        <td colspan="6" class="empty">
                                            Aucun mandat disponible.
                                        </td>
                                    </tr>
                                </xsl:otherwise>
                            </xsl:choose>

                            <tr class="total">
                                <td colspan="5">
                                    Total des mandats
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="format-number(sum(//mandat/@montant), '#,##0.00')"/>
                                    DH
                                </td>
                            </tr>

                            <tr class="total-final">
                                <td colspan="5">
                                    Total des mandats reçus
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="format-number(sum(//mandat[@etat='recu']/@montant), '#,##0.00')"/>
                                    DH
                                </td>
                            </tr>

                            <tr class="total">
                                <td colspan="5">
                                    Total des mandats non reçus
                                </td>
                                <td>
                                    <xsl:value-of
                                        select="format-number(sum(//mandat[@etat='non_recu']/@montant), '#,##0.00')"/>
                                    DH
                                </td>
                            </tr>

                        </tbody>

                    </table>

                </div>

                <div class="footer">
                    Rapport de gestion des mandats - 2026
                </div>

            </div>

        </body>
        </html>

    </xsl:template>

</xsl:stylesheet>