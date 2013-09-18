<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="es">
<html>
  <head>
    <title>Edicion</title>
    
     <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/bootstrap-responsive.css" rel="stylesheet">
	<%@ include file="/WEB-INF/jsp/includes/styles.jsp"%>
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

	<!-- start: Page Title -->
	<div id="page-title">

		<div id="page-title-inner">

			<!-- start: Container -->
			<div class="container">
				<c:choose>
				<c:when test="${empty user}">
				   <div id="msg"></div>				
		           <h1><i class="ico-keynote ico-white"></i><a id="login" href="#" class="btn login">Login para editores</a></h1>
		        </c:when>
				<c:otherwise>
					<h1><i class="ico-keynote ico-white"></i><a id="logout" href="#" class="btn logout">Logout</a></h1>
				</c:otherwise>
				</c:choose>
			</div>
			<!-- end: Container  -->

		</div>	

	</div>
		<!--start: Wrapper -->
	<div id="wrapper">
				
		<!--start: Container -->
    	<div class="container">
				<label>Tienes que estar dado de alta como editor para poder crear nuevas publicaciones</label>
		</div>
	</div>
	

    <!-- start: Footer Menu -->
	<div id="footer-menu" class="hidden-tablet hidden-phone">

		<!-- start: Container -->
		<div class="container">
			
			<!-- start: Row -->
			<div class="row">

				<!-- start: Footer Menu Logo -->
				<div class="span2">
					<div id="footer-menu-logo">
						<div id="logo-chart"></div><a class="brand" href="/">CE<span>HOY</span>.</a>
					</div>
				</div>
				<!-- end: Footer Menu Logo -->

				<!-- start: Footer Menu Links-->
				<div class="span9">
					
					<div id="footer-menu-links">

						<ul id="footer-nav">

							<li><a href="/">Inicio</a></li>

							<li><a href="/ebooks">eBooks</a></li>

							<li><a href="/sobre">Sobre nosotros</a></li>
							
							<li><a href="/contacto">Contacto</a></li>

						</ul>

					</div>
					
				</div>
				<!-- end: Footer Menu Links-->

				<!-- start: Footer Menu Back To Top -->
				<div class="span1">
						
					<div id="footer-menu-back-to-top">
						<a href="/"></a>
					</div>
				
				</div>
				<!-- end: Footer Menu Back To Top -->
			
			</div>
			<!-- end: Row -->
			
		</div>
		<!-- end: Container  -->	

	</div>	
	<!-- end: Footer Menu -->

	<!-- start: Footer -->
	<div id="footer">
		
		<!-- start: Container -->
		<div class="container">
			
			<!-- start: Row -->
			<div class="row">

				<!-- start: About -->
				<div class="span3">
					
					<h3>Sobre nosotros</h3>
					<p>
						Somos un equipo de personas con gran formación tecnológica y apasionadas por todo lo relacionado con ella. Poseemos una gran experiencia en el mundo de internet y te brindamos la mejor actualidad en Internet, noticias de gadget tecnológicos, software y telefonía.
					</p>
						
				</div>
				<!-- end: About -->

				<!-- start: Photo Stream -->
				<div class="span3">
					
					<h3></h3>
					<div class="flickr-widget">
							
						<div class="clear"></div>
					</div>
					
				</div>
				<!-- end: Photo Stream -->

				<div class="span6">
				
					<!-- start: Follow Us -->
					<h3>Síguenos!</h3>
					<ul class="social-grid">
						<li>
							<div class="social-item">				
								<div class="social-info-wrap">
									<div class="social-info">
										<div class="social-info-front social-twitter">
											<a href="http://twitter.com"></a>
										</div>
										<div class="social-info-back social-twitter-hover">
											<a href="http://twitter.com"></a>
										</div>	
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="social-item">				
								<div class="social-info-wrap">
									<div class="social-info">
										<div class="social-info-front social-facebook">
											<a href="http://facebook.com"></a>
										</div>
										<div class="social-info-back social-facebook-hover">
											<a href="http://facebook.com"></a>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="social-item">				
								<div class="social-info-wrap">
									<div class="social-info">
										<div class="social-info-front social-dribbble">
											<a href="http://dribbble.com"></a>
										</div>
										<div class="social-info-back social-dribbble-hover">
											<a href="http://dribbble.com"></a>
										</div>	
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="social-item">				
								<div class="social-info-wrap">
									<div class="social-info">
										<div class="social-info-front social-flickr">
											<a href="http://flickr.com"></a>
										</div>
										<div class="social-info-back social-flickr-hover">
											<a href="http://flickr.com"></a>
										</div>	
									</div>
								</div>
							</div>
						</li>
					</ul>
					<!-- end: Follow Us -->
				
					<!-- start: Newsletter -->
					<form id="newsletter">
						<h3>Newsletter</h3>
						<p>Por favor, déjanos tu email para conocer nuestras nuevas publicaciones</p>
						<label for="newsletter_input">@:</label>
						<input type="text" id="newsletter_input"/>
						<input type="submit" id="newsletter_submit" value="submit">
					</form>
					<!-- end: Newsletter -->
				
				</div>
				
			</div>
			<!-- end: Row -->	
			
		</div>
		<!-- end: Container  -->

	</div>
	<!-- end: Footer -->

	<!-- start: Copyright -->
	<div id="copyright">
	
		<!-- start: Container -->
		<div class="container">
		
			<div class="span12">
				<p>
					&copy; 2013, <a href="/">Compra eBook Hoy</a><i style="margin-top: -18px;" class="ico-color ico-sun"></i>
				</p>
			</div>
	
		</div>
		<!-- end: Container  -->
		
	</div>	
	<!-- end: Copyright -->








<!-- start: Java Script -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/js/jquery-1.8.2.js"></script> 
<script src="/js/bootstrap.js"></script>
<script src="/js/isotope.js"></script>
<script src="/js/jquery.imagesloaded.js"></script>
<script src="/js/flexslider.js"></script>
<script src="/js/carousel.js"></script>
<script src="/js/jquery.cslider.js"></script>
<script src="/js/slider.js"></script>
<script src="/js/fancybox.js"></script>
<script defer="defer" src="/js/custom.js"></script>
<!-- end: Java Script -->



<script src="/js/login.js"></script>

		<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE8+ -->
		<!--[if gte IE 8]><script src="/js/cors/jquery.xdr-transport.js"></script><![endif]-->
		<!--[if IE]>
		<script type="text/javascript">
			add_placeholder('multiElement', 'http://');
		</script>
		<![endif]-->

</body>
</html>