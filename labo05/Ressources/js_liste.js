
function init()
{ // l'utilisation d'un écouteur d'évenement (event listener) va permettre: de ne pas surcharger le code d'une multitude de "onclick=..." dans le code html, ça permet aussi de bien séparer le code HTML du code javascript
var liste_boutons=document.getElementsByClassName("bt")
for (var i = 0; i < liste_boutons.length; i++) {
    liste_boutons[i].addEventListener('click', function() {afficher(this)});
}
}

function afficher(bouton)
{
window.open("https://www.google.be/maps/place/"+bouton.id);
}