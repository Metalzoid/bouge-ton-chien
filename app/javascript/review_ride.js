document.addEventListener('DOMContentLoaded', function() {
  const stars = document.querySelectorAll('.rating-star');

  stars.forEach(function(star) {
    star.addEventListener('click', function() {
      const rating = parseInt(star.previousElementSibling.value);
      stars.forEach(function(s) {
        s.classList.remove('checked');
      });
      for (let i = 0; i < rating; i++) {
        stars[i].classList.add('checked');
      }
    });
  });
});
