<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1"/>
<xsl:template match="dataroot">
	<html>
		<head>
			<title>Clients_France</title>
			<script type="text/javascript" src="js_liste.js"></script>
		</head>

		<body onload="init()">
			
			<xsl:element  name ="img">
				
				<xsl:attribute  name = "SRC" >drapeau/drap_france.GIF</xsl:attribute>
				<xsl:attribute  name = "ALIGN">TOP</xsl:attribute>
			</xsl:element>
			
			<table border="solid">
				<thead>
					<tr>
						<th>Pays</th><th>Code Postal</th><th>Ville</th><th>Société</th><th>Téléphone</th>
					</tr>
				</thead>
				<tbody>
					<xsl:apply-templates select="Clients[Pays='France']"> <xsl:sort select="Code_x0020_postal" data-type="text"/> </xsl:apply-templates>
				</tbody>
			</table>
		</body>

	</html>
</xsl:template>

<xsl:template match="Clients">
	
	<tr>
		<td><xsl:value-of select="Pays"/></td><td><xsl:value-of select="Code_x0020_postal"/></td><td class='bt' id='{Ville}'><xsl:value-of select="Ville"/></td><td><xsl:value-of select="Société"/></td><td><xsl:value-of select="Téléphone"/></td>
	</tr>
</xsl:template>
</xsl:stylesheet>