<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, Dao.*, java.util.*,model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="css/estilo.css"/>
	<title>APURA��O</title>
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
	<h1 align="center">APURA��O 2018</h1>
<div class="container">
	<table>
	<form method="post" action="./controleWeb" name="form1">
		<tr>
			<td>
				<label>ESCOLA:</label>
				<Select name="Escola" id="Escola">
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
			<Select name="Jurado" id="Jurado">
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
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
			<Select name="Quesito" id="Quesito">
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
			<input class="botao" id="Insert" type="submit" value="Inserir" name="cmd" onclick="return validar()"/>
		</td>
	</tr>
			</form>
	<tr>
		<td>
			<button id="myBtn" name="verQuesito">VerQuesito</button>
				<div id="myModal" class="modal">
				  <div class="modal-content">
				    <span class="close">&times;</span>
				    
				    <h1 align="center">Vendo Quesito...</h1>
				    <table>
				    <tr>
				    <td><td>
				    <td><Select name="verNotas" id="selectNota">
				    <%
						for(Quesito q: quesito){
					%>
						<option value="<%=q.getNome()%>"><%=q.getNome()%></option>
					<%
					}
					%>
				    </Select></td>
				    <td><input class="botao" type="submit" value="Mostrar" name="cmd"/></td>
				    </tr>
				    </table>
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
							<%
								Lista listan=new Lista();
								List<NotaQuesito> nota = listan.listaNotas(1);
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
							%>

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
				<%
					Lista listap=new Lista();
					List<Escola> pontoT = listap.listaTotal();
					for(Escola p: pontoT){
				%>
					<tr>
						<td><%=p.getNome()%></td>
						<td><%=p.getTotal()%></td>
					</tr>
				<%
				}
				%>

				<tr>
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
	<input id="change" type="submit" value="Muda Escola">
	<script src="https://code.jquery.com/jquery-1.10.1.js" integrity="sha256-663tSdtipgBgyqJXfypOwf9ocmvECGG8Zdl3q+tk+n0=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		var esc=$('#Escola');
		var maxE=esc.find('option').length;
		var dd = $('#Jurado');
		var max_len = dd.find('option').length;
		var quesito = $('#Quesito');
		var max = quesito.find('option').length;
		$('#change').click(function(){
			var ques = $("#Quesito").val();
				//alert('olhaa' +ques);
			if (ques == "Enredo"){
				var x = dd.find('option:selected').index();
				if (max_len == x + 1) x = -1;
				dd.find('option').eq(x + 1).prop('selected', true);
				$("#Quesito").val($("#Quesito option:first").val());
			}else{
				var y = quesito.find('option:selected').index();
			    if (max == y + 1) y = -1;
			    quesito.find('option').eq(y + 1).prop('selected', true);
			}
			var q = $("#Quesito").val();
			var juri = $("#Jurado").val();
			if (juri =="1� Jurado" && q=="Comiss�o de Frente" ){
				var z = esc.find('option:selected').index();
				if (maxE == z + 1) z = -1;
				esc.find('option').eq(z + 1).prop('selected', true);
			}
		});
	</script>
	<input id="teste2" type="submit" value="Testando">
	<script src="https://code.jquery.com/jquery-1.6.2.js" integrity="sha256-pXKSYZ0U64y9kjvenyjPmUrGarxI98l1t2kyj/M73ck=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#teste2').click(function(){
				var quesito= $('#Quesito :selected').text();
				$.ajax({
					type:'POST',
					data:{quesito: quesito},
					url:'controleWeb',
					success: function(result){
						$('#responde').html(result);
					}
				});
			});
		});
	</script>
	<!-- <script type="text/javascript">
			var dd = $('#Jurado');
			var max_len = dd.find('option').length;
			$('#Insert').click(function(){
				var quesito = $("#Quesito").val();
				if (quesito == 9){
						//alert('olhaa' +sala);
					var x = dd.find('option:selected').index();
					if (max_len == x + 1) x = -1;
					dd.find('option').eq(x + 1).prop('selected', true);
					$("#Quesito").val($("#Quesito option:first").val());
				}				
			});
	</script>-->
	<span id="responde"></span>
</div>
</body>
</html>