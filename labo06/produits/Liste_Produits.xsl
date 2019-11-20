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
		<!-- on peut supprimer html, body si le but n'est pas de générer une page mais un fragment de page-->
			<p>choisir une cat�gorie et un seuil</p>
			<form name="monForm">
				<label for="categorie">Cat�gorie: </label>
				<select id="categorie">
					<xsl:for-each select="dataroot/Produits[not(Code_cat�gorie = preceding-sibling::Produits/Code_cat�gorie)]">
						<xsl:sort select="Code_cat�gorie"/>
						<option> <xsl:value-of select="Code_cat�gorie"/> </option>
					</xsl:for-each>
				</select>
				<br/>
				<label for="seuil">Le seuil de r�aprovisionement :</label>

				<input type="number" id="seuil" min="0" value="0"> </input>
				<br/>
				<label for="tri">choix du crit�re de tri :</label>
				<select id="tri">
					<xsl:for-each select="dataroot/Produits[R�f_produit=1]/*">
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
				<input type="button"  value="Afficher avec la cat�gorie" onClick="filtrerC(document.getElementById('categorie').value, document.getElementById('tri').value, document.getElementById('order_tri').value)">  </input>
				<input type="button"  value="Afficher avec le seuil" onClick="filtrerS(document.getElementById('seuil').value, document.getElementById('tri').value, document.getElementById('order_tri').value)">  </input>
				<input type="button"  value="Afficher avec les deux" onClick="filtrer(document.getElementById('seuil').value, document.getElementById('categorie').value, document.getElementById('tri').value, document.getElementById('order_tri').value)">  </input>
			</form>
		
		</xsl:when>
		<xsl:when test="$test = 'both'">
		
			<table border="solid">
			
				<thead>
					<tr>
						<th>r�ference</th><th>Nom</th><th>num�ro fournisseur</th><th>Code cat�gorie</th><th>quantit� par unit�</th><th>Prix unitaire</th><th>unit�s en stock</th><th>unit�s commande�s</th><th>Niveau de r�approvisionnement</th><th>Indisponible</th>
					</tr>
				</thead>
				<tbody>
				
					<xsl:for-each select="dataroot/Produits[Niveau_de_r�approvisionnement >= $seuil and Code_cat�gorie = $cat]"> 
						<xsl:sort select="*[name()=$sortBy]" order="{$order}" data-type="number"/>
						<xsl:sort select="*[name()=$sortBy]" order="{$order}" data-type="text"/>
						<tr>
							<td><xsl:value-of select="R�f_produit"/></td><td><xsl:value-of select="Nom_du_produit"/></td><td><xsl:value-of select="N_fournisseur"/></td><td><xsl:value-of select="Code_cat�gorie"/></td><td><xsl:value-of select="Quantit�_par_unit�"/></td><td><xsl:value-of select="Prix_unitaire"/></td><td><xsl:value-of select="Unit�s_en_stock"/></td><td><xsl:value-of select="Unit�s_command�es"/></td><td><xsl:value-of select="Niveau_de_r�approvisionnement"/></td><td><xsl:value-of select="Indisponible"/></td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:when>
		<xsl:when test="$test = 'Cat'">
		
			<table border="solid">
			
				<thead>
					<tr>
						<th>r�ference</th><th>Nom</th><th>num�ro fournisseur</th><th>Code cat�gorie</th><th>quantit� par unit�</th><th>Prix unitaire</th><th>unit�s en stock</th><th>unit�s commande�s</th><th>Niveau de r�approvisionnement</th><th>Indisponible</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="dataroot/Produits[Code_cat�gorie = $cat]"> 
						<xsl:sort select="*[name()=$sortBy]" order="{$order}" data-type="number"/>
						<xsl:sort select="*[name()=$sortBy]" order="{$order}" data-type="text"/>
						<tr>
							<td><xsl:value-of select="R�f_produit"/></td><td><xsl:value-of select="Nom_du_produit"/></td><td><xsl:value-of select="N_fournisseur"/></td><td><xsl:value-of select="Code_cat�gorie"/></td><td><xsl:value-of select="Quantit�_par_unit�"/></td><td><xsl:value-of select="Prix_unitaire"/></td><td><xsl:value-of select="Unit�s_en_stock"/></td><td><xsl:value-of select="Unit�s_command�es"/></td><td><xsl:value-of select="Niveau_de_r�approvisionnement"/></td><td><xsl:value-of select="Indisponible"/></td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:when>
		<xsl:when test="$test = 'Seuil'">
		
			<table border="solid">
			
				<thead>
					<tr>
						<th>r�ference</th><th>Nom</th><th>num�ro fournisseur</th><th>Code cat�gorie</th><th>quantit� par unit�</th><th>Prix unitaire</th><th>unit�s en stock</th><th>unit�s commande�s</th><th>Niveau de r�approvisionnement</th><th>Indisponible</th>
					</tr>
				</thead>
				<tbody>
					<xsl:for-each select="dataroot/Produits[Niveau_de_r�approvisionnement >= $seuil]"> 
						<xsl:sort select="*[name()=$sortBy]" order="{$order}" data-type="number"/>
						<xsl:sort select="*[name()=$sortBy]" order="{$order}" data-type="text"/>
						<tr>
							<td><xsl:value-of select="R�f_produit"/></td><td><xsl:value-of select="Nom_du_produit"/></td><td><xsl:value-of select="N_fournisseur"/></td><td><xsl:value-of select="Code_cat�gorie"/></td><td><xsl:value-of select="Quantit�_par_unit�"/></td><td><xsl:value-of select="Prix_unitaire"/></td><td><xsl:value-of select="Unit�s_en_stock"/></td><td><xsl:value-of select="Unit�s_command�es"/></td><td><xsl:value-of select="Niveau_de_r�approvisionnement"/></td><td><xsl:value-of select="Indisponible"/></td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:when>
		</xsl:choose>
	</html>
</xsl:template>

</xsl:stylesheet>