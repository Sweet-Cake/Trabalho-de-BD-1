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
		if (nota< 5 || nota>10) {
		alert('algo esta errado');
		form1.Nota.focus();
		return false;
		}
		}
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
			</form>
	<tr>
		<td>
			<button id="myBtn">VerQuesito</button>
				<div id="myModal" class="modal">
				  <div class="modal-content">
				    <span class="close">&times;</span>
				    <h1 align="center">Vendo Quesito...</h1>
				    	<table id="myTable">
							<tr>
								<th>Escola</th>
								<th>Nota 1</th>
								<th>Nota 2</th>
								<th>Nota 3</th>
								<th>Nota 4</th>
								<th>Nota 5</th>
								<th>Maior Descartada</th>
								<th> Menor Descartada</th>
								<th>Total</th>
							</tr>
							<tr>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</table>
				  </div>
				</div>
				<script>
					var modal = document.getElementById('myModal');
					var btn = document.getElementById("myBtn");
					var span = document.getElementsByClassName("close")[0];
					btn.onclick = function() {
					    modal.style.display = "block";
					}
					span.onclick = function() {
					    modal.style.display = "none";
					}
					window.onclick = function(event) {
					    if (event.target == modal) {
					        modal.style.display = "none";
					    }
					}
				</script>
				
			<button id="myBtn2">Ver Total</button>
				<div id="myModal2" class="modal">
				  <div class="modal-content">
				    <span class="close2">&times;</span>
				    <h1 align="center">Vendo Total:</h1>
					<table id="myTable">
							<tr>
								<th>Escola</th>
								<th>Nota Total</th>
							</tr>
					</table>				    	
				    </div>
				 </div>
				<script>
					var modal2 = document.getElementById('myModal2');
					var btn2 = document.getElementById("myBtn2");
					var span2 = document.getElementsByClassName("close2")[0];
					btn2.onclick = function() {
					    modal2.style.display = "block";
					}
					span2.onclick = function() {
					    modal2.style.display = "none";
					}
					window.onclick = function(event) {
					    if (event.target == modal2) {
					        modal2.style.display = "none";
					    }
					}
				</script>
		</td>
	</tr>
	</table>
</div>
</body>
</html>