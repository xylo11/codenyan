import Quill from 'quill';

document.addEventListener('DOMContentLoaded', () => {
  const editor = document.querySelector('#editor');
  if (editor) {  // Make sure the editor element exists before initializing Quill
    const quill = new Quill(editor);
  }
});