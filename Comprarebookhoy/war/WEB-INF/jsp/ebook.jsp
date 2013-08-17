<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="es">

	<%@ include file="/WEB-INF/jsp/includes/header.jsp"%>
	
	<!-- start: Page Title -->
	<div id="page-title">

		<div id="page-title-inner">

			<!-- start: Container -->
			<div class="container">

				<h2><i class="ico-keynote ico-white"></i>${publicacion.titulo}</h2>

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
			<div class="slider" >
				<div id="flex1" class="flexslider home">
					<ul class="slides">
						<c:forEach var="imagen" items="${publicacion.lImages}" varStatus="status" end="${fn:length(publicacion.lImages)}">
						<li>
							<img src="${imagen}" style="height:400px" alt="" />
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
						<li><strong>Número visitas&nbsp;</strong>&nbsp;  ${publicacion.numVisitas}</li>
						<c:if test="${publicacion.sumaPuntos gt 0 }">
							<li><strong>Puntos&nbsp;</strong>&nbsp; ${publicacion.sumaPuntos}</li>
						</c:if>
						<li><strong>Fecha&nbsp;</strong>&nbsp; <fmt:setLocale value="es_ES" scope="session"/><fmt:formatDate type="date" dateStyle="long" value="${publicacion.fechaCreacion}"/></li>
					</ul>
					<a href="" class="button color launch">Cómpralo Aquí</a>					
				</div>
				<% pageContext.setAttribute("newLineChar", "\n"); %>
				<div class="span10">
					
					<p>
						<span class="ico-color ico-search"></span>${fn:replace(publicacion.articulo, newLineChar, "<p/><p>")}
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
					</div>
				</div>
			</div>
			
			
	<div class="row">			
		<div class="span9">
		<!-- start: Comments -->
					<h4>Comentarios <span class="comments-amount">(${fn:length(publicacion.lComentarios)})</span></h4>
					<div class="comments-sec">

						<ol class="commentlist">
						<c:forEach var="comentario" items="${publicacion.comentariosDeref}" varStatus="status">
							<li style="width: 100%;">
								<div class="comments">
									<div class="avatar"><img src="http://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&s=50" alt="" width="50" height="50" border="0" /> </div>
									<div class="comment-des">
										<div class="comment-by"><strong>${comentario.nombre}</strong><span class="reply"><span style="color:#aaa">/ </span><b>&nbsp;${comentario.puntos}</b> puntos</span> <span class="date">${comentario.fecha}</span></div>
										<p>
										${fn:replace(comentario.comentario, newLineChar, "<p/><p>")}
										</p>
									</div>
								</div>		
							</li>
						</c:forEach>
						</ol>

					</div>
					<!-- end: Comments -->
					<div class="clear" style="padding-top: 10px;"></div>

					<!-- start: Comment Add -->
					<h4>Deja un comentario</h4>
					<div class="form-spacer"></div>
					
					<!-- Form -->
					<div id="contact-form">
						<form action="/ebooks/${publicacion.url}/nuevoComentario" id="formComment" method="post">
							
							<div class="field">
								<label>Nombre:</label>
								<input type="text" name="nombre" class="text" />
							</div>

							<div class="field">
								<label>Email: <span>*</span></label>
								<input type="text" name="email" class="text" />
							</div>
							
							<div class="field">
								<label>Puntos: <span>*</span></label>
								<select name="puntos" style="width: 6%;" title="Por favor, valora del 0 al 5 (lo mejor) a este producto en tu comentario">
								  <option value="0">0</option>
								  <option value="1">1</option>
								  <option value="2">2</option>
								  <option value="3">3</option>
								  <option value="4">4</option>
								  <option value="5">5</option>
								</select>
							</div>

							<div class="field">
								<label>Comentario: <span>*</span></label>
								<textarea name="comentario" class="text textarea" ></textarea>
							</div>
							
							<label>El comentario puede tardar unos instantes en aparecer publicado una vez enviado</label>
							
							<div class="field">
							<br>
								<input type="button" id="send" value="Enviar" onclick="this.form.submit()"/>
							</div>
							<input name="url" type="hidden" value="${publicacion.url}"/>

						</form>
						
					</div>		

					<!-- end: Comment Add -->
			</div>
		</div>		
					
							
					<br><br>					
					<div class="title"><h3>También te puede interesar...</h3></div>					
			
    				<div class="container">
    					<div id="portfolio-wrapper" class="row">
						<c:forEach var="publicacionRel" items="${publicaciones}" varStatus="status" end="3">
							<c:if test="${publicacionRel.titulo ne publicacion.titulo }">				
							<div class="span4 portfolio-item nature people">
								<div class="picture"><a href="/ebooks/${publicacionRel.url}" title="${publicacionRel.titulo}">
								<c:if test="${!empty publicacionRel.lImages }">
									<img src="${publicacionRel.lImages[0]}" alt="Detalle"/>
								</c:if>
								<div class="image-overlay-link"></div></a>
									<div class="item-description alt">
										<h5><a href="project.html">${publicacionRel.titulo}</a></h5>
										<p>
											${fn:replace(publicacionRel.resumen, newLineChar, "<p/><p>")}
										</p>
									</div>
									<div class="post-meta"><span><i class="mini-ico-calendar"></i><fmt:setLocale value="es_ES" scope="session"/><fmt:formatDate type="date" dateStyle="long" value="${publicacionRel.fechaCreacion}"/></span><span style="visibility:hidden"><i class="mini-ico-user"></i>  <a href="#">Jorge Amat</a></span> <span><i class="mini-ico-comment"></i><a href="#">${fn:length(publicacionRel.lComentarios)} comments</a></span></div>
								</div>	
							</div>
							</c:if>
						</c:forEach>
						</div>
					</div>						
		</div>
		<!-- end: Container  -->
	
	</div>
	<!-- end: Wrapper -->		
	
<%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>

</body>
</html>