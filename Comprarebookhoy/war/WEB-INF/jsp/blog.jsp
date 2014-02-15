<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es">

<%@ include file="/WEB-INF/jsp/includes/header.jsp"%>

	<div id="page-title">

		<div id="page-title-inner">

			<!-- start: Container -->
			<div class="container">

				<h1><i class="ico-lightbulb ico-white"></i>Blog</h1>

			</div>
			<!-- end: Container  -->

		</div>	

	</div>
	<!-- end: Page Title -->
	<% pageContext.setAttribute("separadorClase", "-"); %>
	<!--start: Wrapper-->
	<div id="wrapper">
		<div id="banGoogleETop" class="iframe_wrap" style="width: 54%;margin: -16px auto;">
			<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
			<!-- superior 2 skycraper ebook -->
			<ins class="adsbygoogle"
			     style="display:inline-block;width:728px;height:90px"
			     data-ad-client="ca-pub-3168560600423825"
			     data-ad-slot="7494748940"></ins>
			<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
			</script>
		</div>		
		<!-- start: Container -->	
		<div class="container">

			<div id="filters" style="margin-top: 15px;">
				<ul id="optionSet1" class="option-set" data-option-key="filter">
					<li><a href="#filter" class="selected" data-option-value="*">Todos</a></li>
					<c:forEach var="categoria" items="${categorias}" varStatus="status" >
						<li><a href="#filter" class='${fn:replace(categoria, " ", separadorClase)}' data-option-value=".${fn:replace(categoria, " ", separadorClase)}">${categoria}</a></li>
					</c:forEach>
				</ul>
			</div> 
		</div>
		<!-- end: Container  -->
				
		<!--start: Container -->
    	<div class="container">
			<!-- start: articulo -->
			<div id="portfolio-wrapper" class="row">
				<% pageContext.setAttribute("newLineChar", "\n"); %>
				<c:forEach var="publicacion" items="${publicaciones}" varStatus="status" >				
				<div class="span4 portfolio-item ${fn:replace(publicacion.clase1, " ", separadorClase)} ${fn:replace(publicacion.clase2, " ", separadorClase)}">
					<div class="picture"><a href="/blog/${publicacion.url}" title="${publicacion.titulo}">
					
					<c:if test="${!empty publicacion.lImages }">
					<img pagespeed_no_defer="" src="${publicacion.lImages[0]}" alt="${publicacion.titulo}"/>
					</c:if>
					
					<div class="image-overlay-link"></div></a>
						<div class="item-description alt">
							<h5><a title="${publicacion.titulo}" href="/blog/${publicacion.url}">${publicacion.titulo}</a></h5>
							<p>
								${fn:replace(publicacion.resumen, newLineChar, "<p/><p>")}
							</p>
						</div>
						<div class="post-meta"><span><i class="mini-ico-calendar"></i><fmt:setLocale value="es_ES" scope="session"/><fmt:formatDate type="date" dateStyle="long" value="${publicacion.fechaCreacion}"/></span><%--<span style=""> <i class="mini-ico-user"></i>  <a href="/blog/${publicacion.url}">Jorge Amat</a>--%></span> <span><i class="mini-ico-comment"></i><a href="/blog/${publicacion.url}/#comments">${fn:length(publicacion.lComentarios)} comentarios</a></span></div>
					</div>	
				</div>
				</c:forEach>
			</div>
			<!-- end: articulo -->
			
			<div class="clear" style="padding-top: 25px;"></div>
			<div id="banGoogleMasVistos" style="margin-bottom: 25px;" class="iframe_wrap">
				<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				<!-- rectangulo abajo ebook -->
				<ins class="adsbygoogle"
				     style="display:inline-block;width:300px;height:250px"
				     data-ad-client="ca-pub-3168560600423825"
				     data-ad-slot="1448215346"></ins>
				<script>
				(adsbygoogle = window.adsbygoogle || []).push({});
				</script>
			</div>			
			<%@ include file="/WEB-INF/jsp/includes/masleidos.jsp"%>			
			
      	
      		<%@ include file="/WEB-INF/jsp/includes/carrusel.jsp"%>
		</div>
		<!--end: Container-->
				
	</div>
	<!-- end: Wrapper  -->
	
<%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>
<script>
	if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
		$("#banGoogleVistos").hide();
	}
</script>
<script>
	jQuery(document).ready(function($){
	    $('.iframe_wrap iframe').iframeTracker({
	        blurCallback: function(){
	            // You can know which iframe element is clicked via this._overId
	        	ga('send', 'event', 'Banner', 'blog' , this._overId);
	        },
	        overCallback: function(element){
	            this._overId = $(element).parents('.iframe_wrap').attr('id'); // Saving the iframe wrapper id
	        },
	        outCallback: function(element){
	            this._overId = null; // Reset hover iframe wrapper id
	        },
	        _overId: null
	    });
	    
	    function getURLParameter(name) {
	        return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search)||[,""])[1].replace(/\+/g, '%20'))||null;
	    }
	    
	    if (getURLParameter("filtro")!=null){
	    	$('#optionSet1 .selected').removeClass('selected');
	    	$('#optionSet1 .'+getURLParameter("filtro")).addClass('selected');
	    	$('#portfolio-wrapper').isotope({ filter: '.'+ getURLParameter("filtro")});
	    }
	});
</script>

</body>
</html>				