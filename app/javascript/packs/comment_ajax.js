$(document).ready(function() {
  // Edit form toggle
  $(".toggle-edit-form").click(function(e) {
    e.preventDefault();
    var commentDiv = $(this).closest(".comment");
    commentDiv.find(".content-display").hide(); // Hide the content display
    commentDiv.find(".edit-form").show(); // Show the edit form
  });

  // Cancel edit
  $(".cancel-edit").click(function(e) {
    e.preventDefault();
    var commentDiv = $(this).closest(".comment");
    commentDiv.find(".edit-form").hide(); // Hide the edit form
    commentDiv.find(".content-display").show(); // Show the content display
  });
});