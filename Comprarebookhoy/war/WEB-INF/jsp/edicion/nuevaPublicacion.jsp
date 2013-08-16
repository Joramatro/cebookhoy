<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<html>
  <head>
    <title>Nueva Publicacion</title>
    
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
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/icon/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/icon/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/icon/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="/icon/apple-touch-icon-57-precomposed.png">
        <link rel="shortcut icon" href="/icon/favicon.ico">
		<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
		<link rel="stylesheet" href="/css/apprise-v2.css" type="text/css" />
    <meta name="description" content="File Upload widget with multiple file selection, drag&amp;drop support, progress bars, validation and preview images, audio and video for jQuery. Supports cross-domain, chunked and resumable file uploads and client-side image resizing. Works with any server-side platform (PHP, Python, Ruby on Rails, Java, Node.js, Go etc.) that supports standard HTML form file uploads.">
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
					<a class="brand" href="/"><i class="ico-charts circle"></i>Comprar eBook <span>Hoy</span>.</a>
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
 Tipo: <select name="tipo" id="tipo">
				  <option value="AR">Articulo</option>
				  <option value="EB">eBook</option>
				  <option value="AC">Accesorio</option>
				</select><br><br>
Titulo: <input type="text" style="width: 433px;" id="titulo" name="titulo" size="25" maxlength="50"><br><br>
Keywords: <input type="text" style="width: 433px;"id="keywords" name="keywords" size="35" maxlength="100">
<br><br>
Descripcion: <input type="text" style="width: 633px;" id="descripcion" name="descripcion" size="100" maxlength="100">
<br><br>
Clase1: <select id="clase1" name="clase1">
				  <option value=""></option>
				  <option value="Novedades">Novedades</option>
				  <option value="Sony">Sony</option>
				  <option value="Inves">Inves</option>
				  <option value="Wolder">Wolder</option>
				  <option value="Woxter">Woxter</option>
				  <option value="Papyre">Papyre</option>
				  <option value="Otros">Otros</option>
				</select>
Clase2: <select id="clase2" name="clase2">
				  <option value=""></option>
				  <option value="Novedades">Novedades</option>
				  <option value="Sony">Sony</option>
				  <option value="Inves">Inves</option>
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
<textarea style="width: 833px;" rows="40" id="articulo" name="articulo"></textarea>
<br><br>
<table width="50%" border="0" align="center" cellpadding="10" cellspacing="0">
<tr>
<td><div align="center">
<input type="button" id="btnGuardarPubli" class="guardarPubli" value="Guardar y pasar a fotos">
</div></td>
</tr>
</table>
</div>
</div>

<div id="divFotos" style="display:none">
    <br>
    <div class="page-header">
        <h1>Configuracion fotos publicacion</h1>
    </div>
    <blockquote>
        <p>Sube 4 fotos a la publicacion</p>
    </blockquote>
    <br>
    <!-- The file upload form used as target for the file upload widget -->
    <form id="fileupload" method="POST" enctype="multipart/form-data">    	
        <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
        <div class="row fileupload-buttonbar">
            <div class="span7">
                <!-- The fileinput-button span is used to style the file input field as button -->
                <span class="btn btn-success fileinput-button">
                    <i class="icon-plus icon-white"></i>
                    <span>Add Picture...</span>
                    <input type="file" name="files[]" multiple>
                </span>
                <!--
                <button type="submit" class="btn btn-primary start">
                    <i class="icon-upload icon-white"></i>
                    <span>Start upload</span>
                </button>
                <button type="reset" class="btn btn-warning cancel">
                    <i class="icon-ban-circle icon-white"></i>
                    <span>Cancel upload</span>
                </button>
                 -->
                <button type="button" class="btn btn-danger delete">
                    <i class="icon-trash icon-white"></i>
                    <span>Delete</span>
                </button>
                <input type="checkbox" class="toggle">
            </div>
            <!-- The global progress information -->
            <div class="span5 fileupload-progress fade">
                <!-- The global progress bar -->
                <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                    <div class="bar" style="width:0%;"></div>
                </div>
                <!-- The extended global progress information -->
                <div class="progress-extended">&nbsp;</div>
            </div>
        </div>
        <!-- The loading indicator is shown during file processing -->
        <div class="fileupload-loading"></div>
        <br>
        <!-- The table listing the files available for upload/download -->
        <table role="presentation" class="table table-striped"><tbody class="files" data-toggle="modal-gallery" data-target="#modal-gallery"></tbody></table>
    </form>
    <br>  
    <div class="well">
        <h3>Notes</h3>
        <ul>
            <li>The maximum file size for uploads is <strong>32 MB</strong>.</li>
            <li>The maximum number of files for upload are <strong>10</strong>.</li>
            <li>Only image files (<strong>JPG, GIF, PNG</strong>) are allowed.</li>
            <li>You can <strong>drag &amp; drop</strong> files from your desktop on this place.</li>
        </ul>
    </div>
    <br><br><br>
    <div>
    	<a href="/edicion"><button class="btn">Crear otra Publicacion</button></a>
    </div>
