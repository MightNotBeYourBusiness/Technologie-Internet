<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
	<xsl:output method="html" encoding="ISO-8859-1"/>
	<!--création d'un gabarit sur le noeud "Bottin"-->
	<xsl:template match="Bottin">
	<!--Dès que l'on trouve le noeud "Bottin", oncommence le document HTML avec <Body>-->
		
			
		<html>
			<HEAD>
				<Title> 
					<xsl:value-of select="@region"/>&#160;<xsl:value-of select="@annee"/>
				</Title>
			</HEAD>
			<body>
			<xsl:apply-templates select="Abonne"/> <!--imbrication des gabarits correspondant à "Abonne"-->
			</body>
			
		</html>
	</xsl:template>
	<!--création d'un gabarit sur le noeud Abonne-->
	<xsl:template match="Abonne">
		<!--Dans ce qui suit &#160; équivaut à l'espace et &#47; équivaut à / -->
		<h1 align="center">
			<xsl:value-of select="@id"/>&#160;<xsl:value-of select="Nom"/>&#160;<xsl:value-of select="Prenom"/>
			<!--@ permet d’accéder aux attributs du nœud courant-->
			<!--<xsl:value-of  select="Nom"/>  permet d'accéder à la valeur  de l'enfant  noté "enfant" du noeud courant "Abonne"-->
			<!--il s'agit d'expressions  XPathqui est un langage  qui permet  de définir des chemins de localisation   http://fr.wikipedia.org/wiki/XPath-->
		</h1>
		<p align="center"> <font size="5" color="red">
			TELEPHONE:<xsl:value-of select="Prefixe"/>&#47;<xsl:value-of select="Tel"/>
		</font> </p>
		<h3 align="center">
			<xsl:apply-templates select="Adresse"/><!--imbrication des gabarits correspondant à "Adresse"-->
			<xsl:value-of select="CodePostal"/>&#160;<xsl:value-of select="Ville"/>
		</h3>
		<HR/> <!--trace une ligne entre chaque abonne-->
	</xsl:template>
	<!--création d'un gabarit sur le noeud Adresse-->
	<xsl:template match="Adresse">
		<h3 align="center">
			<xsl:value-of select="@designation"/>&#160;
			<xsl:value-of select="@nom"/>&#160;
			N�&#160;<xsl:value-of select="@numero"/>
		</h3>
	</xsl:template>
	
	


</xsl:stylesheet>