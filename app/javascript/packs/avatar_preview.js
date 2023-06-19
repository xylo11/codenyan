function previewAvatar(input) {
  const newPreviewDiv = document.getElementById('new-avatar-preview');
  const currentPreviewDiv = document.getElementById('current-avatar-preview');

  newPreviewDiv.innerHTML = '';

  if (input.files && input.files[0]) {
    const reader = new FileReader();

    reader.onload = function(e) {
      const img = document.createElement('img');
      img.setAttribute('src', e.target.result);
      img.setAttribute('width', '150');
      img.setAttribute('height', '150');
      newPreviewDiv.appendChild(img);
      currentPreviewDiv.style.display = "none";
    }

    reader.readAsDataURL(input.files[0]);
  }
}

window.previewAvatar = previewAvatar;