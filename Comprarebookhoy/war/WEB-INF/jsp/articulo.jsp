<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

	<%@ include file="/WEB-INF/jsp/includes/header.jsp"%>
	
	<!-- start: Page Title -->
	<div id="page-title">

		<div id="page-title-inner">

			<!-- start: Container -->
			<div class="container">

				<h2><i class="ico-keynote ico-white"></i>Organiza tus libros y autores</h2>

			</div>
			<!-- end: Container  -->

		</div>	

	</div>
	<!-- end: Page Title -->
	
	<!--start: Wrapper -->
	<div id="wrapper">
				
		<!--start: Container -->
    	<div class="container">
	
			<!-- start: Flexslider -->
			<div class="slider">
				<div id="flex1" class="flexslider home">
					<ul class="slides">
						<c:forEach var="imagen" items="${publicacion.lImages}" varStatus="status" end="${fn:length(publicacion.lImages)}">
						<li>
							<img src="${imagen}" alt="" />
							<div class="slide-caption n">
								<h3>${publicacion.descripcion}</h3>
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- end: Flexslider -->
			
			<hr>
			
			<!-- start: Row -->
			<div class="row">
				
				<div class="span2">
					
					<ul class="project-info">
						<li><strong>Fecha del artículo:</strong> ${publicacion.fechaCreacion}</li>
						<li><strong>Número de visitas::</strong>  ${publicacion.numVisitas}</li>
					</ul>
					<a href="project.html#" class="button color launch">Project Page</a>
					
				</div>
				<% pageContext.setAttribute("newLineChar", "\n"); %>
				<div class="span10">
					
					<p>
						<span class="dropcap">-</span>${fn:replace(publicacion.articulo, newLineChar, "<p/><p>")}
					</p>
					
					
				</div>	
				
			</div>
			<!-- end: Row -->
			
			<hr>
			
			<!-- start: Row -->
      		<div class="row">
	
				<div class="span9">
					
					<div class="title"><h3>Compra Ahora</h3></div>
					
					<!-- start: Row -->
		      		<div class="row">
			
						<div class="span3">
	
							<div class="picture">
								<a href="/img/car.jpg" rel="image" title="mobile app">
									<img src="/img/car.jpg" >
									<div class="image-overlay-zoom"></div>
								</a>
							</div>
							<div class="item-description">
								<h4><a href="project.html#">Mobile App</a></h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</p>
							</div>
					
        				</div>
					
						<div class="span3">

							<div class="picture">
								<a href="project.html">
									<img src="/img/web_app1.jpg">
									<div class="image-overlay-link"></div>
								</a>
							</div>
							<div class="item-description">
								<h4><a href="project.html#">Mobile App</a></h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</p>
							</div>

		        		</div>

						<div class="span3">

							<div class="picture">
								<a href="/img/mobile_app1.jpg" rel="image" title="mobile app">
									<img src="/img/mobile_app1.jpg">
									<div class="image-overlay-zoom"></div>
								</a>
							</div>
							<div class="item-description">
								<h4><a href="project.html#">Mobile App</a></h4>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</p>
							</div>

						</div>
										
					<div class="title"><h3>Te Puede Interesar</h3></div>					
			
    				<div class="container">
    					<div id="portfolio-wrapper" class="row">
						<c:forEach var="publicacion" items="${publicaciones}" varStatus="status" end="4">				
							<div class="span4 portfolio-item nature people">
								<div class="picture"><a href="/blog/${publicacion.url}" title="${publicacion.titulo}">
								<c:if test="${!empty publicacion.lImages }">
									<img src="${publicacion.lImages[0]}" alt="Detalle"/>
								</c:if>
								<div class="image-overlay-link"></div></a>
									<div class="item-description alt">
										<h5><a href="project.html">${publicacion.titulo}</a></h5>
										<p>
											${fn:replace(publicacion.resumen, newLineChar, "<p/><p>")}
										</p>
									</div>
									<div class="post-meta"><span><i class="mini-ico-calendar"></i>${publicacion.fechaCreacion}</span> <span><i class="mini-ico-user"></i> <a href="portfolio3.html#">Jorge Amat</a></span> <span><i class="mini-ico-comment"></i><%--<a href="portfolio3.html#">89 comments</a>--%></span></div>
								</div>	
							</div>
						</c:forEach>
						</div>
					</div>
        			</div>
					<!-- end: Row -->

				</div>

        		<div class="span3">
					
					<!-- start: Testimonials-->

					<div class="testimonial-container">

						<div class="title"><h3>What Client’s Say</h3></div>

							<div class="testimonials-carousel" data-autorotate="3000">

								<ul class="carousel">

									<li class="testimonial">
										<div class="testimonials">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</div>
										<div class="testimonials-bg"></div>
										<div class="testimonials-author">Lucas Luck, <span>CEO</span></div>
									</li>

									<li class="testimonial">
										<div class="testimonials">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</div>
										<div class="testimonials-bg"></div>
										<div class="testimonials-author">Lucas Luck, <span>CTO</span></div>
									</li>

									<li class="testimonial">
										<div class="testimonials">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</div>
										<div class="testimonials-bg"></div>
										<div class="testimonials-author">Lucas Luck, <span>COO</span></div>
									</li>

									<li class="testimonial">
										<div class="testimonials">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</div>
										<div class="testimonials-bg"></div>
										<div class="testimonials-author">Lucas Luck, <span>CMO</span></div>
									</li>

								</ul>

							</div>

						</div>

					<!-- end: Testimonials-->
					
        		</div>

      		</div>
			<!-- end: Row -->
			
	
			
		</div>
		<!-- end: Container  -->
	
	</div>
	<!-- end: Wrapper -->		
	
<%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>

</body>
</html>