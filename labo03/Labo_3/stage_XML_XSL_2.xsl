<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
	<xsl:output method="html" encoding="ISO-8859-1"/>
	<xsl:template match="ListeProposition">
		<html>
			<HEAD>
				<title>Liste des Stages</title>
			</HEAD>
			
			<body>
				<style type="text/css">
				
				</style>
				<xsl:apply-templates select="PropositionStage"/>
				
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="PropositionStage">
		<table width="55%">	
			<caption align="center"><h1 > Proposition du lieu de stage </h1></caption>
			<thead>
				<tr>
					<th colspan="2"><span style="text-decoration: underline;">Renseignement concernant l'étudiant</span></th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th > </th> <th width = "690px"></th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="Etudiant"/>
			</tbody>
			<thead>
				<tr>
					<th colspan="2"><span style="text-decoration: underline;">Renseignement concernant l'Entreprise</span></th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="Entreprise"/>
			</tbody>
			<thead>
				<tr>
					<th colspan="2"><span style="text-decoration: underline;">Aval de la direction</span></th>
				</tr>
			</thead>
			<tbody>
			<tr><td><strong>Remarques éventuelles</strong></td><td></td></tr>
			<tr><td></td><td>............................................................................</td></tr>
			<tr><td></td><td>............................................................................</td></tr>
			<tr><td></td><td>............................................................................</td></tr>
			<tr><td><strong>Date</strong> </td><td>............................................................................</td></tr>
			<tr><td><strong>Signature</strong> </td><td>............................................................................</td></tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="Entreprise">	
		<tr><td><strong>Dénomination de l'entreprise</strong> </td><td><xsl:value-of select="@denomination"/></td></tr>
		<tr><td><strong>Adresse de l'entreprise</strong> </td><td><xsl:apply-templates select="Adresse"/></td></tr>
		<tr><td><strong>Objet social de l'entreprise</strong> </td><td><xsl:value-of select="Objet"/></td></tr>
		<tr><td><strong>Nom du directeur ou du responsable de service</strong> </td><td><xsl:apply-templates select="ResponsableServ"/></td></tr>
		<tr><td><strong>Nom et fonction du responsable du stagiaire</strong> </td><td><xsl:apply-templates select="ResponsableStagiaire"/></td></tr>
		<tr><td><strong>Telephone</strong></td><td></td></tr>	
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
		<tr>
			<td><strong>Nom et Prenom de l'étudiant</strong> </td>
			<xsl:apply-templates select="Identite"/>
		</tr>
		<xsl:apply-templates select="Etude"/>
	</xsl:template>
	
	<xsl:template match="Identite">
		<td><xsl:value-of select="@nom"/>&#160;<xsl:value-of select="@prenom"/></td>
	</xsl:template>
	
	<xsl:template match="Etude">
		<tr><td><strong>Section</strong> </td><td><xsl:value-of select="@section"/></td></tr>
		<tr><td><strong>Classe</strong> </td><td><xsl:value-of select="@classe"/></td></tr>
	</xsl:template>
</xsl:stylesheet>