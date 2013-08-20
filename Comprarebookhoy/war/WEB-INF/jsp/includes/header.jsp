<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>

	<!-- start: Meta -->
	<meta charset="utf-8">
	<c:choose>
	<c:when test="${empty publicacion}">
		<title>Comprar eBook Hoy</title> 
		<meta name="description" content="Compra tu eBook Reader hoy mismo. Consulta nuestros análisis sobre los ebooks de marcas como Sony, Kindle, Kobo y muchas más "/>
		<meta name="keywords" content="Ebook, Reader, EReader, comprar ebook, ebook hoy, comprar kindle" />
		<meta name="title" content="Comprar eBook Hoy - www.comprarebookhoy.com" />
		<meta name="abstract" content="Consulta nuestros análisis y compra tu eBook hoy mismo" />
	</c:when>
		<c:when test="${!empty publicacion}">
		<title>${publicacion.titulo} en Comprar eBook Hoy</title> 
		<meta name="description" content="${publicacion.descripcion}"/>
		<meta name="keywords" content="${publicacion.keywords}" />
		<meta name="title" content="${publicacion.titulo} en Comprar eBooks Hoy. - Comprar eBook Hoy - www.comprarebookhoy.com" />
		<meta name="abstract" content="${publicacion.resumen}" />
	</c:when>
	</c:choose>
	
	
	<meta name="author" content="Jorge Amat"/>
	
	
	
	<meta name="robots" content="index,all" />
	<meta name="revisit-after" content="1 days" />
	<meta name="lang" content="es" />
	<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- end: Mobile Specific -->
	
	<!-- start: Facebook Open Graph -->
	<meta property="og:title" content="Comprar Ebook Hoy"/>
	<meta property="og:description" content="Comprar tu Ebook Reader hoy mismo"/>
	<meta property="og:type" content="Ebook, Reader, EReader, comprar ebook, ebook hoy"/>
	<meta property="og:url" content=""/>
	<meta property="og:image" content=""/>
	<!-- end: Facebook Open Graph -->

    <!-- start: CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/bootstrap-responsive.css" rel="stylesheet">
	<link href="/css/style.css" rel="stylesheet">
	<link href="/css/parallax-slider.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/apprise-v2.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid+Sans:400,700">
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid+Serif">
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Boogaloo">
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Economica:700,400italic">
	<!-- end: CSS -->

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

	<!--[if IE 9]>
      <link href="css/styleie9.css" rel="stylesheet">
    <![endif]-->

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
	            		<ul id="menuSuperior" class="nav">
							<li id="menuInicio">
	                			<a href="/">Inicio</a>
	              			</li>
	              			<li id="menuEbooks"><a href="/ebooks">eBooks</a></li>
							<li class="dropdown">
	                			<a href="#" class="dropdown-toggle" data-toggle="dropdown">Destacados<b class="caret"></b></a>
	                			<ul class="dropdown-menu">
	                  				<li><a href="/ebooks/papyre-HD">Papyre HD</a></li>
									<li><a href="/ebooks/papyre-HD">Kindle 2</a></li>
									<li><a href="/ebooks/papyre-HD">Kindle 3</a></li>
									<li><a href="/ebooks/papyre-HD">Mini Ipad</a></li>
									<li><a href="/ebooks/papyre-HD">Nexu 7</a></li>
	                			</ul>
	              			</li>
	              			<li id="menuAccesorios"><a href="/accesorios">Accesorios</a></li>
	              			<li id="menuBlog"><a href="/blog">Blog</a></li>	              																			
							<li id="menuSobre"><a href="/sobre">Sobre nosotros</a></li>
	              			<li id="menuContacto"><a href="/contacto">Contacto</a></li>
	            		</ul>
	          		</div>
	        	</div>
	      	</div>
			<!--end: Navbar -->
			
		</div>
		<!--end: Container-->			
			
	</header>
	<!--end: Header-->