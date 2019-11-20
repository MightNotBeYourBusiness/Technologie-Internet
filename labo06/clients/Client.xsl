<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:param name='cl'>NaN</xsl:param>
<xsl:template match="/">

	<html>

		<xsl:choose>
		<xsl:when test="$cl = 'NaN'">
		<body><!-- on peut supprimer html, body si le but n'est pas de générer une page mais un fragment de page-->
			<p>choisir un pays</p>
			<form name="monForm">
				<select id="pays">
					<xsl:for-each select="dataroot/Clients[not(Pays = preceding-sibling::Clients/Pays)]">
						<xsl:sort select="Pays"/>
						<option> <xsl:value-of select="Pays"/> </option>
					</xsl:for-each>
				</select>
				<input type="button"  value="Afficher" onClick="filtrer(document.getElementById('pays').value)"> </input>
			</form>
		</body>
		</xsl:when>
		<xsl:otherwise>
			<xsl:element name="img">
			<xsl:attribute  name = "SRC" > 
				drapeau/drap_<xsl:value-of select="$cl"/>.GIF
			</xsl:attribute>
			</xsl:element>
			<table border="solid">
				<thead>
					<tr>
						<th>Pays</th><th>Code Postal</th><th>Ville</th><th>Société</th><th>Téléphone</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="dataroot/Clients[Pays=$cl]"> 
						<xsl:sort select="Code_x0020_postal" data-type="text"/> 
						<tr>
							<td><xsl:value-of select="Pays"/></td><td><xsl:value-of select="Code_x0020_postal"/></td><td class='bt' id='{Ville}'><xsl:value-of select="Ville"/></td><td><xsl:value-of select="Société"/></td><td><xsl:value-of select="Téléphone"/></td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:otherwise>
		</xsl:choose>
	</html>
</xsl:template>


</xsl:stylesheet>