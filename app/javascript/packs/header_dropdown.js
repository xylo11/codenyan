document.addEventListener('DOMContentLoaded', function() {
  const dropdownButton = document.querySelector('.dropdown-button');
  const dropdownContent = document.querySelector('#dropdown-content');

  dropdownButton.addEventListener('click', function(event) {
    event.stopPropagation();
    if (dropdownContent.style.display === "none") {
      dropdownContent.style.display = "block";
    } else {
      dropdownContent.style.display = "none";
    }
  });

  dropdownContent.addEventListener('click', function(event) {
    event.stopPropagation();
  });

  window.addEventListener('click', function(event) {
    if (!event.target.matches('.dropdown-button')) {
      dropdownContent.style.display = "none";
    }
  });

  const searchInput = document.querySelector('#search');
  searchInput.addEventListener('keyup', searchFunction);
});

function searchFunction() {
  let input, filter, dropdown, items, item, i, txtValue;
  input = document.getElementById('search');
  filter = input.value.toUpperCase();
  dropdown = document.getElementById('dropdown-content');
  items = dropdown.getElementsByClassName('dropdown-item');
  for (i = 0; i < items.length; i++) {
    item = items[i];
    txtValue = item.textContent || item.innerText;
    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      items[i].style.display = '';
    } else {
      items[i].style.display = 'none';
    }
  }
}