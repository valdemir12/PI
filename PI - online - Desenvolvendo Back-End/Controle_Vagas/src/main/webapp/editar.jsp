<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Alteração</title>
</head>
<body>

<%@ page import="classes.Banco" %>
<%@ page import="classes.Vagas" %>

<a href="./index.jsp"> Home </a>
<a href="./gravar.jsp"> Gravar</a>

<a href="./listar.jsp?lista=0"> Listar Fechadas</a>
<a href="./listar.jsp?lista=1"> Listar Abertas</a>
<a href="./listar.jsp"> Listar Todas</a>



<%

	Banco bd=new Banco();
	Vagas vg=null;
	int id=0;
	
	try{
	
		id = Integer.parseInt(request.getParameter("id"));	
		vg=bd.buscar(id);
		if(vg.getId()<0 || vg==null)
		{
			 response.sendRedirect("./listar.jsp");
		}
		
	
	}catch(Exception e){}
	
	
	try{
		String gravar=request.getParameter("descricao");	
		if(gravar!=null || gravar.equals("")==false)
		{
			vg=new Vagas();
			vg.setDescricao(request.getParameter("descricao"));
			vg.setRequisitosObrigatorios(request.getParameter("requisitosObrigatorios"));
			vg.setRequisitosDesejaveis(request.getParameter("requisitosDesejaveis"));
			vg.setRemuneracao(request.getParameter("remuneracao"));
			vg.setBeneficios(request.getParameter("beneficios"));
			vg.setLocalDeTrabalho(request.getParameter("localDeTrabalho"));
			vg.setAberta(Integer.parseInt(request.getParameter("aberta")));
			vg.setId(id);
			
			bd.editar(vg);
			response.sendRedirect("./listar.jsp");
		}
		}catch(Exception e){	out.println("Erro em Editar JSP");	}
		finally{ }
	

%>

<h1>Editar</h1>
<form action="editar.jsp?id=<%=id%>" method="post">
	ID: <input type="text" name="id" id="id" disabled ><br>
	Descrição : <input type="text" name="descricao" id="descricao"><br>	
	Requisitos Obrigatórios: <input type="text" name="requisitosObrigatorios" id="requisitosObrigatorios"><br>
	Requisitos Desejáveis:<input type="text" name="requisitosDesejaveis" id="requisitosDesejaveis"><br>
	Remuneração:<input type="text" name="remuneracao" id="remuneracao"><br>
	Benefícios:<input type="text" name="beneficios" id="beneficios"><br>
	Local de Trabalho:<input type="text" name="localDeTrabalho" id="localDeTrabalho"><br>
	Aberta:<input type="text" name="aberta" id="aberta"><br>
	<input type="submit" value="Enviar">
</form>


<script>

	document.getElementsByName("id")[0].value="<%=vg.getId()%>";
	document.getElementsByName("descricao")[0].value="<%=vg.getDescricao()%>";
	document.getElementsByName("requisitosObrigatorios")[0].value="<%=vg.getRequisitosObrigatorios()%>";
	document.getElementsByName("requisitosDesejaveis")[0].value="<%=vg.getRequisitosDesejaveis()%>";
	document.getElementsByName("remuneracao")[0].value="<%=vg.getRemuneracao()%>";
	document.getElementsByName("beneficios")[0].value="<%=vg.getBeneficios() %>";
	document.getElementsByName("localDeTrabalho")[0].value="<%=vg.getLocalDeTrabalho()%>";
	document.getElementsByName("aberta")[0].value="<%=vg.getAberta()%>";
	
</script>



</body>
</html>