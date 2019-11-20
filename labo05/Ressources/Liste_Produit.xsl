<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1"/>
<xsl:template match="dataroot">
	<html>
		<head>
			<title>Produits a r�approvisionnement</title>
			
		</head>

		<body>
			<table border="solid">
				<thead>
					<tr>
						<th>r�ference</th><th>Nom</th><th>Niveau de r�approvisionnement</th>
					</tr>
				</thead>
				<tbody>
					<xsl:apply-templates select="Produits[Niveau_de_r�approvisionnement > 10]"> <xsl:sort select="Nom_du_produit" data-type="text"/> </xsl:apply-templates>
				</tbody>
			</table>
		</body>

	</html>
</xsl:template>
<xsl:template match="Produits">
	<tr>
		<td><xsl:value-of select="R�f_produit"/></td><td><xsl:value-of select="Nom_du_produit"/></td><td><xsl:value-of select="Niveau_de_r�approvisionnement"/></td>
	</tr>
</xsl:template>
</xsl:stylesheet>