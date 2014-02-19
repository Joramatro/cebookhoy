<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>

	<!-- start: Meta -->
	<meta charset="utf-8">
	<meta name="robots" content="index,all" />
	<meta name="revisit-after" content="1 days" />
	<meta name="lang" content="es" />
		<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->
	<c:choose>
	<c:when test="${!empty publicacion && publicacion.tipo eq 'EB'}">
		<title>${publicacion.titulo} en análisis y online en Comprar eBook Hoy</title> 
		<meta name="description" content="${publicacion.descripcion} en Comprar eBook Hoy"/>
		<meta name="author" content="Jorge Amat" />
		<meta name="copyright" content="Comprar eBook Hoy" />
		<meta name="application-name" content="${publicacion.titulo} en Comprar eBook Hoy" />
		<!-- start: Facebook Open Graph -->
		<meta property="og:title" content="${publicacion.titulo} en análisis y online en Comprar eBook Hoy"/>
		<meta property="og:description" content="${publicacion.descripcion} en Comprar eBook Hoy"/>
		<meta property="og:type" content="ebooks"/>
		<meta property="og:url" content="http://www.comprarebookhoy.com/ebooks/${publicacion.url}"/>
		<meta property="og:image" content="${publicacion.lImages[0]}"/>
		<meta property="og:email" content="hola@comprarebookhoy.com"/>
		<!-- end: Facebook Open Graph -->
		<!-- start: Twitter tags -->
		<meta name="twitter:card" content="summary_large_image">
		<meta name="twitter:site" content="@ComprarHoy">
		<meta name="twitter:creator" content="@Jorge_Amat1">
		<meta name="twitter:title" content="${publicacion.titulo}">
		<meta name="twitter:description" content="${publicacion.descripcion}">
		<meta name="twitter:image" content="${publicacion.lImages[0]}">
		<meta name="twitter:domain" content="comprarebookhoy.com">
		<!-- end: Twitter tags -->
		<link rel=”canonical” href=”http://www.comprarebookhoy.com/ebooks/${publicacion.url}“/>
	</c:when>
	<c:when test="${!empty publicacion && publicacion.tipo eq 'AR'}">
		<title>${publicacion.titulo} en Comprar eBook Hoy</title> 
		<meta name="description" content="${publicacion.descripcion}"/>
		<meta name="author" content="Jorge Amat" />
		<meta name="copyright" content="Comprar eBook Hoy" />
		<meta name="application-name" content="${publicacion.titulo} en Comprar eBook Hoy" />
		<!-- start: Facebook Open Graph -->
		<meta property="og:title" content="${publicacion.titulo}"/>
		<meta property="og:description" content="${publicacion.descripcion}"/>
		<meta property="og:type" content="articulos"/>
		<meta property="og:url" content="http://www.comprarebookhoy.com/blog/${publicacion.url}"/>
		<meta property="og:image" content="${publicacion.lImages[0]}"/>
		<meta property="og:email" content="hola@comprarebookhoy.com"/>
		<!-- end: Facebook Open Graph -->
		<!-- start: Twitter tags -->
		<meta name="twitter:card" content="summary_large_image">
		<meta name="twitter:site" content="@ComprarHoy">
		<meta name="twitter:creator" content="@Jorge_Amat1">
		<meta name="twitter:title" content="${publicacion.titulo}">
		<meta name="twitter:description" content="${publicacion.descripcion}">
		<meta name="twitter:image" content="${publicacion.lImages[0]}">
		<meta name="twitter:domain" content="comprarebookhoy.com">
		<!-- end: Twitter tags -->
		<link rel=”canonical” href=”http://www.comprarebookhoy.com/blog/${publicacion.url}“/>
	</c:when>	
	<c:when test="${fn:contains(pageContext.request.requestURI, 'extras')}">
		<title>Extras y accesorios online para tu ebook reader en Comprar eBook Hoy</title> 
		<meta name="description" content="Accede a todos los extras para comprar online accesorios a tu ebook reader como fundas Kindle, Kobo, Sony, BQ, Barnes & Nobles, Papyre y otras grandes marcas para protegerlo, adaptadores de corriente ó luces de lectura"/>
		<meta name="author" content="Jorge Amat" />
		<meta name="copyright" content="Comprar eBook Hoy" />
		<meta name="application-name" content="Extras en Comprar eBook Hoy" />
		<!-- start: Facebook Open Graph -->
		<meta property="og:title" content="Extras y accesorios online para tu ebook reader en Comprar eBook Hoy"/>
		<meta property="og:description" content="Accede a todos los extras para comprar online accesorios a tu ebook reader como fundas Kindle, Kobo, Sony, BQ, Barnes & Nobles, Papyre y otras grandes marcas para protegerlo, adaptadores de corriente ó luces de lectura"/>
		<meta property="og:type" content="extras"/>
		<meta property="og:url" content="http://www.comprarebookhoy.com/extras"/>
		<meta property="og:image" content="${publicaciones[0].lImages[0]}"/>
		<meta property="og:email" content="hola@comprarebookhoy.com"/>
		<!-- end: Facebook Open Graph -->
		<!-- start: Twitter tags -->
		<meta name="twitter:card" content="summary_large_image">
		<meta name="twitter:site" content="@ComprarHoy">
		<meta name="twitter:creator" content="@ComprarHoy">
		<meta name="twitter:title" content="Extras en Comprar eBook Hoy">
		<meta name="twitter:description" content="Accede a todos los extras para comprar accesorios a tu ebook como fundas Kindle, Kobo, Sony, BQ, Barnes & Nobles, Papyre y otras grandes marcas para protegerlo, adaptadores de corriente ó luces de lectura">
		<meta name="twitter:image" content="${publicaciones[0].lImages[0]}">
		<meta name="twitter:domain" content="comprarebookhoy.com">
		<!-- end: Twitter tags -->		
		<link rel=”canonical” href=”http://www.comprarebookhoy.com/extras“/>
	</c:when>
	<c:when test="${fn:contains(pageContext.request.requestURI, 'sobre')}">
		<title>Sobre Nosotros y Comprar eBook Hoy</title> 
		<meta name="description" content="Toda la información sobre los que trabajamos en Comprar eBook Hoy, su experiencia y valores profesionales"/>
		<meta name="author" content="Jorge Amat" />
		<meta name="copyright" content="Comprar eBook Hoy" />
		<meta name="application-name" content="Sobre Nosotros en Comprar eBook Hoy" />
		<!-- start: Facebook Open Graph -->
		<meta property="og:title" content="Sobre Nosotros en Comprar eBook Hoy"/>
		<meta property="og:description" content="Toda la información sobre los que trabajamos en Comprar eBook Hoy, su experiencia y valores profesionales"/>
		<meta property="og:type" content="sobre"/>
		<meta property="og:url" content="http://www.comprarebookhoy.com/sobre"/>
		<meta property="og:image" content="/img/img-meta/logoGrande.jpg"/>
		<meta property="og:email" content="hola@comprarebookhoy.com"/>
		<!-- end: Facebook Open Graph -->
		<!-- start: Twitter tags -->
		<meta name="twitter:card" content="summary_large_image">
		<meta name="twitter:site" content="@ComprarHoy">
		<meta name="twitter:creator" content="@Jorge_Amat1">
		<meta name="twitter:title" content="Sobre nosotros en Comprar eBook Hoy">
		<meta name="twitter:description" content="Toda la información sobre los que trabajamos en Comprar eBook Hoy, su experiencia y valores profesionales">
		<meta name="twitter:image" content="/img/img-meta/logoGrande.jpg">
		<meta name="twitter:domain" content="comprarebookhoy.com">
		<!-- end: Twitter tags -->
		<link rel=”canonical” href=”http://www.comprarebookhoy.com/sobre“/>	
	</c:when>
	<c:when test="${fn:contains(pageContext.request.requestURI, 'contacta')}">
		<title>Contacta con Comprar eBook Hoy</title> 
		<meta name="description" content="Contacta con los que trabajamos en Comprar eBook Hoy"/>
		<meta name="author" content="Jorge Amat" />
		<meta name="copyright" content="Comprar eBook Hoy" />
		<meta name="application-name" content="Contacto en Comprar eBook Hoy" />
		<!-- start: Facebook Open Graph -->
		<meta property="og:title" content="Contacta en Comprar eBook Hoy"/>
		<meta property="og:description" content="Contacta con los que trabajamos en Comprar eBook Hoy"/>
		<meta property="og:type" content="contacto"/>
		<meta property="og:url" content="http://www.comprarebookhoy.com/contacto"/>
		<meta property="og:image" content="/img/img-meta/logoGrande.jpg"/>
		<meta property="og:email" content="hola@comprarebookhoy.com"/>
		<!-- end: Facebook Open Graph -->
		<!-- start: Twitter tags -->
		<meta name="twitter:card" content="summary_large_image">
		<meta name="twitter:site" content="@ComprarHoy">
		<meta name="twitter:creator" content="@Jorge_Amat1">
		<meta name="twitter:title" content="Contacta con nosotros en Comprar eBook Hoy">
		<meta name="twitter:description" content="Contacta con los que trabajamos en Comprar eBook Hoy">
		<meta name="twitter:image" content="/img/img-meta/logoGrande.jpg">
		<meta name="twitter:domain" content="comprarebookhoy.com">
		<!-- end: Twitter tags -->
		<link rel=”canonical” href=”http://www.comprarebookhoy.com/contacto“/>
	</c:when>
	
	<c:when test="${fn:contains(pageContext.request.requestURI, 'ebooks') && not empty param.filtro}">
		<title>eBooks, precios y análisis de los mejores ereaders de <%= request.getParameter("filtro").replaceAll("-"," ") %> en Comprar eBook Hoy</title> 
		<meta name="description" content="Análisis y precios de los mejores eBook readers de <%= request.getParameter("filtro").replaceAll("-"," ") %> para que puedas comprar online el libro electrónico más adecuado a tus necesidades"/>
		<meta name="author" content="Jorge Amat" />
		<meta name="copyright" content="Comprar eBook Hoy" />
		<meta name="application-name" content="eBooks en Comprar eBook Hoy" />
		<!-- start: Facebook Open Graph -->
		<meta property="og:title" content="eBooks, precios y análisis de los mejores ereaders de <%= request.getParameter("filtro").replaceAll("-"," ") %> en Comprar eBook Hoy"/>
		<meta property="og:description" content="Análisis y precios de los mejores eBook readers de <%= request.getParameter("filtro").replaceAll("-"," ") %> para que puedas comprar online el libro electrónico más adecuado a tus necesidades"/>
		<meta property="og:type" content="ebook"/>
		<meta property="og:url" content="http://www.comprarebookhoy.com/ebooks"/>
		<c:if test="${!empty publicaciones}">
			<c:if test="${!empty publicaciones[0].lImages}">
				<meta property="og:image" content="${publicaciones[0].lImages[0]}"/>
			</c:if>
		</c:if>
		<meta property="og:email" content="hola@comprarebookhoy.com"/>
		<!-- end: Facebook Open Graph -->
		<!-- start: Twitter tags -->
		<meta name="twitter:card" content="summary_large_image">
		<meta name="twitter:site" content="@ComprarHoy">
		<meta name="twitter:creator" content="@ComprarHoy">
		<meta property="twitter:title" content="eBooks, precios y análisis de los mejores ereaders de <%= request.getParameter("filtro").replaceAll("-"," ") %> en Comprar eBook Hoy"/>
		<meta property="twitter:description" content="Análisis y precios de los mejores eBook readers de <%= request.getParameter("filtro").replaceAll("-"," ") %> para que puedas comprar online el libro electrónico más adecuado a tus necesidades"/>		<c:if test="${!empty publicaciones}">
			<c:if test="${!empty publicaciones[0].lImages}">
				<meta name="twitter:image" content="${publicaciones[0].lImages[0]}">
			</c:if>
		</c:if>
		<meta name="twitter:domain" content="comprarebookhoy.com">
		<link rel=”canonical” href=”http://www.comprarebookhoy.com/ebooks“/>
		<!-- end: Twitter tags -->		
	</c:when>	
	
	<c:when test="${fn:contains(pageContext.request.requestURI, 'ebooks')}">
		<title>eBooks, precios y análisis de los mejores ereaders en Comprar eBook Hoy</title> 
		<meta name="description" content="Análisis y precios de los mejores eBook readers en la actualidad para que puedas comprar online tu libro electrónico Kindle, Kobo, Sony, BQ, Barnes & Nobles, Papyre y otras grandes marcas y comparar"/>
		<meta name="author" content="Jorge Amat" />
		<meta name="copyright" content="Comprar eBook Hoy" />
		<meta name="application-name" content="eBooks en Comprar eBook Hoy" />
		<!-- start: Facebook Open Graph -->
		<meta property="og:title" content="Análisis de eBooks para comprar tu ebook online y poder comparar precios"/>
		<meta property="og:description" content="Análisis y precios de los mejores eBook readers en la actualidad para que puedas comprar online tu libro electrónico Kindle, Kobo, Sony, BQ, Barnes & Nobles, Papyre y otras grandes marcas y comparar"/>
		<meta property="og:type" content="ebook"/>
		<meta property="og:url" content="http://www.comprarebookhoy.com/ebooks"/>
		<c:if test="${!empty publicaciones}">
			<c:if test="${!empty publicaciones[0].lImages}">
				<meta property="og:image" content="${publicaciones[0].lImages[0]}"/>
			</c:if>
		</c:if>
		<meta property="og:email" content="hola@comprarebookhoy.com"/>
		<!-- end: Facebook Open Graph -->
		<!-- start: Twitter tags -->
		<meta name="twitter:card" content="summary_large_image">
		<meta name="twitter:site" content="@ComprarHoy">
		<meta name="twitter:creator" content="@ComprarHoy">
		<meta name="twitter:title" content="Análisis y precios de eBooks para comprar tu ebook favorito en Comprar eBook Hoy">
		<meta name="twitter:description" content="Análisis y precios de los mejores lectores de ebooks en la actualidad para que puedas comprar tu ebook Kindle, Kobo, Sony, BQ, Barnes & Nobles, Papyre y otras grandes marcas y compararlos">
		<c:if test="${!empty publicaciones}">
			<c:if test="${!empty publicaciones[0].lImages}">
				<meta name="twitter:image" content="${publicaciones[0].lImages[0]}">
			</c:if>
		</c:if>
		<meta name="twitter:domain" content="comprarebookhoy.com">
		<link rel=”canonical” href=”http://www.comprarebookhoy.com/ebooks“/>
		<!-- end: Twitter tags -->		
	</c:when>
	
	<c:when test="${fn:contains(pageContext.request.requestURI, 'blog') && not empty param.filtro}">
		<title>Artículos de tipo <%= request.getParameter("filtro").replaceAll("-"," ") %> sobre eReaders en Comprar eBook Hoy</title> 
		<meta name="description" content="Opinión y artículos de tipo <%= request.getParameter("filtro").replaceAll("-"," ") %> en nuestro blog de los mejores eBook readers en la actualidad para que puedas elegir mejor y comprar tu ebook"/>
		<meta name="author" content="Jorge Amat" />
		<meta name="copyright" content="Comprar eBook Hoy" />
		<meta name="application-name" content="Blog en Comprar eBook Hoy" />
		<!-- start: Facebook Open Graph -->
		<meta property="og:title" content="Artículos de tipo <%= request.getParameter("filtro").replaceAll("-"," ") %> sobre eReaders en Comprar eBook Hoy"/>
		<meta property="og:description" content="Opinión y artículos de tipo <%= request.getParameter("filtro").replaceAll("-"," ") %> en nuestro blog de los mejores eBook readers en la actualidad para que puedas elegir mejor y comprar tu ebook"/>
		<meta property="og:type" content="articulo"/>
		<meta property="og:url" content="http://www.comprarebookhoy.com/blog"/>
		<c:if test="${!empty publicaciones}">
			<c:if test="${!empty publicaciones[0].lImages}">
				<meta property="og:image" content="${publicaciones[0].lImages[0]}"/>
			</c:if>
		</c:if>
		<meta property="og:email" content="hola@comprarebookhoy.com"/>
		<!-- end: Facebook Open Graph -->
		<!-- start: Twitter tags -->
		<meta name="twitter:card" content="summary_large_image">
		<meta name="twitter:site" content="@ComprarHoy">
		<meta name="twitter:creator" content="@ComprarHoy">
		<meta property="twitter:title" content="Artículos de tipo <%= request.getParameter("filtro").replaceAll("-"," ") %> sobre eReaders en Comprar eBook Hoy"/>
		<meta property="twitter:description" content="Opinión y artículos de tipo <%= request.getParameter("filtro").replaceAll("-"," ") %> en nuestro blog de los mejores eBook readers en la actualidad para que puedas elegir mejor y comprar tu ebook"/>
		<c:if test="${!empty publicaciones}">
			<c:if test="${!empty publicaciones[0].lImages}">
				<meta name="twitter:image" content="${publicaciones[0].lImages[0]}">
			</c:if>
		</c:if>
		<meta name="twitter:domain" content="comprarebookhoy.com">
		<!-- end: Twitter tags -->
		<link rel=”canonical” href=”http://www.comprarebookhoy.com/blog“/>		
	</c:when>
	
	<c:when test="${fn:contains(pageContext.request.requestURI, 'blog')}">
		<title>Artículos y opinión sobre eReaders en Comprar eBook Hoy</title> 
		<meta name="description" content="Opinión y artículos en nuestro blog de los mejores eBook readers en la actualidad para que puedas comprar tu ebook Kindle, Kobo, Sony, BQ, Barnes & Nobles, Papyre y otras grandes marcas"/>
		<meta name="author" content="Jorge Amat" />
		<meta name="copyright" content="Comprar eBook Hoy" />
		<meta name="application-name" content="Blog en Comprar eBook Hoy" />
		<!-- start: Facebook Open Graph -->
		<meta property="og:title" content="Artículos y opinión sobre eReaders en Comprar eBook Hoy"/>
		<meta property="og:description" content="Opinión y artículos en nuestro blog de los mejores eBook readers en la actualidad para que puedas comprar tu ebook de tinta electrónica Kindle, Kobo, Sony, BQ, Barnes & Nobles, Papyre y otras grandes marcas"/>
		<meta property="og:type" content="articulo"/>
		<meta property="og:url" content="http://www.comprarebookhoy.com/blog"/>
		<c:if test="${!empty publicaciones}">
			<c:if test="${!empty publicaciones[0].lImages}">
				<meta property="og:image" content="${publicaciones[0].lImages[0]}"/>
			</c:if>
		</c:if>
		<meta property="og:email" content="hola@comprarebookhoy.com"/>
		<!-- end: Facebook Open Graph -->
		<!-- start: Twitter tags -->
		<meta name="twitter:card" content="summary_large_image">
		<meta name="twitter:site" content="@ComprarHoy">
		<meta name="twitter:creator" content="@ComprarHoy">
		<meta name="twitter:title" content="Opinión y artículos sobre ereaders para comprar tu ebook preferido">
		<meta name="twitter:description" content="Opinión y artículos en nuestro blog de los mejores lectores de eBooks en la actualidad para que puedas comprar tu ebook Kindle, Kobo, Sony, BQ, Barnes & Nobles, Papyre y otras grandes marcas">
		<c:if test="${!empty publicaciones}">
			<c:if test="${!empty publicaciones[0].lImages}">
				<meta name="twitter:image" content="${publicaciones[0].lImages[0]}">
			</c:if>
		</c:if>
		<meta name="twitter:domain" content="comprarebookhoy.com">
		<!-- end: Twitter tags -->
		<link rel=”canonical” href=”http://www.comprarebookhoy.com/blog“/>		
	</c:when>
	<c:when test="${fn:contains(pageContext.request.requestURI, 'privacidad')}">
		<title>Política de privacidad de Comprar eBook Hoy</title> 
		<meta name="description" content="Política de privacidad y condiciones de uso de Comprar eBook Hoy"/>
		<meta name="author" content="Jorge Amat" />
		<meta name="copyright" content="Comprar eBook Hoy" />
		<meta name="application-name" content="Política privacidad Comprar eBook Hoy" />
		<!-- start: Facebook Open Graph -->
		<meta property="og:title" content="Política de privacidad de Comprar eBook Hoy"/>
		<meta property="og:description" content="Política de privacidad y condiciones de uso de Comprar eBook Hoy"/>
		<meta property="og:url" content="http://www.comprarebookhoy.com/politica-de-privacidad"/>
		<meta property="og:email" content="hola@comprarebookhoy.com"/>
		<!-- end: Facebook Open Graph -->
		<!-- start: Twitter tags -->
		<meta name="twitter:card" content="summary_large_image">
		<meta name="twitter:site" content="@ComprarHoy">
		<meta name="twitter:creator" content="@ComprarHoy">
		<meta name="twitter:title" content="Política de privacidad de Comprar eBook Hoy">
		<meta name="twitter:description" content="Política de privacidad y condiciones de uso de Comprar eBook Hoy">
		<meta name="twitter:domain" content="comprarebookhoy.com">
		<link rel=”canonical” href=”http://www.comprarebookhoy.com/politica-de-privacidad“/>
		<!-- end: Twitter tags -->		
	</c:when>	
	<c:otherwise>
		<title>Bienvenido a Comprar eBook Hoy - Análisis y opinión sobre los mejores eReaders para comprar online</title> 
		<meta name="description" content="Analizamos los mejores lectores de ebooks del mercado para que puedas comprar tu ebook reader preferido al mejor precio y online. Los mejores libros electrónicos Kindle, Kobo, Sony, BQ, Barnes & Nobles, Papyre y otras grandes marcas"/>
		<meta name="author" content="Jorge Amat" />
		<meta name="copyright" content="Comprar eBook Hoy" />
		<meta name="application-name" content="eBook Readers en Comprar eBook Hoy" />
		<!-- start: Facebook Open Graph -->
		<meta property="og:title" content="Comprar eBook Hoy - Análisis y opinión sobre los mejores eReaders para comprar online"/>
		<meta property="og:description" content="Analizamos los mejores lectores de ebooks del mercado para que puedas comprar tu ebook reader preferido al mejor precio y online. Los mejores libros electrónicos Kindle, Kobo, Sony, BQ, Barnes & Nobles, Papyre y otras grandes marcas"/>
		<meta property="og:type" content="principal"/>
		<meta property="og:url" content="http://www.comprarebookhoy.com"/>
		<meta property="og:image" content="/img/img-meta/logoGrande.jpg"/>
		<meta property="og:email" content="hola@comprarebookhoy.com"/>
		<!-- end: Facebook Open Graph -->
		<!-- start: Twitter tags -->
		<meta name="twitter:card" content="summary_large_image">
		<meta name="twitter:site" content="@ComprarHoy">
		<meta name="twitter:creator" content="@ComprarHoy">
		<meta name="twitter:title" content="eReaders en Comprar eBook Hoy online">
		<meta name="twitter:description" content="Analizamos los mejores lectores de ebooks del mercado para que puedas comprar tu ebook reader preferido al mejor precio y online. Los mejores libros electrónicos Kindle, Kobo, Sony, BQ, Barnes & Nobles, Papyre y otras grandes marcas">
		<meta name="twitter:image" content="/img/img-meta/logoGrande.jpg">
		<meta name="twitter:domain" content="comprarebookhoy.com">
		<!-- end: Twitter tags -->				
		<link rel=”canonical” href=”http://www.comprarebookhoy.com“/>
	</c:otherwise>		
	</c:choose>
	<link rel="alternate" type="application/rss+xml" title="Comprar eBook Hoy RSS Feed" href="http://www.comprarebookhoy.com/rssfeed" />
	<link rel="author" href="https://plus.google.com/+JorgeAmat" />
	<link rel="publisher" href="https://www.google.com/+Comprarebookhoy" />
	<style>
	@font-face {
	  font-family: 'Droid Sans';
	  font-style: normal;
	  font-weight: 400;
	  src: local('Droid Sans'), local('DroidSans'), url(http://themes.googleusercontent.com/static/fonts/droidsans/v3/s-BiyweUPV0v-yRb-cjciBsxEYwM7FgeyaSgU71cLG0.woff) format('woff');
	}
	@font-face {
	  font-family: 'Droid Sans';
	  font-style: normal;
	  font-weight: 700;
	  src: local('Droid Sans Bold'), local('DroidSans-Bold'), url(http://themes.googleusercontent.com/static/fonts/droidsans/v3/EFpQQyG9GqCrobXxL-KRMQFhaRv2pGgT5Kf0An0s4MM.woff) format('woff');
	}
	</style>
    <!-- start: CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="/css/parallax-slider.css" rel="stylesheet">   
	<%@ include file="/WEB-INF/jsp/includes/styles.jsp"%>
	<!-- end: CSS -->

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
	  ga('create', 'UA-43441645-1', 'comprarebookhoy.com');
	  ga('send', 'pageview');
	
	</script>
</head>
<body>
	
	<!--start: Header -->
	<header>
		
		<!--start: Container -->
		<div class="container">
			<%-- <div>
				<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- includes ch -->
				<ins class="adsbygoogle"
				     style="display:inline-block;width:970px;height:90px"
				     data-ad-client="ca-pub-3168560600423825"
				     data-ad-slot="2942822544"></ins>
				<script>
				(adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>--%>
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
	            		<ul id="menuSuperior" class="nav" style="margin-right:-30px;">
							<li id="menuInicio">
	                			<a onClick="ga('send', 'event', 'Menu Superior', 'Menu Inicio', 'Inicio');" href="/">Inicio</a>
	              			</li>
	              			<li id="menuEbooks"><a onClick="ga('send', 'event', 'Menu Superior', 'Menu eBooks', 'eBooks');" title="eBooks" href="/ebooks">eBooks</a></li>
							<li class="dropdown">
	                			<a href="#" class="dropdown-toggle" data-toggle="dropdown">Destacados<b class="caret"></b></a>
	                			<ul class="dropdown-menu">
	                				<c:forEach var="publicacion" items="${publicacionesDestacadas}" varStatus="status" end="5">
										<c:choose>
											<c:when test="${publicacion.tipo eq 'EB' }">
												<li><a onClick="ga('send', 'event', 'Menu Superior', '${publicacion.titulo}', 'Destacados');" title="${publicacion.titulo}" href="/ebooks/${publicacion.url}">${publicacion.titulo}</a></li>
											</c:when>	
											<c:otherwise>
												<li><a onClick="ga('send', 'event', 'Menu Superior', '${publicacion.titulo}', 'Destacados');" title="${publicacion.titulo}" href="/blog/${publicacion.url}">${publicacion.titulo}</a></li>
											</c:otherwise>
										</c:choose>										
	                  				</c:forEach>	                					                  				
								</ul>
	              			</li>
	              			<li id="menuExtras"><a onClick="ga('send', 'event', 'Menu Superior', 'Menu Extras', 'Extras');"  title="Extras" href="/extras">Extras</a></li>
	              			<li id="menuBlog"><a onClick="ga('send', 'event', 'Menu Superior', 'Menu Blog', 'Blog');" title="Blog" href="/blog">Blog</a></li>	              																			
							<li id="menuSobre"><a onClick="ga('send', 'event', 'Menu Superior', 'Menu Sobre', 'Sobre');" title="Sobre" href="/sobre">Sobre nosotros</a></li>
	              			<li id="menuContacto"><a onClick="ga('send', 'event', 'Menu Superior', 'Menu Contacto', 'Contacto');" title="Contacto" href="/contacto">Contacto</a></li>
	              			<li style="margin-top: -8px;"><a onClick="ga('send', 'event', 'Menu Superior', 'Menu RSS', 'RSS');" href="#newsletter" accesskey="r"><img src="/img/rssmenu.png" alt="RSS"></a></li>
	            		</ul>
	          		</div>
	        	</div>
	      	</div>
			<!--end: Navbar -->
						
		</div>
		<!--end: Container-->			
	<div id="banGooHeader" class="iframe_wrap" style="width: 75%; margin:0 auto;">
		<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		<!-- superior 1 skyscraper ebook -->
		<ins class="adsbygoogle"
		     style="display:inline-block;width:728px;height:90px"
		     data-ad-client="ca-pub-3168560600423825"
		     data-ad-slot="9111082944"></ins>
		<script>
		(adsbygoogle = window.adsbygoogle || []).push({});
		</script>
	</div>		
	</header>
	<!--end: Header-->