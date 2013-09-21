<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="es">

	<%@ include file="/WEB-INF/jsp/includes/header.jsp"%>

	<!-- start: Map -->
	<div>

		<!-- starts: Google Maps -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<div id="googlemaps-container-top"></div>
		<div id="googlemaps" class="google-map google-map-full"></div>
		<div id="googlemaps-container-bottom"></div>
		<script src="http://maps.google.com/maps/api/js?sensor=true"></script>
		<script src="js/jquery.gmap.min.js"></script>
		<script type="text/javascript">
			$('#googlemaps').gMap({
				maptype: 'ROADMAP',
				scrollwheel: false,
				zoom: 13,
				markers: [
					{
						address: 'Winton Road, Dublin, Ireland', // Your Adress Here
						html: '',
						popup: false,
					}

				],

			});
		</script>
		<!-- end: Google Maps -->
	</div>
	<!-- end: Map -->	
	
	<!-- start: Wrapper -->	
	<div id="wrapper">		

		<!-- start: Container -->	
		<div class="container">
			
			<!-- start: Row -->
			<div class="row">
			
				<!-- start: Contact Info -->
				<div class="span3">
					<div class="title"><h3>Información de Contacto</h3></div>
					<p>
						<b>Comprar eBook Hoy</b>
					</p>
					<p>
						The Triangle, Ranelagh
					</p>
					<p>	
						Dublin 6, Dublin, Irlanda
					</p>	
					<p>
						Email: hola@comprarebookhoy.com
					</p>
				</div>
				<!-- end: Contact Info -->		

				<!-- start: Contact Form -->
				<div class="span4">
					<div class="title"><h3>Formulario de Contacto</h3></div>

					<!-- start: Contact Form -->
					<div id="contact-form">

							<fieldset>
								<div class="clearfix">
									<label for="name"><span>Nombre:</span></label>
									<div class="input">
										<input tabindex="1" size="18" id="nameContact" name="name" type="text" value="">
									</div>
								</div>

								<div class="clearfix">
									<label for="email"><span>Email:</span></label>
									<div class="input">
										<input tabindex="2" size="25" id="emailContact" name="email" type="text" value="" class="input-xlarge">
									</div>
								</div>

								<div class="clearfix">
									<label for="message"><span>Mensaje:</span></label>
									<div class="input">
										<textarea tabindex="3" class="input-xlarge" id="messageContact" name="body" rows="7"></textarea>
									</div>
								</div>

								<div class="actions">
									<button tabindex="3" id="btnContact" type="button" class="btn btn-succes btn-large">Enviar Mensaje</button>
								</div>
							</fieldset>

					</div>
					<!-- end: Contact Form -->

				</div>
				<!-- end: Contact Form -->

				<!-- start: Social Sites -->
				<div class="span5" style="padding-bottom: 12px;">
					<div class="title"><h3>Síguenos!</h3></div>
					<ul class="social-bookmarks">
						<li class="facebook"><a target="_blank" href="https://www.facebook.com/comprarhoy">facebook</a></li>
						<li class="flickr"><a target="_blank" href="http://www.flickr.com/people/100459814@N05/">flickr</a></li>
						<li class="googleplus"><a target="_blank" href="https://plus.google.com/108657243775074009859">googleplus</a></li>
						<li class="linkedin"><a target="_blank" href="http://ie.linkedin.com/pub/jorge-amat-romero/2b/731/895">linkedin</a></li>
						<li class="twitter"><a target="_blank" href="https://twitter.com/ComprarHoy">twitter</a></li>
						<li class="yelp"><a target="_blank" href="http://www.yelp.ie/user_details?userid=4t6COjQHIXnO4eZKT8WwLA">yelp</a></li>
						<li class="youtube"><a target="_blank" href="http://www.youtube.com/channel/UC56PXmN4WM5oxZWE0XHOCjA">youtube</a></li>
					</ul>
				</div>
				<!-- end: Social Sites -->							
			</div>
			<!-- end: Row -->

		</div>
		<!-- end: Container -->
				
  	</div>
	<!-- end: Wrapper  -->			

<%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>

</body>
</html>	