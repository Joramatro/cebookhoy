<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page isELIgnored="false"%>
<%@ page isErrorPage="true" import="java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Channel Error</title>
		<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <style>
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
        </style>

	</head>
	<body>
		

		<div class="lbox">
			<%@ page isErrorPage="true" import="java.io.*" %>
	
			An unexcepted error occurred. The exception trace is:
	
			<%-- Exception Handler --%>
	
			<%= exception.toString() %><br></br>
	
	
			<%
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			exception.printStackTrace(pw);
			out.print(sw);
			sw.close();
			pw.close();
			%>
			<br/> <br/>
			<p>Please report this trace to <a href="mailto:admin@roomchannel.com">administrator</a></p>
		</div>

	
	</body>
</html>