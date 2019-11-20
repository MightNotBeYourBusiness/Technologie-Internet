<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:param name='cl'>NaN</xsl:param> <!-- 1BS1 sera la valeur par défaut du paramètre-->
<xsl:template match="/">
	<html>

		<xsl:choose>
		<xsl:when test="$cl = 'NaN'">
		<body><!-- on peut supprimer html, body si le but n'est pas de générer une page mais un fragment de page-->
			<p>Saisir un code classe  (2BI,3BI par exemple)</p>
			<form name="monForm">
				<select id="classe">
					<xsl:for-each select="./etudiants/student[not(classe = preceding-sibling::student/classe)]">
						<xsl:sort select="classe"/>
						<option> <xsl:value-of select="classe"/> </option>
					</xsl:for-each>
				</select>
				<input type="button"  value="Afficher" onClick="filtrer(document.getElementById('classe').value)"> </input>
			</form>
		</body>
		</xsl:when>
		<xsl:otherwise>
		<body>
		<h2><xsl:value-of select= '$cl'/></h2>
		<xsl:for-each select="etudiants/student[classe=$cl]"> 
			<xsl:sort select="cl" data-type="text" order="ascending"/> 
			&#160; 
			<xsl:value-of select="nom"/>
			&#160; 
			<xsl:value-of select="prenom"/>
			&#160; 
			<xsl:value-of select="classe"/>
			&#160; 
			<xsl:value-of select="groupes"/><br />

		</xsl:for-each>
		</body>
		</xsl:otherwise>
		</xsl:choose>
	</html>
</xsl:template>


</xsl:stylesheet>