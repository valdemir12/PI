<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%@ page import="classes.Banco" %>

<%
	int id = 0;	
	try{
		id = Integer.parseInt(request.getParameter("id"));
		Banco bd=new Banco();
		bd.excluir(id);				
	}catch(Exception e)
	{		}

		
	    response.sendRedirect("./listar.jsp");
%>

<a href="./index.jsp"> Home </a>
<a href="./gravar.jsp"> Gravar</a>
<a href="./editar.jsp"> Editar</a>
<a href="./excluir.jsp"> Excluir</a>


<a href="./listar.jsp?lista=0"> Listar Fechadas</a>
<a href="./listar.jsp?lista=1"> Listar Abertas</a>
<a href="./listar.jsp"> Listar Todas</a>


</body>
</html>