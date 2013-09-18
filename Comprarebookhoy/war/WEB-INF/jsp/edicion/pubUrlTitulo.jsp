<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<html lang="es">

	<%@ include file="/WEB-INF/jsp/includes/header.jsp"%>
	
	<!-- start: Page Title -->
	<div>
		<span>Tipo Ebook</span>
		<table>
		<c:forEach var="publicacion" items="${publicacionesEbook}" varStatus="status">
		<tr>
			<td>
				${publicacion.url}
			</td>
			<td>
				${publicacion.titulo}
			</td>
		</tr>
		</c:forEach>
		</table>
	</div>
	
	<div>
		<span>Tipo Blog</span>
		<table>
		<c:forEach var="publicacion" items="${publicacionesBlog}" varStatus="status">
		<tr>
			<td>
				${publicacion.url}
			</td>
			<td>
				${publicacion.titulo}
			</td>
		</tr>
		</c:forEach>
		</table>
	</div>
	
	<div>
		<span>Tipo Extra</span>
		<table>
		<c:forEach var="publicacion" items="${publicacionesExtra}" varStatus="status">
		<tr>
			<td>
				${publicacion.url}
			</td>
			<td>
				${publicacion.titulo}
			</td>
		</tr>
		</c:forEach>
		</table>
	</div>

	<%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>
</html>