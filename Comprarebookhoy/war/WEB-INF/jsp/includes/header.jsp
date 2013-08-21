<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>

	<!-- start: Meta -->
	<meta charset="utf-8">
	<c:choose>
		<c:when test="${!empty publicacion}">
		<title>${publicacion.titulo} en Comprar eBook Hoy</title> 
		<meta name="description" content="${publicacion.descripcion}"/>
		<meta name="keywords" content="${publicacion.keywords}" />
		<meta name="title" content="${publicacion.titulo} en Comprar eBooks Hoy. - Comprar eBook Hoy - www.comprarebookhoy.com" />
	</c:when>
	<c:when test="${fn:contains(pageContext.request.requestURI, 'extras')}">
		<title>Extras en Comprar eBook Hoy</title> 
		<meta name="description" content="Accede a todos los extras para tu eBook como fundas para protegerlo, adaptadores de corriente ó luces de lectura"/>
		<meta name="keywords" content="extras ebook, accesorios ebook, adaptador corriente, luz lectura, funda kindle, funda ebook, funda lector ebook, funda ereader" />
		<meta name="title" content="Extras en Comprar eBooks Hoy. - Comprar eBook Hoy - www.comprarebookhoy.com" />
	</c:when>
	<c:when test="${fn:contains(pageContext.request.requestURI, 'sobre')}">
		<title>Sobre Nosotros y Comprar eBook Hoy</title> 
		<meta name="description" content="Toda la información sobre los que trabajamos en Comprar eBook Hoy, su experiencia y valores profesionales"/>
		<meta name="keywords" content="sobre nosotros ebooks, sobre ebooks, nosotros ebook, sobre kindle, sobre fundas ebook, sobre ereaders, sobre lectores de ebook" />
		<meta name="title" content="Sobre Nosotros en Comprar eBooks Hoy. - Comprar eBook Hoy - www.comprarebookhoy.com" />
	</c:when>
	<c:when test="${fn:contains(pageContext.request.requestURI, 'contacto')}">
		<title>Contacta con Comprar eBook Hoy</title> 
		<meta name="description" content="Contacta con los que trabajamos en Comprar eBook Hoy"/>
		<meta name="keywords" content="contacta nosotros ebooks, contacta ebooks, contacta ebook, contacta kindle, contacta fundas ebook, contacta ereaders, contacta lectores de ebook" />
		<meta name="title" content="Contacta en Comprar eBooks Hoy. - Comprar eBook Hoy - www.comprarebookhoy.com" />
	</c:when>
	<c:otherwise>
		<title>Bienvenido a Comprar eBook Hoy</title> 
		<meta name="description" content="Busca y encuentra tu eBook favorito, análisis de todos los lectores de eBooks y los mejores eReaders al mejor precio. Accede a la mejor información sobre eBooks"/>
		<meta name="keywords" content="ebook, lector ebook, ereader, kindle, fundas ebook, ereaders mejor precio, kindle paperwhite, sony ebooks, mini ipad, woxter ebooks, wolter ebooks" />
		<meta name="title" content="Lectores de eBooks en Comprar eBooks Hoy. - Comprar eBook Hoy - www.comprarebookhoy.com" />
	</c:otherwise>		
	</c:choose>
	
	
	<meta name="author" content="Comprar eBook Hoy"/>
	
	
	
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
	              			<li id="menuExtras"><a href="/extras">Extras</a></li>
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