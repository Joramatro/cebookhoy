<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>

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
						Somos un equipo de personas con gran formación tecnológica y apasionados por el mundo de la informática. Queremos ofrecerte la mejor información sobre eBooks, tablets y nuevos gadgets tecnológicos.
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
											<a target="_blank" href="https://twitter.com/ComprareBookHoy"></a>
										</div>
										<div class="social-info-back social-twitter-hover">
											<a target="_blank" href="https://twitter.com/ComprareBookHoy"></a>
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
											<a target="_blank" href="https://www.facebook.com/pages/Comprar-Ebook-Hoy/1409281269284939?fref=ts"></a>
										</div>
										<div class="social-info-back social-facebook-hover">
											<a target="_blank" href="https://www.facebook.com/pages/Comprar-Ebook-Hoy/1409281269284939?fref=ts"></a>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="social-item">				
								<div class="social-info-wrap">
									<div class="social-info">
										<div class="social-info-front social-youtube">
											<a target="_blank" href="http://www.youtube.com/channel/UCzRhBI19dHSSREeuSE3NBDA"></a>
										</div>
										<div class="social-info-back social-youtube-hover">
											<a target="_blank" href="http://www.youtube.com/channel/UCzRhBI19dHSSREeuSE3NBDA"></a>
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
											<a target="_blank" href="http://www.flickr.com/people/100459814@N05/"></a>
										</div>
										<div class="social-info-back social-flickr-hover">
											<a target="_blank" href="http://www.flickr.com/people/100459814@N05/"></a>
										</div>	
									</div>
								</div>
							</div>
						</li>
					</ul>
					<!-- end: Follow Us -->
				
					<!-- start: Newsletter -->
					<form action="/subscripcion" method="POST" id="newsletter">
						<h3>Suscríbete</h3>
						<p>Por favor, dejanos tu email</p>
						<label for="newsletter_input">@:</label>
						<input type="text" name="email" id="newsletter_input">
						<input type="submit" onclick="validarEmail();return false;" id="newsletter_submit" value="Guardar">
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
					&copy; 2013, <a href="/">Compra eBook Hoy</a> <img src="/img/poland2.png" alt="Jorge Amat" style="margin-top:-4px">
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
<script src="/js/apprise-v2.js"></script>
<script src="/js/main.js"></script>

<script>
	var pathname = window.location.pathname;
	var parts = pathname.split('/');
	$("#menuSuperior > li").removeClass('active');
	if(parts[1] == 'contacto'){		
		$("#menuContacto").addClass('active');
	}else if(parts[1] == 'sobre'){	
		$("#menuSobre").addClass('active');
	}else if(parts[1] == 'blog'){	
		$("#menuBlog").addClass('active');
	}else if(parts[1] == 'accesorios'){	
		$("#menuAccesorios").addClass('active');
	}else if(parts[1] == 'ebooks'){	
		$("#menuEbooks").addClass('active');
	}else{
		$("#menuInicio").addClass('active');
	}
</script>
<!-- end: Java Script -->