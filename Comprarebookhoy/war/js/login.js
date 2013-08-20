function getCenteredCoords(width, height) {
  return {x: $(window).width()/2-width/2, y: $(window).height()/2-height/2};
}

function handleOpenIDResponse(openid_args) {
	  $("#msg").empty();
  $("#msg").html("<b>Verificando autentificacion, por favor espera...</b>");
  $.ajax({
    type: "POST",
    url: "/popup_verify/",
    data: openid_args,
    dataType: "json",
    async: false,
    success: function(user){
    	window.location = "/preAuth";
    },
    error: function(xhr, errStatus, errMessage) {
      $("#content").hide();
      $("#login").show();
      $("#logout").hide();
      $("#msg").html("<p class='red'>Login failed.  Please try again.</p>");
      $("#content").show(1000);
    }
  });
}

$(function(){
  $(".login").on('click', function(e){
    var w = window.open("/home/?popup=true", "openid_popup", "width=550,height=610,location=1,status=1,resizable=yes");
    var coords = getCenteredCoords(380,120);
    w.moveTo(coords.x, coords.y);
  });
  $(".logout").on('click', function(e){
    $.ajax({
      type: "GET",
      url: "/popup_verify/?logout=true",
      success: function(text){
    	  window.location = "/";
      }
    });
  });	  
});