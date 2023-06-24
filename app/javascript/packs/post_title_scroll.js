document.addEventListener('DOMContentLoaded', () => {
  const textarea = document.querySelector('.post-title textarea');

  textarea.addEventListener('input', () => {
    textarea.style.height = 'auto';
    textarea.style.height = `${textarea.scrollHeight}px`;
  });
});