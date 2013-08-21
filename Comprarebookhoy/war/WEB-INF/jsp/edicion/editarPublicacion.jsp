<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="es">
<html>
  <head>
    <title>Editar Publicacion (solo articulo de momento)</title>
    
     <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/bootstrap-responsive.css" rel="stylesheet">
	<link href="/css/style.css" rel="stylesheet">
	<link href="/css/parallax-slider.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid+Sans:400,700">
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid+Serif">
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Boogaloo">
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Economica:700,400italic">
            <!--blur slidShow -->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <!-- Fav and touch icons -->
		<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
		<link rel="stylesheet" href="/css/apprise-v2.css" type="text/css" />
    <meta name="description" content="Subida de archivos y herramienta de edicion para Comprar eBook Hoy">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<style>
			.ui-autocomplete-loading { background: white url('/img/fancybox_loading.gif') right center no-repeat; }
		</style>
		<link rel="stylesheet" href="/css/bootstrap-image-gallery.min.css">
		<link rel="stylesheet" href="/css/jquery.fileupload-ui.css">
		<!-- CSS adjustments for browsers with JavaScript disabled -->
		<noscript><link rel="stylesheet" href="/css/jquery.fileupload-ui-noscript.css"></noscript>
		<!-- Shim to make HTML5 elements usable in older Internet Explorer versions -->
		<!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
  </head>

  <body>
	
	<!--start: Header -->
	<header>
		
		<!--start: Container -->
		<div class="container">
			
			<!--start: Navbar -->
			<div class="navbar navbar-inverse">
	    		<div class="navbar-inner">
	          		<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
	            		<span class="icon-bar"></span>
	            		<span class="icon-bar"></span>
	            		<span class="icon-bar"></span>
	          		</a>
					<a class="brand" href="/"><i class="ico-book-open circle"></i>Comprar eBook <span>Hoy</span>.</a>
	          		<div class="nav-collapse collapse">
	            		<ul class="nav">
							<li class="active">
	                			<a href="/">Home</a>
	              			</li>

	            		</ul>
	          		</div>
	        	</div>
	      	</div>
			<!--end: Navbar -->
			
		</div>
		<!--end: Container-->			
			
	</header>
	<!--end: Header-->
<br><br>


	<!--start: Wrapper -->
	<div id="wrapper">
				
		<!--start: Container -->
    	<div class="container">
<form method="GET" action="/edicion/cargarPublicacion">   
    	<h2><i class="ico-keynote ico-white"></i><a id="logout" href="#" class="btn logout">Logout</a></h2>
 Tipo: <select name="tipo" id="tipo">
				  <option value="AR">Articulo</option>
				  <option value="EB">eBook</option>
				  <option value="AC">Accesorio</option>
				</select><br><br>
Autor: <input type="text" style="width: 433px;" id="autor" name="autor" size="25" maxlength="50"><br><br>				
Titulo: <input type="text" style="width: 433px;" id="titulo" name="titulo" size="70" maxlength="70"><br><br>
<input type="submit" value="Cargar"/>
</form>



<form method="POST" action="/edicion/guardarEdicionPublicacion">
Titulo2: <input type="text" style="width: 433px;" id="titulo2" name="titulo2" size="120" maxlength="120"><br><br>
Keywords: <input type="text" style="width: 433px;"id="keywords" name="keywords" size="150" maxlength="150">
<br><br>
Descripcion: <input type="text" style="width: 633px;" id="descripcion" name="descripcion" size="160" maxlength="160">
<br><br>
Clase1: <select id="clase1" name="clase1">
				  <option value=""></option>
				  <option value="Novedades">Novedades</option>
				  <option value="Sony">Sony</option>
				  <option value="Energy Sistem">Energy Sistem</option>
				  <option value="Wolder">Wolder</option>
				  <option value="Woxter">Woxter</option>
				  <option value="Papyre">Papyre</option>
				  <option value="Otros">Otros</option>
				</select>
Clase2: <select id="clase2" name="clase2">
				  <option value=""></option>
				  <option value="Novedades">Novedades</option>
				  <option value="Sony">Sony</option>
				  <option value="Energy Sistem">Energy Sistem</option>
				  <option value="Wolder">Wolder</option>
				  <option value="Woxter">Woxter</option>
				  <option value="Papyre">Papyre</option>
				  <option value="Otros">Otros</option>
				</select>				
<br><br>
Resumen<br>
<textarea style="width: 833px;" rows="10" id="resumen" name="resumen"></textarea>
<br><br>
Articulo
<br>
<textarea style="width: 833px;" rows="40" id="articulo" name="articulo" value="${publicacion.articulo}"></textarea>
<br><br>
Script: <input type="text"  id="script" name="script" size="100" maxlength="200"><br><br>				
Script2: <input type="text" id="script2" name="script2" size="100" maxlength="200"><br><br>
<table width="50%" border="0" align="center" cellpadding="10" cellspacing="0">
<tr>
<td><div align="center">
<input type="submit" value="Guardar">
</div></td>
</tr>
</table>
</form>


</div>
</div>


<%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>

</body>
</html>		