</div>
    
<!-- modal-gallery is the modal dialog used for the image gallery -->
<div id="modal-gallery" class="modal modal-gallery hide fade" data-filter=":odd" tabindex="-1">
    <div class="modal-header">
        <a class="close" data-dismiss="modal">&times;</a>
        <h3 class="modal-title"></h3>
    </div>
    <div class="modal-body"><div class="modal-image"></div></div>
    <div class="modal-footer">
        <a class="btn modal-download" target="_blank">
            <i class="icon-download"></i>
            <span>Download</span>
        </a>
        <a class="btn btn-success modal-play modal-slideshow" data-slideshow="5000">
            <i class="icon-play icon-white"></i>
            <span>Slideshow</span>
        </a>
        <a class="btn btn-info modal-prev">
            <i class="icon-arrow-left icon-white"></i>
            <span>Previous</span>
        </a>
        <a class="btn btn-primary modal-next">
            <span>Next</span>
            <i class="icon-arrow-right icon-white"></i>
        </a>
    </div>
</div>

<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td class="preview"><span class="fade"></span></td>
        <td class="name"><span>{%=file.name%}</span></td>
        <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
        {% if (file.error) { %}
            <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
        {% } else if (o.files.valid && !i) { %}
            <td>
                <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="bar" style="width:0%;"></div></div>
            </td>
            <td>{% if (!o.options.autoUpload) { %}
                <button class="btn btn-primary start">
                    <i class="icon-upload icon-white"></i>
                    <span>Start</span>
                </button>
            {% } %}</td>
        {% } else { %}
            <td colspan="2"></td>
        {% } %}
        <td>{% if (!i) { %}
            <button class="btn btn-warning cancel">
                <i class="icon-ban-circle icon-white"></i>
                <span>Cancel</span>
            </button>
        {% } %}</td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        {% if (file.error) { %}
            <td></td>
            <td class="name"><span>{%=file.name%}</span></td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
        {% } else { %}
            <td class="preview">{% if (file.thumbnail_url) { %}
                <a href="{%=file.url%}" title="{%=file.name%}" data-gallery="gallery" download="{%=file.name%}"><img src="{%=file.thumbnail_url%}"></a>
            {% } %}</td>
            <td class="name">
                <a href="{%=file.url%}" title="{%=file.name%}" data-gallery="{%=file.thumbnail_url&&'gallery'%}" download="{%=file.name%}">{%=file.name%}</a>
            </td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            <td colspan="2"></td>
        {% } %}
        <td>
            <button class="btn btn-danger delete" data-type="{%=file.delete_type%}" data-url="{%=file.delete_url%}"{% if (file.delete_with_credentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                <i class="icon-trash icon-white"></i>
                <span>Delete</span>
            </button>
            <input type="checkbox" name="delete" value="1" class="toggle">
        </td>
    </tr>
{% } %}
</script>


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
						<a href="index.html#"></a>
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
					&copy; 2013, <a href="/">Compra eBook Hoy</a>
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


		<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
		<script src="/js/vendor/jquery.ui.widget.js"></script>
		<!-- The Templates plugin is included to render the upload/download listings -->
		<script src="/js/tmpl.min.js"></script>
		<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
		<script src="/js/load-image.min.js"></script>		
		<script src="/js/bootstrap-image-gallery.min.js"></script>
		<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
		<script src="/js/jquery.iframe-transport.js"></script>
		<!-- The basic File Upload plugin -->
		<script src="/js/jquery.fileupload.js"></script>
		<!-- The File Upload file processing plugin -->
		<script src="/js/jquery.fileupload-fp.js"></script>
		<!-- The File Upload user interface plugin -->
		<script src="/js/jquery.fileupload-ui.js"></script>  
		<script src="/js/main.js"></script>


<script>
$(function(){ /* DOM ready */
    $("#btnGuardarPubli").on('click', function(e) {
		$("#divFotos").css("display", "block");
		$("#btnGuardarPubli").css("display", "none");
		
	});
});

$(function() {
	  /* activate the plugin */
		$('#fileupload').fileupload({submit: function (e, data) {
	        
	    	var $this = $(this);
	    	//debugger;
	        $.getJSON('/rest/file/url?' + new Date().getTime(), function (result) {
	        	data.url = result.url;
	            $this.fileupload('send', data);
	        });
	        return false;
	    }
		});
	});
</script>

		<!-- The XDomainRequest Transport is included for cross-domain file deletion for IE8+ -->
		<!--[if gte IE 8]><script src="/js/cors/jquery.xdr-transport.js"></script><![endif]-->
		<!--[if IE]>
		<script type="text/javascript">
			add_placeholder('multiElement', 'http://');
		</script>
		<![endif]-->

		
</body>
</html>