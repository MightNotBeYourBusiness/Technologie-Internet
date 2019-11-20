<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:param name='test'>init</xsl:param>
<xsl:param name='cat'>null</xsl:param>
<xsl:param name='seuil'>null</xsl:param>
<xsl:param name='sortBy'>null</xsl:param>
<xsl:param name='order'>null</xsl:param>


<xsl:template match="/">

	<html>

		<xsl:choose>
		<xsl:when test="$test = 'init'">
		<!-- on peut supprimer html, body si le but n'est pas de gÃ©nÃ©rer une page mais un fragment de page-->
			<p>choisir une catégorie et un seuil</p>
			<form name="monForm">
				<label for="categorie">Catégorie: </label>
				<select id="categorie">
					<xsl:for-each select="dataroot/Produits[not(Code_catégorie = preceding-sibling::Produits/Code_catégorie)]">
						<xsl:sort select="Code_catégorie"/>
						<option> <xsl:value-of select="Code_catégorie"/> </option>
					</xsl:for-each>
				</select>
				<br/>
				<label for="seuil">Le seuil de réaprovisionement :</label>

				<input type="number" id="seuil" min="0" value="0"> </input>
				<br/>
				<label for="tri">choix du critére de tri :</label>
				<select id="tri">
					<xsl:for-each select="dataroot/Produits[Réf_produit=1]/*">
						<option><xsl:value-of select="name()"/></option>
					</xsl:for-each>
				</select>
				<label for="order_tri">  choix de l'ordre du tri: </label>
				<select id="order_tri">
					<option>ascending</option>
					<option>descending</option>
				</select>
				<br/>
				<br/>
				<input type="button"  value="Afficher avec la catégorie" onClick="filtrerC(document.getElementById('categorie').value, document.getElementById('tri').value, document.getElementById('order_tri').value)">  </input>
				<input type="button"  value="Afficher avec le seuil" onClick="filtrerS(document.getElementById('seuil').value, document.getElementById('tri').value, document.getElementById('order_tri').value)">  </input>
				<input type="button"  value="Afficher avec les deux" onClick="filtrer(document.getElementById('seuil').value, document.getElementById('categorie').value, document.getElementById('tri').value, document.getElementById('order_tri').value)">  </input>
			</form>
		
		</xsl:when>
		<xsl:when test="$test = 'both'">
		
			<table border="solid">
			
				<thead>
					<tr>
						<th>réference</th><th>Nom</th><th>numéro fournisseur</th><th>Code catégorie</th><th>quantité par unité</th><th>Prix unitaire</th><th>unités en stock</th><th>unités commandeés</th><th>Niveau de réapprovisionnement</th><th>Indisponible</th>
					</tr>
				</thead>
				<tbody>
				
					<xsl:for-each select="dataroot/Produits[Niveau_de_réapprovisionnement >= $seuil and Code_catégorie = $cat]"> 
						<xsl:sort select="*[name()=$sortBy]" order="{$order}" data-type="number"/>
						<xsl:sort select="*[name()=$sortBy]" order="{$order}" data-type="text"/>
						<tr>
							<td><xsl:value-of select="Réf_produit"/></td><td><xsl:value-of select="Nom_du_produit"/></td><td><xsl:value-of select="N_fournisseur"/></td><td><xsl:value-of select="Code_catégorie"/></td><td><xsl:value-of select="Quantité_par_unité"/></td><td><xsl:value-of select="Prix_unitaire"/></td><td><xsl:value-of select="Unités_en_stock"/></td><td><xsl:value-of select="Unités_commandées"/></td><td><xsl:value-of select="Niveau_de_réapprovisionnement"/></td><td><xsl:value-of select="Indisponible"/></td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:when>
		<xsl:when test="$test = 'Cat'">
		
			<table border="solid">
			
				<thead>
					<tr>
						<th>réference</th><th>Nom</th><th>numéro fournisseur</th><th>Code catégorie</th><th>quantité par unité</th><th>Prix unitaire</th><th>unités en stock</th><th>unités commandeés</th><th>Niveau de réapprovisionnement</th><th>Indisponible</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="dataroot/Produits[Code_catégorie = $cat]"> 
						<xsl:sort select="*[name()=$sortBy]" order="{$order}" data-type="number"/>
						<xsl:sort select="*[name()=$sortBy]" order="{$order}" data-type="text"/>
						<tr>
							<td><xsl:value-of select="Réf_produit"/></td><td><xsl:value-of select="Nom_du_produit"/></td><td><xsl:value-of select="N_fournisseur"/></td><td><xsl:value-of select="Code_catégorie"/></td><td><xsl:value-of select="Quantité_par_unité"/></td><td><xsl:value-of select="Prix_unitaire"/></td><td><xsl:value-of select="Unités_en_stock"/></td><td><xsl:value-of select="Unités_commandées"/></td><td><xsl:value-of select="Niveau_de_réapprovisionnement"/></td><td><xsl:value-of select="Indisponible"/></td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:when>
		<xsl:when test="$test = 'Seuil'">
		
			<table border="solid">
			
				<thead>
					<tr>
						<th>réference</th><th>Nom</th><th>numéro fournisseur</th><th>Code catégorie</th><th>quantité par unité</th><th>Prix unitaire</th><th>unités en stock</th><th>unités commandeés</th><th>Niveau de réapprovisionnement</th><th>Indisponible</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="dataroot/Produits[Niveau_de_réapprovisionnement >= $seuil]"> 
						<xsl:sort select="*[name()=$sortBy]" order="{$order}" data-type="number"/>
						<xsl:sort select="*[name()=$sortBy]" order="{$order}" data-type="text"/>
						<tr>
							<td><xsl:value-of select="Réf_produit"/></td><td><xsl:value-of select="Nom_du_produit"/></td><td><xsl:value-of select="N_fournisseur"/></td><td><xsl:value-of select="Code_catégorie"/></td><td><xsl:value-of select="Quantité_par_unité"/></td><td><xsl:value-of select="Prix_unitaire"/></td><td><xsl:value-of select="Unités_en_stock"/></td><td><xsl:value-of select="Unités_commandées"/></td><td><xsl:value-of select="Niveau_de_réapprovisionnement"/></td><td><xsl:value-of select="Indisponible"/></td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:when>
		</xsl:choose>
	</html>
</xsl:template>

</xsl:stylesheet>