$(function(){ 
    $("#btnGuardarPubli").live('click', function() {
    	//check name channel is not repeated
//    	if(channelExists){
//    		alert("channel name repeated");
//    		return;
//    	}
    	$.ajax({
		      type: "POST",
		      url: "/edicion/guardarPublicacion",
		      dataType: "html",
		      cache: false,
	          data: {
	        	  "titulo": $("#titulo").val(),
	        	  "descripcion": $("#descripcion").val(),
	        	  "resumen": $("#resumen").val(),
	        	  "articulo": $("#articulo").val(),
	        	  "keywords": $("#keywords").val(),
	        	  "clase1": $("#clase1").val(),
	        	  "clase2": $("#clase2").val()
	          },
		      success: function(text){
//		    	  var nameChn = ($("#nameChannel").val()).replace(/\s/g , "-")
//		    	  $("#startChannel-form").attr("action", "/ch/" + nameChn);
//		    	  $("#nameChannelUpload").val($("#nameChannel").val());
		      }
		    });
    });
});

