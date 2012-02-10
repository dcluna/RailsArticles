$(function() {
  $("#post_this_tags").tokenInput("/tags.json", {
    crossDomain: false,
    prePopulate: $("#post_this_tags").data("pre"),
    theme: "facebook"
  });
});