<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


			<div class="row">	
				<div class="span9">					
					<div class="title"><h3>Los eBooks más vistos...</h3></div>
					
					<!-- start: Row -->
		      		<div class="row">
						<c:forEach var="publicacionMVE" items="${publicacionesMVE}" varStatus="status" end="2">	
						<div class="span3">	
							<div class="picture">
								<a href="/ebooks/${publicacionMVE.url}" title="${publicacionMVE.titulo}">
									<c:if test="${!empty publicacionMVE.lImages }">
									<img style="width: 270px;height: 180px;" src="${publicacionMVE.lImages[0]}" alt="${publicacionMVE.titulo}"/>
									</c:if>
									<div class="image-overlay-link"></div>
								</a>
							</div>
							<div class="item-description">
								<h4><a href="/ebooks/${publicacionMVE.url}">${publicacionMVE.titulo}</a></h4>
								<p>
									${fn:replace(publicacionMVE.descripcion, newLineChar, "<p/><p>")}
								</p>
								<ul class="project-info">
									<li><strong>Visto&nbsp;</strong>&nbsp;  ${publicacionMVE.numVisitas} veces</li>
									<c:if test="${publicacionMVE.votantes gt 0 }">					
									<li><strong>Puntos&nbsp;</strong>&nbsp; <b>${publicacionMVE.sumaPuntos}</b>&nbsp;&nbsp;(de ${publicacionMVE.votantes} votantes)</li>
									</c:if> 
								</ul>
							</div>					
        				</div>
        				</c:forEach>					
					</div>
				</div>
				<c:if test="${empty publicacion}">
				<div class="span3">
					
					<!-- start: Testimonials-->

					<div class="testimonial-container">

						<div class="title"><h3>Últimos Comentarios</h3></div>

							<div class="testimonials-carousel" data-autorotate="3000">

								<ul class="carousel">
									<c:forEach var="comentario" items="${comentarios}" varStatus="status" >	
									<li class="testimonial">
										<div class="testimonials">${fn:substring(comentario.comentario, 0, 400)}
										<c:if test="${fn:length(comentario.comentario)>400}">
										...
										</c:if>
										</div>
										<div class="testimonials-bg"></div>
										<c:choose>
										<c:when test="${comentario.publicacion.tipo eq 'EB' }">
											<div class="testimonials-author">${comentario.nombre}, en <a href="/ebooks/${comentario.publicacion.url }">${comentario.publicacion.titulo}</a></div>
										</c:when>	
										<c:otherwise>
											<div class="testimonials-author">${comentario.nombre}, en <a href="/blog/${comentario.publicacion.url }">${comentario.publicacion.titulo}</a></div>
										</c:otherwise>
										</c:choose>
									</li>
									</c:forEach>
								</ul>

							</div>

						</div>

					<!-- end: Testimonials-->
					
        		</div>
        		</c:if>
			</div>
			
			<hr>
			
			<div class="row">	
				<div class="span9">					
					<div class="title"><h3>Los artículos más leídos...</h3></div>					
					<!-- start: Row -->
		      		<div class="row">
						<c:forEach var="publicacionMVA" items="${publicacionesMVA}" varStatus="status" end="2">	
						<div class="span3">	
							<div class="picture">
								<a href="/blog/${publicacionMVA.url}" title="${publicacionMVA.titulo}">
									<c:if test="${!empty publicacionMVA.lImages }">
									<img style="width: 270px;height: 180px;" src="${publicacionMVA.lImages[0]}" alt="${publicacionMVA.titulo}"/>
									</c:if>
									<div class="image-overlay-link"></div>
								</a>
							</div>
							<div class="item-description">
								<h4><a href="/ebooks/${publicacionMVA.url}">${publicacionMVA.titulo}</a></h4>
								<p>
									${fn:replace(publicacionMVA.descripcion, newLineChar, "<p/><p>")}
								</p>
								<ul class="project-info">
									<li><strong>Visto&nbsp;</strong>&nbsp;  ${publicacionMVA.numVisitas} veces</li>
									<c:if test="${publicacionMVA.votantes gt 0 }">					
									<li><strong>Puntos&nbsp;</strong>&nbsp; <b>${publicacionMVA.sumaPuntos}</b>&nbsp;&nbsp;(de ${publicacionMVA.votantes} votantes)</li>
									</c:if> 
								</ul>
							</div>					
        				</div>
        				</c:forEach>					
					</div>
				</div>
			</div>
			
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