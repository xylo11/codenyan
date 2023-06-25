$(document).ready(function() {
  $(".edit_comment").click(function(e) {
    e.preventDefault();
    var commentDiv = $(this).closest(".comment");
    commentDiv.find(".comment_content").hide();
    commentDiv.find(".edit_comment_form").show();
  });

  $(".cancel_edit_comment").click(function(e) {
    e.preventDefault();
    var commentDiv = $(this).closest(".comment");
    commentDiv.find(".edit_comment_form").hide();
    commentDiv.find(".comment_content").show();
  });
});