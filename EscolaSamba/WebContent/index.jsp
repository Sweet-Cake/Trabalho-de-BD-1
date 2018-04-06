<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, Dao.*, java.util.*,model.Escola"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="css/estilo.css"/>
	<title>APURAÇÃO</title>
</head>
<body>
	<h1 align="center">APURAÇÃO 2018</h1>
<div class="container">
	<table>
	<form method="post">
		<tr>
			<td>
				<label>ESCOLA:</label>
				<Select>
				<option>Selecione a Escola</option>
				<%
					ListaEscola list=new ListaEscola();
					List<Escola> escola = list.Lista();
					for(Escola e: escola){
				%>
					<option value="<%=e.getId()%>"><%=e.getNome()%></option>
				<%
				}
				%>
				</Select>
			</td>
	</tr>
	<tr>
		<td>
			<label>JURADO:</label>
			<Select>
				<option></option>
			</Select>
		</td>
	</tr>
	<tr>
		<td>
			<label>QUESITO:</label>
			<Select>
				<option></option>
			</Select>
		</td>
	</tr>
	<tr>
		<td>
			<input class="input"type="text" name="nota" placeholder="Nota:"/>
			<input class="botao" type="submit" value="Inserir" name="inserir"/>
		</td>
	</tr>
	<tr>
		<td>
			<input class="botao" type="submit" value="Ver Quesito" name="verQuesito"/>
			<input class="botao" type="submit" value="Ver Total" name="verTotal"/>
		</td>
		</form>
	</tr>
	</table>
</div>
	<table border="1px">
		<tr>
			<td>Nome</td>
		</tr>
		<tr>
			
		</tr>
	</table>
</body>
</html>