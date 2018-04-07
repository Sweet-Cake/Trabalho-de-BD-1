<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, Dao.*, java.util.*,model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="css/estilo.css"/>
	<title>APURAÇÃO</title>
</head>
<body>
	<script language="javascript" type="text/javascript">
		function validar() {
		var nota = form1.Nota.value;
		if (nota<= 0 || nota>10) {
		alert('algo esta errado');
		form1.Nota.focus();
		return false;
		}
		}
	</script>
	</script>
	<h1 align="center">APURAÇÃO 2018</h1>
<div class="container">
	<table>
	<form method="post" action="./controleWeb" name="form1">
		<tr>
			<td>
				<label>ESCOLA:</label>
				<Select name="Escola">
				<%
					Lista list=new Lista();
					List<Escola> escola = list.ListaEscola();
					for(Escola e: escola){
				%>
					<option value="<%=e.getNome()%>"><%=e.getNome()%></option>
				<%
				}
				%>
				</Select>
			</td>
	</tr>
	<tr>
		<td>
			<label >JURADO:</label>
			<Select name="Jurado">
				<%
					Lista listaJ=new Lista();
					List<Jurado> jurado = listaJ.ListaJurado();
					for(Jurado j: jurado){
				%>
					<option value="<%=j.getNome()%>"><%=j.getNome()%></option>
				<%
				}
				%>
			</Select>
		</td>
	</tr>
	<tr>
		<td>
			<label>QUESITO:</label>
			<Select name="Quesito">
				<%
					Lista listaQ=new Lista();
					List<Quesito> quesito = listaQ.ListaQuesito();
					for(Quesito q: quesito){
				%>
					<option value="<%=q.getNome()%>"><%=q.getNome()%></option>
				<%
				}
				%>
			</Select>
		</td>
	</tr>
	<tr>
		<td>
			<input class="input"type="text" name="Nota" placeholder="Nota:"/>
			<input class="botao" type="submit" value="Inserir" name="cmd" onclick="return validar()"/>
		</td>
	</tr>
	<tr>
		<td>
			<input class="botao" type="submit" value="VerQuesito" name="cmd"/>
			<input class="botao" type="submit" value="VerTotal" name="cmd"/>
		</td>
		</form>
	</tr>
	</table>
</div>
</body>
</html>