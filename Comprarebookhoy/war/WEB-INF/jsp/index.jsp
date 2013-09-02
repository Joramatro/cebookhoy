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
				<h2>Kindle Paperwhite 3G</h2>
				<p>La tecnología unica Paperwhite y larga duración de batería hacen de el un gran contendiente.</p>
				<a href="/venta/principal/Kindle-Paperwhite-3G" class="da-link">COMPRAR HOY</a>				
				<div class="da-img"><a href="/ebooks/Kindle-Paperwhite-3G"><img src="/img/parallax-slider/1.jpg" style="width: 370px;height:340px;" alt="Kindle Paperwhite 3G" /></a></div>
			</div>
			<div class="da-slide">
				<h2>Energy Color C7+ Touch</h2>
				<p>Lee y reproduce todo tipo de contenido multimedia de alta definición.</p>
				<a href="/venta/principal/Energy-Color-C7+-Touch" class="da-link">COMPRAR HOY</a>
				<div class="da-img"><a href="/ebooks/Energy-Color-C7+-Touch"><img src="/img/parallax-slider/3.jpg" style="width: 370px;height:340px;" alt="Energy Color C7+ Touch" /></a></div>
			</div>
			<div class="da-slide">
				<h2>Kindle Fire HD</h2>
				<p>Delgado, ligero y portátil. Sensacional pantalla de 7 pulgadas.</p>
				<a href="/venta/principal/Kindle-Fire-HD" class="da-link">COMPRAR HOY</a>
				<div class="da-img"><a href="/ebooks/Kindle-Fire-HD"><img src="/img/parallax-slider/2.jpg" style="width: 370px;height:340px;" alt="Kindle Fire HD" /></a></div>
			</div>
			<div class="da-slide">
				<h2>Kindle 4</h2>
				<p>Con Wifi y pantalla táctil de tinta electrónica E-Ink</p>
				<a href="/venta/principal/Kindle" class="da-link">COMPRAR HOY</a>
				<div class="da-img"><a href="/ebooks/Kindle"><img src="/img/parallax-slider/4.jpg" style="width: 370px;height:340px;" alt="Kindle 4" /></a></div>
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
					Organiza todos tus e-books y autores: los e-books están siendo cada vez más y más populares, gracias a lo fácil que es llevarlos contigo y transferirlos
				</h3>
        		<p><a class="btn btn-primary btn-large" href="/blog">Ir al Blog</a></p>
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
								<h3>Promueve la lectura</h3>
								<p>Los usuarios de eBooks tienden a leer más que antes y permiten incorporar contenido multimedia.</p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<!-- end: Icon Box-->

					<!-- start: Icon Box Start -->
					<div class="span4">
						<div class="icons-box-vert">
							<i class="ico-ok ico-white circle-color-full"></i>
							<div class="icons-box-vert-info">
								<h3>Desafía el tiempo </h3>
								<p>Con el desarrollo de las tecnologías, los eBooks pueden entregarse casi de manera instantánea, cuestión de segundos.</p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<!-- end: Icon Box -->

					<!-- start: Icon Box Start -->
					<div class="span4">
						<div class="icons-box-vert">
							<i class="ico-ok ico-white circle-color-full"></i>
							<div class="icons-box-vert-info">
								<h3>Más Barato</h3>
								<p>Muchas obras de las bibliotecas en línea permiten la lectura de clásicos sin ningún coste.</p>
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
			
			<div style="width: 60%;margin: 0 auto;">
			<iframe src="http://rcm-eu.amazon-adsystem.com/e/cm?t=comprarebookh-21&o=30&p=48&l=ur1&category=kindle_paperwhite&banner=0W27XP9ZXV3SP6ZQN4R2&f=ifr" width="728" height="90" scrolling="no" border="0" marginwidth="0" style="border:none;" frameborder="0"></iframe>
			</div>
		
		<hr>			
			<%@ include file="/WEB-INF/jsp/includes/masleidos.jsp"%>
						
		<hr>	
		<div class="title"><h3>Últimas Publicaciones</h3></div>			
    	<div class="container">
			<!-- start: Portfolio -->
			<div id="portfolio-wrapper" class="row">
				<% pageContext.setAttribute("newLineChar", "\n"); %>
				<c:forEach var="publicacion" items="${publicacionesEbooks}" varStatus="status" end="5">				
				<div class="span4 portfolio-item nature people">
					<div class="picture"><a href="/ebooks/${publicacion.url}" title="${publicacion.titulo}">
					
					<c:if test="${!empty publicacion.lImages }">
					<img src="${publicacion.lImages[0]}" alt="${publicacion.titulo}"/>
					</c:if>
					
					<div class="image-overlay-link"></div></a>
						<div class="item-description alt">
							<h5><a href="/ebooks/${publicacion.url}">${publicacion.titulo}</a></h5>
							<p>
								${fn:replace(publicacion.resumen, newLineChar, "<p/><p>")}
							</p>
						</div>
						<div class="post-meta"><span><i class="mini-ico-calendar"></i><fmt:setLocale value="es_ES" scope="session"/><fmt:formatDate type="date" dateStyle="long" value="${publicacion.fechaCreacion}"/></span><%-- <span style=""><i class="mini-ico-user"></i>  <a href="/ebooks/${publicacion.url}">Jorge Amat</a></span>--%> <span><i class="mini-ico-comment"></i><a href="/ebooks/${publicacion.url}/#comments">${fn:length(publicacion.lComentarios)} comments</a></span></div>
					</div>	
				</div>
				</c:forEach>
				<c:forEach var="publicacion" items="${publicacionesBlog}" varStatus="status" end="5">				
				<div class="span4 portfolio-item nature people">
					<div class="picture"><a href="/blog/${publicacion.url}" title="${publicacion.titulo}">
					
					<c:if test="${!empty publicacion.lImages }">
					<img src="${publicacion.lImages[0]}" alt="${publicacion.titulo}"/>
					</c:if>
					
					<div class="image-overlay-link"></div></a>
						<div class="item-description alt">
							<h5><a href="/blog/${publicacion.url}">${publicacion.titulo}</a></h5>
							<p>
								${fn:replace(publicacion.resumen, newLineChar, "<p/><p>")}
							</p>
						</div>
						<div class="post-meta"><span><i class="mini-ico-calendar"></i><fmt:setLocale value="es_ES" scope="session"/><fmt:formatDate type="date" dateStyle="long" value="${publicacion.fechaCreacion}"/></span><%-- <span style=""><i class="mini-ico-user"></i>  <a href="/blog/${publicacion.url}">Jorge Amat</a></span>--%> <span><i class="mini-ico-comment"></i><a href="/blog/${publicacion.url}/#comments">${fn:length(publicacion.lComentarios)} comments</a></span></div>
					</div>	
				</div>
				</c:forEach>				
			</div>
			<!-- end: Portfolio -->     	
		</div>
		<!--end: Container-->
		<hr>			
						
			<%@ include file="/WEB-INF/jsp/includes/carrusel.jsp"%>
			
		</div>
		<!--end: Container-->
	
	</div>
	<!-- end: Wrapper  -->			

<%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>

</body>
</html>