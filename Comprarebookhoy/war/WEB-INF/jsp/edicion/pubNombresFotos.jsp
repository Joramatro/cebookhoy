<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<html lang="es">

	<%@ include file="/WEB-INF/jsp/includes/header.jsp"%>
	
	<!-- start: Page Title -->
	<div class="container">	
		<br><br><span>Nombres fotos</span><br><br>
		<table>
		<c:forEach var="nombreFoto" items="${pubNombresFotos}" varStatus="status">
		<tr>
			<td>
				${nombreFoto}
			</td>
		</tr>
		</c:forEach>
		</table>
		<br><br><span>Urls fotos</span><br><br>
		<table>
		<c:forEach var="url" items="${pubUrlsFotos}" varStatus="status">
		<tr>
			<td>
				${url}
			</td>
		</tr>
		</c:forEach>
		</table>
		<br><br><span>Keys fotos</span><br><br>
		<table>
		<c:forEach var="key" items="${pubKeysFotos}" varStatus="status">
		<tr>
			<td>
				${key}
			</td>
		</tr>
		</c:forEach>
		</table>
	</div>

	<%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>
</html>