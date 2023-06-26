import $ from 'jquery';
window.$ = $;
window.jQuery = $;

import Rails from "@rails/ujs";
Rails.start();

// require("turbolinks").start()  // コメントアウトされています
require("@rails/activestorage").start();
require("channels");
require("packs/post_park_dropdown");

$.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
});

import ClassicEditor from './ckeditor.js';

document.addEventListener('DOMContentLoaded', () => {
  const editorElements = document.querySelectorAll('.post-textarea');
  const editorInstances = [];

  editorElements.forEach((editorElement) => {
    ClassicEditor
      .create(editorElement)
      .then((editor) => {
        editorInstances.push(editor);
      })
      .catch(error => {
        console.error(error);
      });
  });

  document.addEventListener('ajax:success', () => {
    editorInstances.forEach((editor) => {
      editor.setData('');
    });
  });
});