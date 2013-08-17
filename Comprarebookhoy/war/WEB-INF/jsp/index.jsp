<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es">

<%@ include file="/WEB-INF/jsp/includes/header.jsp"%>
	
	<!-- start: Slider -->
	<div class="slider-wrapper">

		<div id="da-slider" class="da-slider">
			<div class="da-slide">
				<h2>TU LIBRERÍA PORTABLE</h2>
				<p>cine o reproductor de musica</p>
				<a href="index.html#" class="da-link">LEER MÁS</a>
				<div class="da-img"><img src="/img/parallax-slider/libreriaportable.jpg" alt="image01" /></div>
			</div>
			<div class="da-slide">
				<h2>KINDLE PAPERWHITE 3G</h2>
				<p>La tecnología unica Paperwhite y larga duración de batería hacen de el un gran contendiente.</p>
				<a href="index.html#" class="da-link">LEER MÁS</a>
				<div class="da-img"><img src="/img/parallax-slider/kindlepaperwhite3g.jpg" alt="image02" /></div>
			</div>
			<div class="da-slide">
				<h2>NOOK HD</h2>
				<p>Uno de los mejores que te permite configurar tu propio perfil ofreciendo un abundante contenido.</p>
				<a href="index.html#" class="da-link">LEER MÁS</a>
				<div class="da-img"><img src="/img/parallax-slider/nook_hd.jpg" alt="image03" /></div>
			</div>
			<div class="da-slide">
				<h2>KOBO GLO WIRELESS EREADER</h2>
				<p>Un diseño y tacto único que ofrece un programa de recompensas cuando alcanzas un hito en tu lectura</p>
				<a href="index.html#" class="da-link">LEER MÁS</a>
				<div class="da-img"><img src="/img/parallax-slider/Kobo_Glo_eReader.jpg" alt="image04" /></div>
			</div>
			<nav class="da-arrows">
				<span class="da-arrows-prev"></span>
				<span class="da-arrows-next"></span>
			</nav>
		</div>
		
	</div>
	<!-- end: Slider -->
			
	<!--start: Wrapper-->
	<div id="wrapper">
				
		<!--start: Container -->
    	<div class="container">
			
			<hr>
	
      		<!-- start: Hero Unit - Main hero unit for a primary marketing message or call to action -->
      		<div class="hero-unit">
				<h3>
					Organiza todos tus e-books y autores: los E-books se están siendo cada vez más y más populares, gracias a lo fácil que es llevarlos contigo y transferirlos
				</h3>
        		<p><a class="btn btn-primary btn-large" href="/blog/organiza-todos-tus-ebooks">Continúa &raquo;</a></p>
      		</div>
			<!-- end: Hero Unit -->
      		
			<hr>
			
			<!-- start: Row -->
			<div class="row">
				
				<!-- start: Icon Boxes -->
				<div class="icons-box-vert-container">

					<!-- start: Icon Box Start -->
					<div class="span4">
						<div class="icons-box-vert">
							<i class="ico-ok ico-white circle-color-full"></i>
							<div class="icons-box-vert-info">
								<h3>Easy to use</h3>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<!-- end: Icon Box-->

					<!-- start: Icon Box Start -->
					<div class="span4">
						<div class="icons-box-vert">
							<i class="ico-cup  ico-white circle-color-full"></i>
							<div class="icons-box-vert-info">
								<h3>Best choice</h3>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<!-- end: Icon Box -->

					<!-- start: Icon Box Start -->
					<div class="span4">
						<div class="icons-box-vert">
							<i class="ico-ipad ico-white circle-color-full"></i>
							<div class="icons-box-vert-info">
								<h3>Fully Responsive</h3>
								<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<!-- end: Icon Box -->

				</div>
				<!-- end: Icon Boxes -->
				<div class="clear"></div>
			</div>
			<!-- end: Row -->
			
			<hr>
			
	
		
					
		<div class="title"><h3>Últimas Publicaciones</h3></div>
			
    	<div class="container">
	
			<!-- start: Portfolio -->
			<div id="portfolio-wrapper" class="row">
				<% pageContext.setAttribute("newLineChar", "\n"); %>
				<c:forEach var="publicacion" items="${publicaciones}" varStatus="status" >				
				<div class="span4 portfolio-item nature people">
					<div class="picture"><a href="/ebooks/${publicacion.url}" title="${publicacion.titulo}">
					
					<c:if test="${!empty publicacion.lImages }">
					<img src="${publicacion.lImages[0]}" alt="Detalle"/>
					</c:if>
					
					<div class="image-overlay-link"></div></a>
						<div class="item-description alt">
							<h5><a href="/ebooks/${publicacion.url}">${publicacion.titulo}</a></h5>
							<p>
								${fn:replace(publicacion.resumen, newLineChar, "<p/><p>")}
							</p>
						</div>
						<div class="post-meta"><span><i class="mini-ico-calendar"></i><fmt:setLocale value="es_ES" scope="session"/><fmt:formatDate type="date" dateStyle="long" value="${publicacion.fechaCreacion}"/></span><span style="visibility:hidden"><i class="mini-ico-user"></i>  <a href="#">Jorge Amat</a></span> <span><i class="mini-ico-comment"></i><a href="#">${fn:length(publicacion.lComentarios)} comments</a></span></div>
					</div>	
				</div>
				</c:forEach>
			</div>
			<!-- end: Portfolio -->
      	
		</div>
		<!--end: Container-->

        	<div class="span3">
					
					<!-- start: Testimonials-->

					<!-- end: Testimonials-->
					
        	</div>
			
			<hr>
		
			<!-- start Clients List -->	
			<div class="clients-carousel">
		
				<ul class="slides clients">
					<li><img src="/img/logos/1.png" alt=""/></li>
					<li><img src="/img/logos/2.png" alt=""/></li>	
					<li><img src="/img/logos/3.png" alt=""/></li>
					<li><img src="/img/logos/4.png" alt=""/></li>
					<li><img src="/img/logos/5.png" alt=""/></li>
					<li><img src="/img/logos/6.png" alt=""/></li>
					<li><img src="/img/logos/7.png" alt=""/></li>
					<li><img src="/img/logos/8.png" alt=""/></li>
					<li><img src="/img/logos/9.png" alt=""/></li>
					<li><img src="/img/logos/10.png" alt=""/></li>
					<li><img src="/img/logos/1.png" alt=""/></li>
					<li><img src="/img/logos/2.png" alt=""/></li>	
					<li><img src="/img/logos/3.png" alt=""/></li>
					<li><img src="/img/logos/4.png" alt=""/></li>
					<li><img src="/img/logos/5.png" alt=""/></li>
					<li><img src="/img/logos/6.png" alt=""/></li>
					<li><img src="/img/logos/7.png" alt=""/></li>
					<li><img src="/img/logos/8.png" alt=""/></li>
					<li><img src="/img/logos/9.png" alt=""/></li>
					<li><img src="/img/logos/10.png" alt=""/></li>	
				</ul>
		
			</div>
			<!-- end Clients List -->
		
			<hr>
			
		</div>
		<!--end: Container-->
	
	</div>
	<!-- end: Wrapper  -->			

<%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>

</body>
</html>