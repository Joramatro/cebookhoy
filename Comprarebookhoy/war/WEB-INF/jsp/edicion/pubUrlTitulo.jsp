<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<html lang="es">

	<%@ include file="/WEB-INF/jsp/includes/header.jsp"%>
	<style>
	table td{
		padding-left: 20px;
	}
	</style>
	<!-- start: Page Title -->
	<div class="container">
	
	
		<br><br><span>Tipo Principal</span><br><br>
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
	
	
	
		<br><br><span>Tipo Blog</span><br><br>
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
	
	
	
		<br><br><span>Tipo Extra</span><br><br>
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
	
	
		
		<br><br><span>Todos los titulos</span><br><br>
		<table>
		<c:forEach var="publicacion" items="${publicacionesEbook}" varStatus="status">
		<tr>
			<td>
				${publicacion.titulo}
			</td>
		</tr>
		</c:forEach>
		<c:forEach var="publicacion" items="${publicacionesBlog}" varStatus="status">
		<tr>
			<td>
				${publicacion.titulo}
			</td>
		</tr>
		</c:forEach>
		<c:forEach var="publicacion" items="${publicacionesExtra}" varStatus="status">
		<tr>
			<td>
				${publicacion.titulo}
			</td>
		</tr>
		</c:forEach>
		</table>
		
		<br><br><span>Todas URLS</span><br><br>
		<table>
		<c:forEach var="publicacion" items="${publicacionesEbook}" varStatus="status">
		<tr>
			<td>
				${publicacion.url}
			</td>
		</tr>
		</c:forEach>
		<c:forEach var="publicacion" items="${publicacionesBlog}" varStatus="status">
		<tr>
			<td>
				${publicacion.url}
			</td>
		</tr>
		</c:forEach>
		<c:forEach var="publicacion" items="${publicacionesExtra}" varStatus="status">
		<tr>
			<td>
				${publicacion.url}
			</td>
		</tr>
		</c:forEach>		
		
		</table>
	
	</div>
	<%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>
</html>