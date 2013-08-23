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

				<h2><i class="ico-book ico-white"></i>${publicacion.titulo}</h2>

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
			<div style="width: 550px;height: 435px; margin: 0 auto;" class="slider" >
				<div id="flex1" class="flexslider home">
					<a target="_blank" href="${publicacion.script}">
					<ul class="slides">
						<c:forEach var="imagen" items="${publicacion.lImages}" varStatus="status" end="${fn:length(publicacion.lImages)}">
						<li>
							<img style="width: 420px;height: 420px;" src="${imagen}"  alt="${publicacion.titulo}" />
							<div class="slide-caption n">
								<h3>${publicacion.titulo2}</h3>
							</div>
						</li>
						</c:forEach>
					</ul>
					</a>
					<img src="${publicacion.script2}" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
				</div>
			</div>
			<!-- end: Flexslider -->
			
			<hr>
			
			<% pageContext.setAttribute("newLineChar", "\n"); %>
			<!-- start: Row -->
			<div class="row">
				
				<div class="span2">					
					<ul class="project-info">
						<li><strong>Número visitas&nbsp;</strong>&nbsp;  ${publicacion.numVisitas}</li>
						<c:if test="${publicacion.sumaPuntos gt 0 }">
							<li><strong>Puntos&nbsp;</strong>&nbsp; 
							<a target="_blank" href="${publicacion.script}"><b>${publicacion.sumaPuntos}</b></a>
							<img src="${publicacion.script2}" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
							&nbsp;&nbsp;(de ${publicacion.numComentarios} votantes)</li> 
						</c:if>
						<li><strong>Fecha&nbsp;</strong>&nbsp; <fmt:setLocale value="es_ES" scope="session"/><fmt:formatDate type="date" dateStyle="long" value="${publicacion.fechaCreacion}"/></li>
						<li><strong>Autor&nbsp;</strong>&nbsp;  ${publicacion.autor}</li>
					</ul>					
				</div>				
				<div class="span10">
					${publicacion.articulo}
					<br>
					<br><a href="${publicacion.script}" class="button color launch">Cómpralo Aquí</a>
					<img src="${publicacion.script2}" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
					<br>
					<!-- AddThis Button BEGIN -->
					<div class="addthis_toolbox addthis_default_style ">
					<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
					<a class="addthis_button_tweet"></a>
					<a class="addthis_button_pinterest_pinit"></a>
					<a class="addthis_counter addthis_pill_style"></a>
					</div>
					<script type="text/javascript">var addthis_config = {"data_track_addressbar":false};</script>
					<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-509ce3d140135566"></script>
					<!-- AddThis Button END -->
				</div>	
				
			</div>
			<!-- end: Row -->
			
			
			<hr>
			
			
			
	<div class="row">			
		<div class="span9">
		<!-- start: Comments -->
					<h4>Comentarios <span class="comments-amount">(${fn:length(publicacion.lComentarios)})</span></h4>
					<div id="comments" class="comments-sec">

						<ol class="commentlist">
						<c:forEach var="comentario" items="${publicacion.comentariosDeref}" varStatus="status">
							<li style="width: 100%;">
								<div class="comments">
									<div class="avatar"><img src="http://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&s=50" alt="" width="50" height="50" border="0" /> </div>
									<div class="comment-des">
										<div class="comment-by">
										<c:choose>
										<c:when test="${empty comentario.web}">
										<strong>${comentario.nombre}</strong>
										</c:when>
										<c:otherwise>
										<a href="http://${comentario.web}"><strong>${comentario.nombre}</strong></a>
										</c:otherwise>
										</c:choose>
										<span class="reply"><span style="color:#aaa">/ </span><b>&nbsp;${comentario.puntos}</b> puntos</span> <span class="date"><fmt:setLocale value="es_ES" scope="session"/><fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${comentario.fecha}"/></span></div>
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
					<div class="clear" style="padding-top: 35px;"></div>

					<!-- start: Comment Add -->
					<h4>Deja un comentario</h4>
					<div class="form-spacer"></div>
					
					<!-- Form -->
					<div id="contact-form">
						<form action="/blog/${publicacion.url}/nuevoComentario" id="formComment" method="post">
							
							<div class="field">
								<label>Nombre: <span>*</span></label>
								<input id="comNombre" type="text" name="nombre" class="text" />
							</div>

							<div class="field">
								<label>Email: (No será publicado) <span>*</span></label>
								<input id="comEmail" type="text" name="email" class="text" />
							</div>
							
							<div class="field">
								<label>Web: </label>
								<input type="text" name="web" class="text" />
							</div>							
							
							<div class="field">
								<label>Puntos: </label>
								<select name="puntos" style="width: 6%;" title="Por favor, valora (5 lo mejor) este producto">
								  <option value="0"></option>
								  <option value="1">1</option>
								  <option value="2">2</option>
								  <option value="3">3</option>
								  <option value="4">4</option>
								  <option value="5">5</option>
								</select>
							</div>

							<div class="field">
								<label>Comentario: <span>*</span></label>
								<textarea id="comComentario" name="comentario" class="text textarea" ></textarea>
							</div>
							
							<label>El comentario puede tardar unos instantes en aparecer publicado una vez enviado</label>
							
							<div class="field">
							<br>
								<input type="button" id="send" value="Enviar" onclick="if(validarComentarios()){this.form.submit()}"/>
							</div>
							<input name="url" type="hidden" value="${publicacion.url}"/>

						</form>
						
					</div>		

					<!-- end: Comment Add -->
			</div>
		</div>		
					
							
					<br><br>					
				<%--<div class="title"><h3>También te puede interesar...</h3></div>					
			
    				 <div class="container">
    					<div id="portfolio-wrapper" class="row">
						<c:forEach var="publicacionRel" items="${publicaciones}" varStatus="status" end="6">
							<c:if test="${publicacionRel.titulo ne publicacion.titulo }">				
							<div class="span4 portfolio-item nature people">
								<div class="picture"><a href="/blog/${publicacionRel.url}" title="${publicacionRel.titulo}">
								<c:if test="${!empty publicacionRel.lImages }">
									<img src="${publicacionRel.lImages[0]}" alt="Detalle"/>
								</c:if>
								<div class="image-overlay-link"></div></a>
									<div class="item-description alt">
										<h5><a title="${publicacionRel.titulo}" href="/blog/${publicacionRel.url}">${publicacionRel.titulo}</a></h5>
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
					</div>--%>
					
								<!-- start: Row -->
      		<div class="row">
	
				<div class="span9">
					
					<div class="title"><h3>También te puede interesar...</h3></div>
					
					<!-- start: Row -->
		      		<div class="row">
						<c:forEach var="publicacionRel" items="${publicaciones}" varStatus="status" end="6">
						<c:if test="${publicacionRel.titulo ne publicacion.titulo }">	
						<div class="span3">	
							<div class="picture">
								<a href="/blog/${publicacionRel.url}" rel="image" title="${publicacionRel.titulo}">
									<c:if test="${!empty publicacionRel.lImages }">
									<img style="width: 270px;height: 180px;" src="${publicacionRel.lImages[0]}" alt="${publicacionRel.titulo}"/>
									</c:if>
									<div class="image-overlay-zoom"></div>
								</a>
							</div>
							<div class="item-description">
								<h4><a href="/blog/${publicacionRel.url}">${publicacion.titulo}</a></h4>
								<p>
									${fn:replace(publicacionRel.descripcion, newLineChar, "<p/><p>")}
								</p>
							</div>					
        				</div>
        				</c:if>
        				</c:forEach>					
					</div>
				</div>
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
										<div class="testimonials-author">${comentario.nombre}</div>
									</li>
									</c:forEach>
								</ul>

							</div>

						</div>

					<!-- end: Testimonials-->
					
        		</div>
			</div>
									
		</div>
		<!-- end: Container  -->
	
	</div>
	<!-- end: Wrapper -->		
	
<%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>

</body>
</html>