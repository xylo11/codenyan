document.addEventListener('DOMContentLoaded', () => {
  const titleInput = document.getElementById('title-input');
  const titleCount = document.getElementById('title-count');

  titleInput.addEventListener('input', () => {
    let length = titleInput.value.length;
    if (length > 300) {
      titleInput.value = titleInput.value.substring(0, 300);
      length = 300;
    }
    titleCount.textContent = `${length}/300`;
  });
});