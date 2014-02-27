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
				<h1 id="_name2" itemprop="name"><i class="ico-book ico-white"></i>${publicacion.titulo}</h1>
			</div>
			<!-- end: Container  -->

		</div>	

	</div>
	<!-- end: Page Title -->
	
	<!--start: Wrapper -->
	<div itemscope itemtype="http://schema.org/Article" id="wrapper">
		<div style="display:none"><span  itemprop="url">http://www.comprarebookhoy.com/ebooks/${publicacion.url}</span><span itemprop="publisher">Comprar eBook Hoy</span></div>		
		<!--start: Container -->
    	<div class="container">
    	
			<% 
				int port = request.getServerPort();
				StringBuilder result = new StringBuilder();
				result.append(request.getScheme())
				      .append("://")
				      .append(request.getServerName());
				
				if (port != 80) {
				  result.append(':')
				        .append(port);
				}
				
				pageContext.setAttribute("separador", "-");
			%>
    		<ul class="breadcrumbs"><li class="home" itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a name="header.breadcrumb.1" href="<%=result.toString()%>" itemprop="url" title="Página principal" class="migapan"><span itemprop="title">Página principal</span></a></li>
				<li class="crumb0" itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><span>&nbsp;&gt;&nbsp;</span><a name="header.breadcrumb.2" href="<%=result.toString()%>/ebooks" itemprop="url" title="eBooks" class="migapan"><span itemprop="title">eBooks</span></a></li>
				<li class="crumb1" itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><span>&nbsp;&gt;&nbsp;</span><a name="header.breadcrumb.3" href="<%=result.toString()%>/ebooks?filtro=${fn:replace(publicacion.clase1, " ", separador)}" itemprop="url" title="${publicacion.clase1}" class="migapan"><span itemprop="title">${publicacion.clase1}</span></a></li>
				<c:if test="${not empty publicacion.clase2}">
					<li class="crumb2" itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><span>&nbsp;&gt;&nbsp;</span><a name="header.breadcrumb.4" href="<%=result.toString()%>/ebooks?filtro=${fn:replace(publicacion.clase2, " ", separador)}" itemprop="url" title="${publicacion.clase2}" class="migapan"><span itemprop="title">${publicacion.clase2}</span></a></li>				
				</c:if>
				<c:if test="${not empty publicacion.clase7}">
					<li class="crumb3" itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><span>&nbsp;&gt;&nbsp;</span><a name="header.breadcrumb.5" href="<%=result.toString()%>/ebooks?filtro=${fn:replace(publicacion.clase7, " ", separador)}" itemprop="url" title="${publicacion.clase7}" class="migapan"><span itemprop="title">${publicacion.clase7}</span></a></li>				
				</c:if>
				<c:if test="${not empty publicacion.clase3}">
					<li class="crumbPrecio" itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><span>&nbsp;&gt;&nbsp;</span><a name="header.breadcrumb.precio" href="<%=result.toString()%>/ebooks?filtroPrecio=${fn:replace(publicacion.clase3, " ", separador)}" itemprop="url" title="${publicacion.clase3}" class="migapan"><span itemprop="title">${publicacion.clase3}</span></a></li>				
				</c:if>
				<li class="crumbFinal"><span>&nbsp;&gt;&nbsp;</span>${publicacion.titulo}</li>
			</ul>    	
    		<br>
	    	<div id="banGoogle" class="iframe_wrap" style="position:absolute;margin-left: 870px;">
				<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- articulo superior recuadro ebook -->
				<ins class="adsbygoogle"
				     style="display:inline-block;width:300px;height:250px"
				     data-ad-client="ca-pub-3168560600423825"
				     data-ad-slot="4680883347"></ins>
				<script>
				(adsbygoogle = window.adsbygoogle || []).push({});
				</script>	
			</div>	
			<!-- start: Flexslider -->
			<div style="width: 550px;height: 435px; margin: 0 auto;" class="slider" >
				<div id="flex1" class="flexslider home">
					<c:if test="${publicacion.disponible eq 'S' }">
						<a target="_blank" onClick="ga('send', 'event', 'Venta', '${publicacion.url}', 'Imagen Superior');" href="/venta/principal/${publicacion.url}">
					</c:if>
					<ul class="slides">
						<c:forEach var="imagen" items="${publicacion.lImages}" varStatus="status">
						<c:if test="${status.count ne 3}">
							<li>
								<img style="width: 420px;height: 420px;" src="${imagen}"  alt="${publicacion.titulo}" />														
							</li>
						</c:if>
						</c:forEach>
						<div class="slide-caption n">
							<h3>${publicacion.titulo2}</h3>
						</div>
					</ul>
					<c:if test="${publicacion.disponible eq 'S' }">
						</a>
					</c:if>
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
							<div>
								<li><strong>Puntos&nbsp;</strong>&nbsp; 
								<a href="#comments"><b><span>${publicacion.sumaPuntos}</span></b></a>
								&nbsp;&nbsp;(de <span>${publicacion.votantes}</span> votantes)</li>								
							</div>
							<strong>Media&nbsp;</strong>&nbsp;&nbsp;<div class="rateit" data-rateit-value="${publicacion.sumaPuntos div publicacion.votantes}" data-rateit-ispreset="true" data-rateit-readonly="true" title="<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${publicacion.sumaPuntos div publicacion.votantes}" /> / 5"></div> 
						</c:if>
						<li><strong>Fecha&nbsp;</strong>&nbsp;<span id="_datePublished5" itemprop="datePublished" content="<fmt:setLocale value='es_ES' scope='session'/><fmt:formatDate type='date' dateStyle='short' value='${publicacion.fechaCreacion}'/>"> <fmt:setLocale value="es_ES" scope="session"/><fmt:formatDate type="date" dateStyle="long" value="${publicacion.fechaCreacion}"/></span></li>
						<li><strong>Autor&nbsp;</strong>&nbsp; <a target="_blank" href="${publicacion.googleAutor}" rel=”author”><span id="_author3" itemprop="author" itemscope itemtype="http://schema.org/Person">
						<span itemprop="name">${publicacion.autor}</span></span></a></li>
					</ul>					
				</div>				
				<div class="span10">
					<c:if test="${publicacion.disponible ne 'N'}">
						<h2><a id="btnComprar1" href="/venta/principal/${publicacion.url}" onClick="ga('send', 'event', 'Venta', '${publicacion.url}', 'Boton Compralo Hoy');" class="button color launch" target="_blank">¡ Cómpralo Hoy!</a></h2>				
					</c:if>
					<meta id="_articleBody7" content="${fn:replace(publicacion.articulo, "\"", "'")}">
					${publicacion.articulo}				
					<br>
					<c:if test="${publicacion.disponible ne 'N'}">
						<br><h2><a id="btnComprar2" href="/venta/principal/${publicacion.url}" onClick="ga('send', 'event', 'Venta', '${publicacion.url}', 'Boton Compralo hoy al mejor precio');" class="button color launch">¡ Cómpralo hoy al mejor precio!</a></h2>
					</c:if>					
					<br>
					<!-- AddThis Button BEGIN -->
					<div class="addthis_toolbox addthis_default_style ">
					<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
					<a class="addthis_button_tweet"></a>
					<a class="addthis_button_pinterest_pinit"></a>
					<a class="addthis_counter addthis_pill_style"></a>&nbsp;&nbsp;
					<g:plusone href="/ebooks/${publicacion.url}" align="right" size="medium"></g:plusone>
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
					<p style="font-style: italic;">Por favor, no dudes en puntuar y comentar tu opinión para aportar más detalles sobre el producto en la sección de <a href="#comments">comentarios</a></p>
				</div>	
				<div id="banGoogleFinArticulo" class="iframe_wrap" style="width: 64%; margin:0 auto;">
					<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
					<!-- fin articulo skycraper ebook -->
					<ins class="adsbygoogle"
					     style="display:inline-block;width:728px;height:90px"
					     data-ad-client="ca-pub-3168560600423825"
					     data-ad-slot="5878414947"></ins>
					<script>
					(adsbygoogle = window.adsbygoogle || []).push({});
					</script>
				</div>
			</div>
			<!-- end: Row -->
			
			
			<hr><hr>
			<div id="ttpi"></div>
				<!-- start: Row --> 
			<%@ include file="/WEB-INF/jsp/includes/masleidos.jsp"%>
			
			<hr>
			<div class="row">
				<div class="span9">
					
					<div class="title"><h3>También te puede interesar...</h3></div>
					
					<!-- start: Row -->
		      		<div class="row">
						<c:forEach var="publicacionRel" items="${publicaciones}" varStatus="status" end="2">	
						<div class="span3">	
							<div class="picture">
								<a href="/ebooks/${publicacionRel.url}" title="${publicacionRel.titulo}">
									<c:if test="${!empty publicacionRel.lImages }">
									<img style="width: 270px;height: 240px;" src="${publicacionRel.lImages[0]}" alt="${publicacionRel.titulo}"/>
									</c:if>
									<div class="image-overlay-link"></div>
								</a>
							</div>
							<div class="item-description">
								<h4><a title="${publicacionRel.titulo}" href="/ebooks/${publicacionRel.url}">${publicacionRel.titulo}</a></h4>
								<c:if test="${publicacionRel.sumaPuntos gt 0 }">
								<div class="rateit" data-rateit-value="${publicacionRel.sumaPuntos div publicacionRel.votantes}" data-rateit-ispreset="true" data-rateit-readonly="true" title="<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${publicacionRel.sumaPuntos div publicacionRel.votantes}" /> / 5"></div>
								</c:if>
								<p>
									${fn:replace(publicacionRel.descripcion, newLineChar, "<p/><p>")}
								</p>
							</div>					
        				</div>
        				</c:forEach>					
					</div>
				</div>
				
			</div>
			<hr>
			
			
			<div class="row" style="margin-top: 35px;">			
				<div class="span9">
				<!-- start: Comments -->
				 <h4>Comentarios <span class="comments-amount">(${fn:length(publicacion.lComentarios)})</span></h4>
							
				<c:choose>
				<c:when test="${publicacion.votantes gt 0}">
					<div itemscope itemtype="http://data-vocabulary.org/Review-aggregate" id="comments" class="comments-sec">
						<div style="display:none"><span  itemprop="itemreviewed">${publicacion.titulo}</span><span itemprop="votes">${publicacion.votantes}</span><span itemprop="count">${fn:length(publicacion.lComentarios)}</span><span itemprop="rating" itemscope itemtype="http://data-vocabulary.org/Rating"><span itemprop="average">${publicacion.sumaPuntos div publicacion.votantes}</span><span itemprop="best">5</span></span><img itemprop="photo" src="${publicacion.lImages[0]}" /></div>
						<ol class="commentlist">
						<c:forEach var="comentario" items="${publicacion.comentariosDeref}" varStatus="status">
							<c:if test="${comentario.publicado ne 'N'}">
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
									<div class="comment-des" itemscope itemtype="http://data-vocabulary.org/Review">
										<span style="display:none" itemprop="itemreviewed">${publicacion.titulo}</span>
										<a title="Responder mensaje citando" href="#comments-form" onclick="javascript:replyComment('${status.count}');" style="font-size:14px;" >#${status.count}</a>
										<div class="comment-by">
										<c:choose>
										<c:when test="${empty comentario.web}">
										<strong><span itemprop="reviewer">${comentario.nombre}</span></strong>
										</c:when>
										<c:otherwise>
										<a rel="nofollow" href="http://${comentario.web}"><strong><span itemprop="reviewer">${comentario.nombre}</span></strong></a>
										</c:otherwise>
										</c:choose>
										 <span class="reply"><span style="color:#aaa"><c:if test="${comentario.puntos gt 0}">/ </span><b>&nbsp;<span itemprop="rating">${comentario.puntos}</span></b> puntos</c:if></span><span class="date"><time itemprop="dtreviewed" datetime="<fmt:setLocale value='es_ES' scope='session'/><fmt:formatDate type='date' dateStyle='short' value='${comentario.fecha}'/>"><fmt:setLocale value="es_ES" scope="session"/><fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${comentario.fecha}"/></time></span></div>
										<p>
										<c:if test="${!empty comentario.comentarioReply}">
											<span style="color:#0088cc;">@${comentario.comentarioReplyNombre} &nbsp;</span><a style="display:inherit" onmouseover="document.getElementById('comment_ref_${status.count}').style.display='block'" onmouseout="document.getElementById('comment_ref_${status.count}').style.display='none';" onclick="document.getElementById('comment_ref_${status.count}').style.display='none';" class="ancla_referencia">#${comentario.comentarioReplyNbr}<span class="referencia" id="comment_ref_${status.count}" style="display:none;font-size: 13px;">${comentario.comentarioReply}</span></a> &nbsp;
										</c:if>
										
										<span itemprop="description">${fn:replace(comentario.comentario, newLineChar, "<br>")}</span>
										</p>
									</div>
								</div>		
							</li>
							</c:if>						
						</c:forEach>
						</ol>
		
					</div>
				</c:when>
				<c:otherwise>
					<div id="comments" class="comments-sec">
						<ol class="commentlist">
						<c:forEach var="comentario" items="${publicacion.comentariosDeref}" varStatus="status">
							<c:if test="${comentario.publicado ne 'N'}">
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
									<div class="comment-des" itemscope itemtype="http://data-vocabulary.org/Review">
										<span style="display:none" itemprop="itemreviewed">${publicacion.titulo}</span>
										<a title="Responder mensaje citando" href="#comments-form" onclick="javascript:replyComment('${status.count}');" style="font-size:14px;" >#${status.count}</a>
										<div class="comment-by">
										<c:choose>
										<c:when test="${empty comentario.web}">
										<strong><span itemprop="reviewer">${comentario.nombre}</span></strong>
										</c:when>
										<c:otherwise>
										<a rel="nofollow" href="http://${comentario.web}"><strong><span itemprop="reviewer">${comentario.nombre}</span></strong></a>
										</c:otherwise>
										</c:choose>
										 <span class="reply"><span style="color:#aaa"><c:if test="${comentario.puntos gt 0}">/ </span><b>&nbsp;<span itemprop="rating">${comentario.puntos}</span></b> puntos</c:if></span><span class="date"><time itemprop="dtreviewed" datetime="<fmt:setLocale value='es_ES' scope='session'/><fmt:formatDate type='date' dateStyle='short' value='${comentario.fecha}'/>"><fmt:setLocale value="es_ES" scope="session"/><fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${comentario.fecha}"/></time></span></div>
										<p>
										<c:if test="${!empty comentario.comentarioReply}">
											<span style="color:#0088cc;">@${comentario.comentarioReplyNombre} &nbsp;</span><a style="display:inherit" onmouseover="document.getElementById('comment_ref_${status.count}').style.display='block'" onmouseout="document.getElementById('comment_ref_${status.count}').style.display='none';" onclick="document.getElementById('comment_ref_${status.count}').style.display='none';" class="ancla_referencia">#${comentario.comentarioReplyNbr}<span class="referencia" id="comment_ref_${status.count}" style="display:none;font-size: 13px;">${comentario.comentarioReply}</span></a> &nbsp;
										</c:if>
										
										<span itemprop="description">${fn:replace(comentario.comentario, newLineChar, "<br>")}</span>
										</p>
									</div>
								</div>		
							</li>
							</c:if>						
						</c:forEach>
						</ol>
		
					</div>
				</c:otherwise>
				</c:choose>
					<!-- end: Comments -->
				<div class="clear" style="padding-top: 35px;"></div>

				<!-- start: Comment Add -->
				<h4>Deja un comentario</h4>
				<div class="form-spacer"></div>
				
				<!-- Form -->
				<div id="comments-form">
					<form action="/ebooks/${publicacion.url}/nuevoComentario" id="formComment" method="post">
						<input id="nbrComment" name="nbrComment" type="hidden"/>
						<div class="field">
							<label>Nombre: <span>*</span></label>
							<input id="comNombre" type="text" name="nombre" maxlength="30" class="text" />
						</div>

						<div class="field">
							<label>Email: (No será publicado) <span>*</span></label>
							<input id="comEmail" type="text" name="email" maxlength="40" class="text" />
						</div>
						
						<div class="field">
							<label>Web: </label>
							<input type="text" name="web" class="text" maxlength="90" />
						</div>							
						
						<div class="field">
							<label>Dar Puntos: </label>
							<select name="puntos" style="width: 9%;" title="Por favor, valora (5 lo mejor) este producto">
							  <option value="5">5</option>
							  <option value="4">4</option>
							  <option value="3">3</option>
							  <option value="2">2</option>
							  <option value="1">1</option>
							  <option value="0">No puntuar</option>
							</select>
						</div>

						<div class="field">
							<label>Comentario: <span>*</span></label>
							<textarea id="comComentario" name="comentario" class="text textarea" ></textarea>
						</div>
						
						<label>El comentario puede estar sujeto a moderación y tardar unos instantes en aparecer publicado una vez enviado</label>
						
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
			
								
			<%@ include file="/WEB-INF/jsp/includes/carrusel.jsp"%>					
		</div>
		<!-- end: Container  -->
	
	</div>
	<!-- end: Wrapper -->		
	
	<%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>
	<script>
		if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
			$("#banGoogle").hide();
		}
		if($('#footer').width() < 1345){
			$("#banGoogle").hide();
		}
	</script>
	<div id="banAmazonHorizontal" style="position:absolute;top:995px;left:54px;">
		<div style="margin-left: 33px; margin-bottom: 12px;"><b>OFERTAS</b></div>
			<%-- <div id="Amazon1" class="iframe_wrap">
	    		<iframe src="http://rcm-eu.amazon-adsystem.com/e/cm?lt1=_blank&bc1=EBF7F9&IS2=1&bg1=EBF7F9&fc1=666666&lc1=005580&t=comprarmicroh-21&o=30&p=8&l=as1&m=amazon&f=ifr&ref=tf_til&asins=B007HMLEAY" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>   		   		
	    	</div>
			--%>
			<div id="Amazon2prod" class="iframe_wrap">
	    		<iframe src="http://rcm-eu.amazon-adsystem.com/e/cm?t=comprarebookh-21&o=30&p=8&l=as1&asins=B00CTUKFNQ&ref=tf_til&fc1=666666&IS2=1&lt1=_blank&m=amazon&lc1=005580&bc1=EBF7F9&bg1=EBF7F9&f=ifr" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>
	    	</div>

			<div id="Amazon3prod" class="iframe_wrap">
	    		<iframe src="http://rcm-eu.amazon-adsystem.com/e/cm?t=comprarebookh-21&o=30&p=8&l=as1&asins=B00CE5C74Q&ref=tf_til&fc1=666666&IS2=1&lt1=_blank&m=amazon&lc1=005580&bc1=EBF7F9&bg1=EBF7F9&f=ifr" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>   		
	    	</div>
	    	<%--
			<div id="Amazon4prod" class="iframe_wrap">
	    		<iframe src="http://rcm-eu.amazon-adsystem.com/e/cm?t=comprarmicroh-21&o=30&p=8&l=as1&asins=B007TVJSGA&ref=tf_til&fc1=666666&IS2=1&lt1=_blank&m=amazon&lc1=005580&bc1=EBF7F9&bg1=EBF7F9&f=ifr" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>	   		
	    	</div>
	    	
			<div id="Amazon5prod" class="iframe_wrap">
	    		<iframe src="http://rcm-eu.amazon-adsystem.com/e/cm?t=comprarmicroh-21&o=30&p=8&l=as1&asins=B0055ZOY7K&ref=tf_til&fc1=666666&IS2=1&lt1=_blank&m=amazon&lc1=005580&bc1=EBF7F9&bg1=EBF7F9&f=ifr" style="width:120px;height:240px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"></iframe>	   		
	    	</div>	
	    	  --%>  		    	
	</div>
	<script>
		if($('#footer').width() < 855){
			$("#banAmazonHorizontal").hide();
		}
	</script>
	
	<div id="banAmazonEsquina" class="iframe_wrap" style="position: absolute;top: 198px;right: 260px;">
	<%-- <iframe src="http://rcm-eu.amazon-adsystem.com/e/cm?t=comprarebookh-21&o=30&p=20&l=ur1&category=kindlestore&banner=0J2HENEFERESCPS25YR2&f=ifr" width="120" height="90" scrolling="no" border="0" marginwidth="0" style="border:none;" frameborder="0"></iframe> --%>
	</div>
	<script>
		if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
			$("#banAmazonEsquina").hide();
			$(".slide-caption").hide();
		}
		if($('#footer').width() < 1345){
			$("#banAmazonEsquina").hide();
			$(".slide-caption").hide();
		}
	</script>
	<script>
	$(window).bind('resize', function () { 
		if($('#footer').width() < 1345){
			$("#banGoogle").hide();
		}else{
			$("#banGoogle").show();
		}
		if($('#footer').width() < 855){
			$("#banAmazonHorizontal").hide();
		}else{
			$("#banAmazonHorizontal").show();
		}
		if($('#footer').width() < 1345){
			$("#banAmazonEsquina").hide();
			$(".slide-caption").hide();
		}else{
			$("#banAmazonEsquina").show();
			$(".slide-caption").show();
		}
	});
	
	$(window).scroll(function(){
		if($('#footer').width() >= 855){
			if($(window).scrollTop() > 995){
				$("#banAmazonHorizontal").css("top", $(window).scrollTop());
			    if($("#banAmazonHorizontal").offset().top + $('#banAmazonHorizontal').outerHeight(true) > $("#ttpi").offset().top){
			    	$("#banAmazonHorizontal").hide();
			    }else{
			    	$("#banAmazonHorizontal").show();
			    }
			}
		}
	});
	</script>
	<script>
	
	<%if(request.getAttribute("javax.servlet.forward.request_uri").equals("/ebooks/Sony-Reader-PRS-T3")){%>
		// Define JavaScript for each page variation of this experiment.
		var pageVariations = [
		  function() {},  // Original: Do nothing. This will render the default HTML.
		  function() {    // Variation 1: boton comprar hoy los dos
			  $("#btnComprar1").text('¡ Comprar Hoy!');
			  $("#btnComprar2").text('¡ Comprar Hoy!');
		  },
		  function() {    // Variation 2: boton comprar ya los dos
			  $("#btnComprar1").text('¡ Comprar Ya!');
			  $("#btnComprar2").text('¡ Comprar Ya!');
		  },
		  function() {    // Variation 3: comprar hoy y comprar ya
			  $("#btnComprar1").text('¡ Comprar Hoy!');
			  $("#btnComprar2").text('¡ Comprar Ya!');
		  }
		];
	<%} %>
	
	jQuery(document).ready(function($){
	    $('.iframe_wrap iframe').iframeTracker({
	        blurCallback: function(){
	            // You can know which iframe element is clicked via this._overId
	        	ga('send', 'event', 'Banner', '${publicacion.url}' , this._overId);
	        },
	        overCallback: function(element){
	            this._overId = $(element).parents('.iframe_wrap').attr('id'); // Saving the iframe wrapper id
	        },
	        outCallback: function(element){
	            this._overId = null; // Reset hover iframe wrapper id
	        },
	        _overId: null
	    });
	    
	    $('#_image6').click(function() {
	    	ga('send', 'event', 'Venta', '${publicacion.url}', 'Imagen Medio');  
	    });
	    
	    $('.imageContextual').click(function() {
	    	ga('send', 'event', 'Venta', '${publicacion.url}', 'Imagen ebook');  
	    });
	    
	    $('.linkContextual').click(function() {
	    	ga('send', 'event', 'Venta', '${publicacion.url}', 'Link Contextual');  
	    });
	    
	    $('.migapan').click(function(e) {
	    	ga('send', 'event', 'Migas', 'Miga '+$(e.target).text(), $(e.target).text());  
	    });
	    
	    <%if(request.getAttribute("javax.servlet.forward.request_uri").equals("/ebooks/Sony-Reader-PRS-T3")){%>
	 	// Execute the chosen view
	    pageVariations[chosenVariation]
	    <%} %>
	});
	</script>

</body>
</html>