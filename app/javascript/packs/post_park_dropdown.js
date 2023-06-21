document.addEventListener('DOMContentLoaded', () => {
  const dropdown = document.getElementById('post-park-dropdown');

  if (dropdown) {
    dropdown.addEventListener('input', (event) => {
      const searchValue = event.target.value.toLowerCase();
      
      const options = dropdown.getElementsByTagName('option');
      
      for (let i = 0; i < options.length; i++) {
        const optionValue = options[i].innerText.toLowerCase();
        
        if (optionValue.indexOf(searchValue) === -1) {
          options[i].style.display = 'none';
        } else {
          options[i].style.display = 'block';
        }
      }
    });
  }
});