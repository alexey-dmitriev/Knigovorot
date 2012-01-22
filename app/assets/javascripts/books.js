$(document).ready(function(){
   $("#to_right").click(function(){
      var str = "";
      $("#authors option:selected").each(function () {
        $(this).appendTo("#selected_authors");
      });
      return false;
   });

   $("#to_left").click(function(){
      var str = "";
      $("#selected_authors option:selected").each(function () {
        $(this).appendTo("#authors");
      });
      return false;
   });

   $("#update").mousedown(function(){
      $("#selected_authors option").each(function(){
        $(this).attr("selected","selected");
      });
    return false;
   });

   $("#create").mousedown(function(){
      $("#selected_authors option").each(function(){
        $(this).attr("selected","selected");
      });
    return false;
   });
})
