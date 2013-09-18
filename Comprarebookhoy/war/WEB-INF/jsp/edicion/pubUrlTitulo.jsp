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
	 %>
		<br><br><span>Tipo Ebooks</span><br><br>
		<table>
		<c:forEach var="publicacion" items="${publicacionesEbook}" varStatus="status">
		<tr>
			<td>
				<%=result.toString()%>/ebooks/${publicacion.url}
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
				<%=result.toString()%>/blog/${publicacion.url}
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
				<%=result.toString()%>/venta/extra/${publicacion.url}
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
		</table>	
		
		
		<br><br><span>Todas las descripciones</span><br><br>
		<table>
		<c:forEach var="publicacion" items="${publicacionesEbook}" varStatus="status">
		<tr>
			<td>
				${publicacion.descripcion}
			</td>
		</tr>
		</c:forEach>
		<c:forEach var="publicacion" items="${publicacionesBlog}" varStatus="status">
		<tr>
			<td>
				${publicacion.descripcion}
			</td>
		</tr>
		</c:forEach>		
		</table>
		
		
		<br><br><span>Todas las keywords</span><br><br>
		<table>
		<c:forEach var="publicacion" items="${publicacionesEbook}" varStatus="status">
		<tr>
			<td>
				${publicacion.keywords}
			</td>
		</tr>
		</c:forEach>
		<c:forEach var="publicacion" items="${publicacionesBlog}" varStatus="status">
		<tr>
			<td>
				${publicacion.keywords}
			</td>
		</tr>
		</c:forEach>		
		</table>
		
		
			
		<br><br><span>Todos las Urls
		<table>
		<c:forEach var="publicacion" items="${publicacionesEbook}" varStatus="status">
		<tr>
			<td>
				<%=result.toString()%>/ebooks/${publicacion.url}
			</td>
		</tr>
		</c:forEach>
		<c:forEach var="publicacion" items="${publicacionesBlog}" varStatus="status">
		<tr>
			<td>
				<%=result.toString()%>/blog/${publicacion.url}
			</td>
		</tr>
		</c:forEach>
		</table>
		
	
	</div>
	<%@ include file="/WEB-INF/jsp/includes/footer.jsp"%>
</html>