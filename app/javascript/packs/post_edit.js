$(document).ready(function() {
  $(".toggle-edit-form").click(function(e) {
    e.preventDefault();
    var postDiv = $(this).closest(".posted-textarea");
    postDiv.find(".content-display").hide(); // Hide the content display
    postDiv.find(".edit-form").show(); // Show the edit form
  });

  $(".cancel-edit-form").click(function(e) {
    e.preventDefault();
    var postDiv = $(this).closest(".posted-textarea");
    postDiv.find(".edit-form").hide(); // Hide the edit form
    postDiv.find(".content-display").show(); // Show the content display
  });
});