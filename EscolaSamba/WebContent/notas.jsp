<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, Dao.*, java.util.*,model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="css/estilo.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>VENDO QUESITOS</title>
</head>
<body>
  <form method="post" action="./controleBotao">
 					<input class="botao" id="voltar" type="submit" value="Voltar" name="cmd"/>
 					<h1 align="center">Vendo Quesito...</h1>
				    <table>
				    <tr>
				    <td><td>
				    <td>
				  	
				    <Select name="Quesito" id="selectNota" >
				    <%
				    int id;
				    String ids = (String)session.getAttribute("QUESITO");
				    String msg = "";
				    if (ids == null)
				    	id = 1;
				    else
				    	id = Integer.parseInt(ids);
				    Lista listaQ=new Lista();
					List<Quesito> quesito = listaQ.ListaQuesito();
					for(Quesito q: quesito){
						 if (id == q.getId())
		   					 msg = q.getNome();
					%>
						<option value="<%=q.getId()%>"><%=q.getNome()%></option>
					<%
					}
					%>
				    </Select>
				    </td>
				    <td>
				    <input class="botao" id="mostra" type="submit" value="Mostrar" name="cmd"/>
				    </form>
				    </td>
				    </tr>
				    </table>
				    <h3 align="center">Notas para <%= msg %>:</h3>
				    	<table id="myTable" style="margin-left:0%;">
							<tr>
								<th>Escola</th>
								<th>Nota 1</th>
								<th>Nota 2</th>
								<th>Nota 3</th>
								<th>Nota 4</th>
								<th>Nota 5</th>
								<th>Maior Descartada</th>
								<th>Menor Descartada</th>
								<th>Total</th>
							</tr>
							<%
							    Lista listan=new Lista();
								List<NotaQuesito> nota = listan.listaNotas(id);
								for(NotaQuesito nq: nota){
							%>
								<tr>
									<td><%=nq.getEscola()%></td>
									<td><%=nq.getN1()%></td>
									<td><%=nq.getN2()%></td>
									<td><%=nq.getN3()%></td>
									<td><%=nq.getN4()%></td>
									<td><%=nq.getN5()%></td>
									<td><%=nq.getMaiorN()%></td>
									<td><%=nq.getMenorN()%></td>
									<td><%=nq.getTotal()%></td>
								</tr>
							<%
							}
								 session.setAttribute("QUESITO", null);
							%>

						</table>

</body>
</html>