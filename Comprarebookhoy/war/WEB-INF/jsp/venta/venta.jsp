<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
</head>
<body onload="window.location.href = '${publicacion.script}'">
<noscript>
Por favor, haz click <a href="${publicacion.script}">aquí</a> para acceder a la página de compra del producto.
</noscript>
<img src="${publicacion.script2}" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
</body>
</html>