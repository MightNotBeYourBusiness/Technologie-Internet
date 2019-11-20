<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1"/>
<xsl:template match="movies">
	<html>
		<head>
			<title>Ciné</title>
		</head>
		
		<body>
			<h3>Liste des titres:</h3>
			<xsl:for-each select="movie">
				<xsl:sort select="title" data-type="text"/>
				<xsl:value-of select="title"/><br/>
			</xsl:for-each>
			<hr/>
			
			<h3>Titres des films sortis après 2000 : </h3>
			<xsl:for-each select="./movie[year>2000]">
				<xsl:sort select="year" data-type="number"/>
				
				<xsl:value-of select="year"/> : <xsl:value-of select="title"/><br/>
				
			</xsl:for-each>
			<hr/>
			
			<h3>le résumé de American Beauty : </h3>
			<xsl:value-of select="./movie[title='American Beauty']/summary"/>
			<hr/>
			
			<h3>qui est le metteur en scène de Gladiator </h3>
			<xsl:value-of select="./movie[title='Gladiator']/director/first_name"/>&#160;<xsl:value-of select="./movie[title='Gladiator']/director/last_name"/>
			<hr/>
			
			<h3>titre des films avec Harrison Ford : </h3>
			<xsl:for-each select="./movie[actor[@id='24']]">
				<xsl:sort select="title" data-type="text"/>
				<xsl:value-of select="title"/>
				<br/>
			</xsl:for-each>
			<hr/>
			
			<h3>Titre des films qui ont un résumé : </h3>
			<xsl:for-each select="movie">
				<xsl:sort select="title" data-type="text"/>
				<xsl:if test="summary">
					<xsl:value-of select="title"/>
					<br/>
				</xsl:if>
			</xsl:for-each>
			<hr/>
			
			<h3>Titre des films qui n'ont pas un résumé : </h3>
			<xsl:for-each select="movie">
				<xsl:sort select="title" data-type="text"/>
				<xsl:if test="not(summary)">
					<xsl:value-of select="title"/>
					<br/>
				</xsl:if>
			</xsl:for-each>
			<hr/>
			
			<h3>Le rôle que tient Clint Eastwood dans Impitoyable : </h3>
			<xsl:value-of select="./movie[title='Impitoyable']/actor[@id='20']/role"/>
			<hr/>
			
			<h3>Titre du dernier film du document : </h3>
			<xsl:value-of select="./movie[last()]/title"/>
			<hr/>
			
			<h3>Titre des films dont le titre contient un G : </h3>
		
			<xsl:for-each select="./movie[contains(title,'G')]">
				<xsl:sort select="title" data-type="text"/>
				<xsl:value-of select="title"/>
				<br/>
			</xsl:for-each>
			<hr/>
			
			<h3>Titre des films dont la distribution consiste en exactement 3 acteurs : </h3>
			<xsl:for-each select="./movie[count(actor) = 3]">
				<xsl:sort select="title" data-type="text"/>
				<xsl:value-of select="title"/>
				<br/>
			</xsl:for-each>
			<hr/>
			
			<h3>tous les acteurs sans doublon</h3>
			<xsl:for-each select="./movie/actor[not(preceding::actor/@id=@id)]">
				<xsl:sort select="first_name|last_name" data-type="text"/>
				<xsl:value-of select="first_name"/>&#160;<xsl:value-of select="last_name"/>
				<br/>
			</xsl:for-each>
		</body>
		
	</html>
</xsl:template>
</xsl:stylesheet>