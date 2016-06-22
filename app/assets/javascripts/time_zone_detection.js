jQuery(function() {
  var tz = jstz.determine();
  document.cookie = "timezone="+tz.name();
});