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
				<c:choose>
				<c:when test="${empty user}">
				   <div id="msg"></div>				
		           <h2><i class="ico-keynote ico-white"></i><a id="login" href="#" class="btn login">Login para editores</a></h2>
		        </c:when>
				<c:otherwise>
					<h2><i class="ico-keynote ico-white"></i><a id="logout" href="#" class="btn logout">Logout</a></h2>
				</c:otherwise>
				</c:choose>
			</div>
			<!-- end: Container  -->

		</div>	

	</div>
		<!--start: Wrapper -->
	<div id="wrapper">
				
		<!--start: Container -->
    	<div class="container">
				<label>Tienes que estar dado de alta como editor para poder crear nuevas publicaciones</label>
		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>
<script src="/js/login.js"></script>

</body>
</html>