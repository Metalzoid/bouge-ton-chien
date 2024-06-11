import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rating-stars"
export default class extends Controller {
  connect() {
      const stars = document.querySelectorAll('.rating-star');
      stars.forEach(function(star, index) {
        star.addEventListener('click', function() {
          const rating = index + 1;

          // Désélectionne toutes les étoiles
          stars.forEach(function(s) {
            s.classList.remove('checked');
          });

          // Sélectionne les étoiles jusqu'à celle cliquée
          for (let i = 0; i < rating; i++) {
            stars[i].classList.add('checked');
          }

          // Met à jour la valeur du bouton radio correspondant
          document.getElementById(`rating_${rating}`).checked = true;
        });
      });
  }


}
