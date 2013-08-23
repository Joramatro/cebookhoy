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
				<h2>KINDLE PAPERWHITE 3G</h2>
				<p>La tecnología unica Paperwhite y larga duración de batería hacen de el un gran contendiente.</p>
				<a href="/ebooks/Kindle-Paperwhite-3G" class="da-link">LEER MÁS</a>
				<div class="da-img"><img src="/img/parallax-slider/1.jpg" style="width: 430px;height:280px;" alt="image01" /></div>
			</div>
			<div class="da-slide">
				<h2>Energy Color C7+ Touch</h2>
				<p>Lee y reproduce todo tipo de contenido multimedia de alta definición.</p>
				<a href="/ebooks/Energy-Color-C7+-Touch" class="da-link">LEER MÁS</a>
				<div class="da-img"><img src="/img/parallax-slider/3.jpg" style="width: 430px;height:280px;" alt="image03" /></div>
			</div>
			<div class="da-slide">
				<h2>Kindle Fire HD</h2>
				<p>Delgado, ligero y portátil. Sensacional pantalla de 7 pulgadas.</p>
				<a href="/ebooks/Kindle-Fire-HD" class="da-link">LEER MÁS</a>
				<div class="da-img"><img src="/img/parallax-slider/2.jpg" style="width: 430px;height:280px;" alt="image02" /></div>
			</div>
			<div class="da-slide">
				<h2>KINDLE</h2>
				<p>Con Wifi y pantalla táctil de tinta electrónica E-Ink</p>
				<a href="/ebooks/Kindle" class="da-link">LEER MÁS</a>
				<div class="da-img"><img src="/img/parallax-slider/4.jpg" style="width: 430px;height:280px;" alt="image04" /></div>
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
					Organiza todos tus e-books y autores: los e-books se están siendo cada vez más y más populares, gracias a lo fácil que es llevarlos contigo y transferirlos
				</h3>
        		<p><a class="btn btn-primary btn-large" href="/blog">Blog</a></p>
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
			<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
			<!-- horizontal ch -->
			<ins class="adsbygoogle"
			     style="display:inline-block;width:728px;height:90px"
			     data-ad-client="ca-pub-3168560600423825"
			     data-ad-slot="4936089743"></ins>
			<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
			</script>
			</div>
		
					
		<div class="title"><h3>Últimas Publicaciones</h3></div>
			
    	<div class="container">
	
			<!-- start: Portfolio -->
			<div id="portfolio-wrapper" class="row">
				<% pageContext.setAttribute("newLineChar", "\n"); %>
				<c:forEach var="publicacion" items="${publicacionesEbooks}" varStatus="status" end="6">				
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
						<div class="post-meta"><span><i class="mini-ico-calendar"></i><fmt:setLocale value="es_ES" scope="session"/><fmt:formatDate type="date" dateStyle="long" value="${publicacion.fechaCreacion}"/></span><span style=""><i class="mini-ico-user"></i>  <a href="/ebooks/${publicacion.url}">Jorge Amat</a></span> <span><i class="mini-ico-comment"></i><a href="/ebooks/${publicacion.url}/#comments">${fn:length(publicacion.lComentarios)} comments</a></span></div>
					</div>	
				</div>
				</c:forEach>
				<c:forEach var="publicacion" items="${publicacionesBlog}" varStatus="status" end="6">				
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
						<div class="post-meta"><span><i class="mini-ico-calendar"></i><fmt:setLocale value="es_ES" scope="session"/><fmt:formatDate type="date" dateStyle="long" value="${publicacion.fechaCreacion}"/></span><span style=""><i class="mini-ico-user"></i>  <a href="/blog/${publicacion.url}">Jorge Amat</a></span> <span><i class="mini-ico-comment"></i><a href="/blog/${publicacion.url}/#comments">${fn:length(publicacion.lComentarios)} comments</a></span></div>
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
					<li><a target="_blank" href="http://www.amazon.es/s/?_encoding=UTF8&camp=3626&creative=24822&field-keywords=woxter%20ebook&linkCode=ur2&rh=i%3Aaps%2Ck%3Awoxter%20ebook&tag=comprarebookh-21&url=search-alias%3Daps"><img src="/img/logos/1.png" alt="woxter"/></a><img src="https://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=ur2&o=30" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /></li>
					<li><a target="_blank" href="http://www.amazon.es/s/?_encoding=UTF8&camp=3626&creative=24822&field-keywords=nexus%207&linkCode=ur2&rh=i%3Aaps%2Ck%3Anexus%207&tag=comprarebookh-21&url=search-alias%3Daps"><img src="/img/logos/2.png" alt="android"/></a><img src="https://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=ur2&o=30" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /></li>	
					<li><a target="_blank" href="http://www.amazon.es/s/?_encoding=UTF8&camp=3626&creative=24822&field-keywords=kindle&linkCode=ur2&rh=i%3Aaps%2Ck%3Akindle&tag=comprarebookh-21&url=search-alias%3Daps"><img src="/img/logos/3.png" alt="kindle"/></a><img src="https://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=ur2&o=30" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /></li>
					<li><a target="_blank" href="http://www.amazon.es/s/?_encoding=UTF8&camp=3626&creative=24822&field-keywords=wolder%20ebooks&linkCode=ur2&rh=i%3Aaps%2Ck%3Awolder%20ebooks&tag=comprarebookh-21&url=search-alias%3Daps"><img src="/img/logos/4.png" alt="wolder"/></a><img src="https://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=ur2&o=30" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /></li>
					<li><a target="_blank" href="http://www.amazon.es/s/?_encoding=UTF8&camp=3626&creative=24822&field-keywords=kindle%20paperwhite&linkCode=ur2&rh=i%3Aaps%2Ck%3Akindle%20paperwhite&tag=comprarebookh-21&url=search-alias%3Daps"><img src="/img/logos/5.png" alt="paperwhite"/></a><img src="https://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=ur2&o=30" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /></li>
					<li><a target="_blank" href="http://www.amazon.es/s/?_encoding=UTF8&camp=3626&creative=24822&field-keywords=mini%20ipad&linkCode=ur2&rh=n%3A938010031%2Ck%3Amini%20ipad&tag=comprarebookh-21&url=node%3D938010031"><img src="/img/logos/6.png" alt="miniipad"/></a><img src="https://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=ur2&o=30" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /></li>
					<li><a target="_blank" href="http://www.amazon.es/s/?_encoding=UTF8&camp=3626&creative=24822&keywords=ebooks&linkCode=ur2&qid=1377036762&rh=n%3A599370031%2Cn%3A928457031%2Cn%3A934303031%2Ck%3Aebooks%2Cp_89%3AKobo&rnid=1692911031&tag=comprarebookh-21"><img src="/img/logos/7.png" alt="kobo glo"/></a><img src="https://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=ur2&o=30" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /></li>
					<li><a target="_blank" href="http://www.amazon.es/gp/product/140053271X/ref=as_li_ss_tl?ie=UTF8&camp=3626&creative=24822&creativeASIN=140053271X&linkCode=as2&tag=comprarebookh-21"><img src="/img/logos/8.png" alt="nook"/></a><img src="http://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=as2&o=30&a=140053271X" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /></li>										
					<li><a target="_blank" href="http://www.amazon.es/s/?_encoding=UTF8&camp=3626&creative=24822&field-keywords=sony%20ebook&linkCode=ur2&rh=i%3Aelectronics%2Ck%3Asony%20ebook&sprefix=sony%20ebo%2Celectronics&tag=comprarebookh-21&url=search-alias%3Delectronics"><img src="/img/logos/9.png" alt="sony"/></a><img src="https://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=ur2&o=30" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /></li>
					<li><a target="_blank" href="http://www.amazon.es/s/?_encoding=UTF8&camp=3626&creative=24822&keywords=lectores%20de%20ebooks&linkCode=ur2&qid=1377037851&rh=n%3A599370031%2Cn%3A928457031%2Cn%3A934303031%2Ck%3Alectores%20de%20ebooks%2Cp_89%3APapyre&rnid=1692911031&tag=comprarebookh-21"><img src="/img/logos/10.png" alt="papyre"/></a><img src="https://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=ur2&o=30" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /></li>
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