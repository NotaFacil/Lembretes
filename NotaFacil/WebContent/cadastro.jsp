<%@ page import="java.util.*" %>
<html>
   <head>
		<%
		String param = "";
		
		for(Enumeration e = request.getParameterNames(); e.hasMoreElements();){
			param = (String)e.nextElement();
		}
		%>
	</head>
	<body onload="document.confirmar.submit();">
		<form name="confirmar" method="POST" action="confirmarCadastro.do" >
		  <input name="confirmar" type="hidden" value="<%= param %>">
		</form>
	</body>
</html>