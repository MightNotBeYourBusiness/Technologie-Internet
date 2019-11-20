<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
	<xsl:output method="html" encoding="ISO-8859-1"/>
	<xsl:template match="ListeProposition">
		<html>
			<HEAD>
				<title>Liste des Stages</title>
			</HEAD>
			
			<body>
				<xsl:apply-templates select="PropositionStage"/>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="PropositionStage">
		<h1>informations Entreprise:</h1>
		<xsl:apply-templates select="Entreprise"/>
		
		<h1>informations Etudiant:</h1>
		<h3>
			<xsl:apply-templates select="Etudiant"/>
		</h3>
		<HR/>
	</xsl:template>
	
	<xsl:template match="Entreprise">
		<h3> 
			nom: <xsl:value-of select="@denomination"/>
			<br/>
			adresse: <xsl:apply-templates select="Adresse"/>
			<br/>
			objet: <xsl:value-of select="Objet"/>
			<br/>
			Responsable Serveur: <xsl:apply-templates select="ResponsableServ"/>
			<br/>
			Responsable Stagiaire: <xsl:apply-templates select="ResponsableStagiaire"/>
			<br/>
		</h3>	
	</xsl:template>
	
	<xsl:template match="Adresse">
		<xsl:value-of select="@nom"/>&#160;
		<xsl:value-of select="@localite"/>&#160;
		<xsl:value-of select="@codePostal"/>
	</xsl:template>
	
	<xsl:template match="ResponsableServ">
		<xsl:value-of select="@civilisite"/>&#160;
		<xsl:value-of select="@nom"/>
	</xsl:template>
	
	<xsl:template match="ResponsableStagiaire">
		<xsl:value-of select="@civilisite"/>&#160;
		<xsl:value-of select="@nom"/>
	</xsl:template>
	
	<xsl:template match="Etudiant">
		<xsl:apply-templates select="Identite"/>
		<xsl:apply-templates select="Etude"/>
	</xsl:template>
	
	<xsl:template match="Identite">
		nom: <xsl:value-of select="@nom"/>
		<br/>
		prenom: <xsl:value-of select="@prenom"/>
		<br/>
	</xsl:template>
	
	<xsl:template match="Etude">
		section: <xsl:value-of select="@section"/>
		<br/>
		classe: <xsl:value-of select="@classe"/>
		<br/>
	</xsl:template>
</xsl:stylesheet>