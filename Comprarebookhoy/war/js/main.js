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
	        	  "clase2": $("#clase2").val(),
	        	  "tipo": $("#tipo").val(),
	        	  "autor": $("#autor").val(),
	        	  "titulo2": $("#titulo2").val(),
	        	  "script": $("#script").val(),
	        	  "script2": $("#script2").val(),
	        	  "disponible": $("#disponible").val()
	          },
		      success: function(text){
//		    	  var nameChn = ($("#nameChannel").val()).replace(/\s/g , "-")
//		    	  $("#startChannel-form").attr("action", "/ch/" + nameChn);
//		    	  $("#nameChannelUpload").val($("#nameChannel").val());
		      }
		    });
    });
});

$(function(){ 
    $("#btnGuardarIrFotos").live('click', function() {
    	//check name channel is not repeated
//    	if(channelExists){
//    		alert("channel name repeated");
//    		return;
//    	}
    	$.ajax({
		      type: "POST",
		      url: "/edicion/guardarEdicionFotosPub",
		      dataType: "html",
		      cache: false,
	          data: {
	        	  "titulo": $("#titulo").val(),
	        	  "articulo": $("#articulo").val(),
	        	  "tipo": $("#tipo").val()
	          },
		      success: function(text){
//		    	  var nameChn = ($("#nameChannel").val()).replace(/\s/g , "-")
//		    	  $("#startChannel-form").attr("action", "/ch/" + nameChn);
//		    	  $("#nameChannelUpload").val($("#nameChannel").val());
		      }
		    });
    });
});



function validateEmail(email) {   
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

//function validarEmail(){
//	  var email = $("#newsletter_input").val();
//	  if (validateEmail(email)) {
//		alert("Gracias por suscribirte a nuestras noticias");
//	    return true;
//	  } else {
//	    alert("Por favor, introduce un email correcto");
//	  }
//	  return false;
//	}

function validarEmail(){
	  var email = $("#newsletter_input").val();
	  if (validateEmail(email)) {
    	$.ajax({
		      type: "POST",
		      url: "/suscribir",
		      dataType: "html",
		      cache: false,
	          data: {
	        	  "email": $("#newsletter_input").val()
	          },
		      success: function(text){
		    	  Apprise("Gracias por suscribirte a nuestras publicaciones!");
		    	  $("#newsletter_input").val("");
		      }
		    });
    }else {
	    alert("Por favor, introduce un email correcto");
	  }
}

function validarComentarios(){
	  var email = $("#comEmail").val();
	  if (!validateEmail(email)) {  
	    alert("Por favor, introduce un email correcto");
	    return false;
	  }
	  if($("#comNombre").val() =="" || $("#comComentario").val() == ""){
		  alert("Por favor, rellena los campos obligatorios (*)");
		  return false;
	  }
	  return true;
}


$(function(){ 
    $("#btnContact").on('click', function() {
	  var email = $("#emailContact").val();
	  if (validateEmail(email)) {
	  	  $.ajax({
			      type: "POST",
			      url: "/contactar",
			      dataType: "html",
			      cache: false,
		          data: {
		        	  "email": $("#emailContact").val(),
		        	  "name": $("#nameContact").val(),
		        	  "message": $("#messageContact").val()
		          },
			      success: function(text){
			    	  Apprise("Hemos recibido tu mensaje. Te responderemos en cuanto nos sea posible. Gracias!");
			    	  $("#newsletter_input").val("");
			    	  $("#emailContact").val("");
			    	  $("#nameContact").val("");
			    	  $("#messageContact").val("");
			      }
			    });
	  }else {
		    alert("Por favor, introduce un email correcto");
		  }
	    });
});

function replyComment(nbrComment){
	$("#nbrComment").val(nbrComment);
}

