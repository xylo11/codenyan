$(document).ready(function() {
  // Edit form toggle
  $(document).on("click", ".edit_comment", function(e) {
    e.preventDefault();
    var commentDiv = $(this).closest(".comment");
    commentDiv.find(".comment_content").hide();
    commentDiv.find(".edit_comment_form").show();
  });

  // Cancel edit
  $(document).on("click", ".cancel_edit_comment", function(e) {
    e.preventDefault();
    var commentDiv = $(this).closest(".comment");
    commentDiv.find(".edit_comment_form").hide();
    commentDiv.find(".comment_content").show();
  });
});