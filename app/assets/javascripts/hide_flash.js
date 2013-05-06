$(function() {
  $fl = $(".flash");
  if ($fl.length > 0 ) { 
    setTimeout(function() { $fl.slideUp('slow') },4000);
  }
});
