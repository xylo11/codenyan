document.addEventListener('DOMContentLoaded', function() {
  const dropdownButton = document.querySelector('.dropdown-button');
  const dropdownContent = document.querySelector('#dropdown-content');

  dropdownButton.addEventListener('click', function() {
    if (dropdownContent.style.display === "none") {
      dropdownContent.style.display = "block";
    } else {
      dropdownContent.style.display = "none";
    }
  });

  window.addEventListener('click', function(event) {
    if (!event.target.matches('.dropdown-button')) {
      dropdownContent.style.display = "none";
    }
  });
});