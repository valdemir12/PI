<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Cadastrar</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>

<%@ page import="classes.Banco" %>
<%@ page import="classes.Vagas" %>

<%
	try{
	
	String gravar= request.getParameter("descricao");	
	if(gravar!=null || gravar.equals("")==false)
	{
		
		Vagas vg=new Vagas();
		vg.setDescricao(request.getParameter("descricao"));
		vg.setRequisitosObrigatorios(request.getParameter("requisitosObrigatorios"));
		vg.setRequisitosDesejaveis(request.getParameter("requisitosDesejaveis"));
		vg.setRemuneracao(request.getParameter("remuneracao"));
		vg.setBeneficios(request.getParameter("beneficios"));
		vg.setLocalDeTrabalho(request.getParameter("localDeTrabalho"));
		vg.setAberta(
				Integer.parseInt(
						request.getParameter("aberta")
						)
				);

		Banco bd=new Banco();		
		bd.inserir(vg);
		response.sendRedirect("./listar.jsp");
		
	}
	}catch(Exception e){		}
	finally{ }

%>
<div class="container">
<a href="./index.jsp"> Home</a>
<a href="./editar.jsp"> Editar</a>
<a href="./excluir.jsp"> Excluir</a>

<a href="./listar.jsp?lista=0"> Listar Fechadas</a>
<a href="./listar.jsp?lista=1"> Listar Abertas</a>
<a href="./listar.jsp"> Listar Todas</a> <p>
</div>

<form action="./gravar.jsp" method="post">
	ID: <input type="number" name="id" value="" disabled > <br> <p>
	Descrição : <input type="text" name="descricao" required ><br>	<p>
	Requisitos Obrigatórios: <input type="text" name="requisitosObrigatorios" required><br> <p>
	Requisitos Desejáveis:<input type="text" name="requisitosDesejaveis" required><br> <p>
	Remuneração:<input type="number" name="remuneracao" required><br> <p>
	Benefícios:<input type="text" name="beneficios" required><br> <p>
	Local de Trabalho:<input type="text" name="localDeTrabalho" required><br> <p>
	Aberta:<input type="number" name="aberta" required><br> <p>
	
	<input type="submit" value="Enviar" onclick="alert('Vaga incluída com sucesso')">
	
</form>


</body>
</html>