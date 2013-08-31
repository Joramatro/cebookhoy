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

				<h1><i class="ico-book ico-white"></i>${publicacion.titulo}</h1>

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
					<a target="_blank" href="/venta/principal/${publicacion.url}">
					<ul class="slides">
						<c:forEach var="imagen" items="${publicacion.lImages}" varStatus="status">
						<c:if test="${status.count ne 3}">
							<li>
								<img style="width: 420px;height: 420px;" src="${imagen}"  alt="${publicacion.titulo}" />
								<div class="slide-caption n">
									<h3>${publicacion.titulo2}</h3>
								</div>
							</li>
						</c:if>
						</c:forEach>
					</ul>
					</a>
				</div>
			</div>
			<!-- end: Flexslider -->
			
			<hr>
			
			<% pageContext.setAttribute("newLineChar", "\n"); %>
			<!-- start: Row -->
			<div class="row">
				
				<div class="span2">					
					<ul class="project-info" style="font-size: 12px;">
						<li><strong>Número visitas&nbsp;</strong>&nbsp;  ${publicacion.numVisitas}</li>
						<c:if test="${publicacion.sumaPuntos gt 0 }">
							<li><strong>Puntos&nbsp;</strong>&nbsp; 
							<a href="#comments"><b>${publicacion.sumaPuntos}</b></a>
							&nbsp;&nbsp;(de ${publicacion.votantes} votantes)</li> 
						</c:if>
						<li><strong>Fecha&nbsp;</strong>&nbsp; <fmt:setLocale value="es_ES" scope="session"/><fmt:formatDate type="date" dateStyle="long" value="${publicacion.fechaCreacion}"/></li>
						<li><strong>Autor&nbsp;</strong>&nbsp; <a target="_blank" href="https://plus.google.com/u/0/108657243775074009859?rel=author" rel=”author”>${publicacion.autor}</a></li>
					</ul>					
				</div>				
				<div class="span10">
					${publicacion.articulo}
					<br>
					<c:if test="${publicacion.disponible ne 'N'}">
						<br><a href="/venta/principal/${publicacion.url}" class="button color launch">Cómpralo Hoy</a>
					</c:if>					
					<br>															
					<!-- AddThis Button BEGIN -->
					<div class="addthis_toolbox addthis_default_style ">
					<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
					<a class="addthis_button_tweet"></a>
					<a class="addthis_button_pinterest_pinit"></a>
					<a class="addthis_counter addthis_pill_style"></a>
					<g:plusone href="/blog/${publicacion.url}" align="right" size="medium"></g:plusone>
					</div>
					<script type="text/javascript">var addthis_config = {"data_track_addressbar":false};</script>
					<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-509ce3d140135566"></script>
					<!-- AddThis Button END -->
					<!-- Botón +1. -->
					<script type="text/javascript">
					  (function() {
					    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
					    po.src = 'https://apis.google.com/js/plusone.js';
					    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
					  })();
					</script> 
					<br><br>
					<p style="font-style: italic;">Por favor, no dudes en puntuar y comentar tu opinión ó aportar más detalles en la sección de <a href="#comments">comentarios</a></p>
				</div>	
				
			</div>
			<!-- end: Row -->
									
			<hr><hr>
			
				<!-- start: Row -->
      		<div class="row">
	
				<div class="span9">
					
					<div class="title"><h3>También te puede interesar...</h3></div>
					
					<!-- start: Row -->
		      		<div class="row">
						<c:forEach var="publicacionRel" items="${publicaciones}" varStatus="status" end="2">
						<c:if test="${publicacionRel.titulo ne publicacion.titulo }">	
						<div class="span3">	
							<div class="picture">
								<a href="/blog/${publicacionRel.url}" title="${publicacionRel.titulo}">
									<c:if test="${!empty publicacionRel.lImages }">
									<img style="width: 270px;height: 180px;" src="${publicacionRel.lImages[0]}" alt="${publicacionRel.titulo}"/>
									</c:if>
									<div class="image-overlay-link"></div>
								</a>
							</div>
							<div class="item-description">
								<h4><a href="/blog/${publicacionRel.url}">${publicacionRel.titulo}</a></h4>
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
			</div>
			
			<hr><hr>
			
		<%@ include file="/WEB-INF/jsp/includes/masleidos.jsp"%>
			
			
		<div class="row" style="margin-top: 35px;">			
		<div class="span9">
		<!-- start: Comments -->
					<h4>Comentarios <span class="comments-amount">(${fn:length(publicacion.lComentarios)})</span></h4>
					<div id="comments" class="comments-sec">

						<ol class="commentlist">
						<c:forEach var="comentario" items="${publicacion.comentariosDeref}" varStatus="status">
							<li style="width: 100%;">
								<div class="comments">
									<div class="avatar">
									<c:choose>
									<c:when test="${empty comentario.gravatar }">
									<img src="http://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&s=50" alt="" width="50" height="50" border="0" /> 
									</c:when>
									<c:otherwise>
									<img src="${comentario.gravatar}" alt="" width="50" height="50" border="0" />
									</c:otherwise>
									</c:choose>
									</div>
									<div class="comment-des">
										<a title="Responder mensaje citando" href="#comments-form" onclick="javascript:replyComment('${status.count}');" style="font-size:14px;" >#${status.count}</a>
										<div class="comment-by">
										<c:choose>
										<c:when test="${empty comentario.web}">
										<strong>${comentario.nombre}</strong>
										</c:when>
										<c:otherwise>
										<a href="http://${comentario.web}"><strong>${comentario.nombre}</strong></a>
										</c:otherwise>
										</c:choose>
										<span class="reply"><span style="color:#aaa">/ </span><b>&nbsp;${comentario.puntos}</b> puntos</span><span class="date"><fmt:setLocale value="es_ES" scope="session"/><fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${comentario.fecha}"/></span></div>
										<p>
										<c:if test="${!empty comentario.comentarioReply}">
											<span style="color:#0088cc;">@${comentario.comentarioReplyNombre} &nbsp;</span><a onmouseover="document.getElementById('comment_ref_${status.count}').style.display='block'" onmouseout="document.getElementById('comment_ref_${status.count}').style.display='none';" onclick="document.getElementById('comment_ref_${status.count}').style.display='none';" class="ancla_referencia">#${comentario.comentarioReplyNbr}<span class="referencia" id="comment_ref_${status.count}" style="display:none;font-size: 13px;">${comentario.comentarioReply}</span></a> &nbsp;
										</c:if>
										
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
					<div id="comments-form">
						<form action="/blog/${publicacion.url}/nuevoComentario" id="formComment" method="post">
							<input id="nbrComment" name="nbrComment" type="hidden"/>
							<div class="field">
								<label>Nombre: <span>*</span></label>
								<input id="comNombre" type="text" name="nombre" class="text" maxlength="30"/>
							</div>

							<div class="field">
								<label>Email: (No será publicado) <span>*</span></label>
								<input id="comEmail" type="text" name="email" class="text" maxlength="40"/>
							</div>
							
							<div class="field">
								<label>Web: </label>
								<input type="text" name="web" class="text" maxlength="90"/>
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
								<div class="picture"><a href="/ebooks/${publicacionRel.url}" title="${publicacionRel.titulo}">
								<c:if test="${!empty publicacionRel.lImages }">
									<img src="${publicacionRel.lImages[0]}" alt="Detalle"/>
								</c:if>
								<div class="image-overlay-link"></div></a>
									<div class="item-description alt">
										<h5><a title="${publicacionRel.titulo}" href="/ebooks/${publicacionRel.url}">${publicacionRel.titulo}</a></h5>
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
			
			
			<div style="position: absolute;top: 1000px;left: 55px;">
				<iframe src="http://rcm-eu.amazon-adsystem.com/e/cm?t=comprarebookh-21&o=30&p=14&l=ur1&category=kindle&banner=1XW3YZKJD421WHFJ1Q02&f=ifr" width="160" height="600" scrolling="no" border="0" marginwidth="0" style="border:none;" frameborder="0"></iframe>
			</div>
			
			<div style="position: absolute;top: 198px;right: 260px;">
			<iframe src="http://rcm-eu.amazon-adsystem.com/e/cm?t=comprarebookh-21&o=30&p=20&l=ur1&category=kindlestore&banner=0J2HENEFERESCPS25YR2&f=ifr" width="120" height="90" scrolling="no" border="0" marginwidth="0" style="border:none;" frameborder="0"></iframe>
			</div>
				
				
			<%@ include file="/WEB-INF/jsp/includes/carrusel.jsp"%>					
		</div>
		<!-- end: Container  -->
	
	</div>
	<!-- end: Wrapper -->		
	
<%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>

</body>
</html>