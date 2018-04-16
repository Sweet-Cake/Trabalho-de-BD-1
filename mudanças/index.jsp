<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, Dao.*, java.util.*,model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="css/estilo.css"/>
	<title>APURAÇÃO</title>

	
	<script src="https://code.jquery.com/jquery-1.6.2.js" integrity="sha256-pXKSYZ0U64y9kjvenyjPmUrGarxI98l1t2kyj/M73ck=" crossorigin="anonymous"></script>
	<script text="text/javascript">
			$(document).ready(function(){
				$('#Insert').click(function(){
					var Escola = $("#Escola option:selected").val();
					var Quesito= $("#Quesito option:selected").val();
					var Jurado = $("#Jurado option:selected").val();
					var Nota = $('#Nota').val();
					var cmd = $('#Insert').attr('value');
					$.ajax({
						type:'POST',
						data:{Escola: Escola,
							Quesito: Quesito,
							Jurado: Jurado,
							Nota: Nota,
							cmd: cmd
						},
						url:'controleWeb',
						success: function(result){
							$('#alerta').html(result);
						}
					});
				});
			});
	</script>
	<script src="https://code.jquery.com/jquery-1.6.2.js" integrity="sha256-pXKSYZ0U64y9kjvenyjPmUrGarxI98l1t2kyj/M73ck=" crossorigin="anonymous"></script>
	<script text="text/javascript">
			$(document).ready(function(){
				$('#myBtn2').click(function(){
					var cmd = $('#myBtn2').attr('value');
					$.ajax({
						type:'POST',
						data:{cmd: cmd
						},
						url:'controleWeb',
						success: function(result){
							$('#resultado2').html(result);
						}
					});
				});
			});
	</script>
	<script src="https://code.jquery.com/jquery-1.6.2.js" integrity="sha256-pXKSYZ0U64y9kjvenyjPmUrGarxI98l1t2kyj/M73ck=" crossorigin="anonymous"></script>
	<script text="text/javascript">
			$(document).ready(function(){
				$('#Show').click(function(){
					var Quesito= $("#Quesito2 option:selected").val();
					var cmd = $('#Show').attr('value');
					$.ajax({
						type:'POST',
						data:{Quesito: Quesito,
							cmd: cmd
						},
						url:'controleWeb',
						success: function(result){
							$('#resultado').html(result);
						}
					});
				});
			});
	</script>
	
</head>
<body>
	<pre id="alerta" align="center" style="background-color:cyan;"></pre>
<div class="container">
	<table>
	<form name="formE">
		<!--<span id="resul"></span>-->
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
			<input class="input"type="text" name="Nota" id="Nota" placeholder="Nota:"/>
			<input class="botao" id="Insert" type="button" value="Inserir" name="cmd"/>
			
		</td>
	</tr>
	<tr>
		<td>
			</form>
			<button id="myBtn">VerQuesito</button>
				<div id="myModal" class="modal">
				  <div class="modal-content">
				    <span class="close">&times;</span>
				    <h1 align="center">Vendo Quesito...</h1>
				    	<table><tr><td>
				    	<Select name="Quesito2" id="Quesito2">
				<%
					for(Quesito q: quesito){
				%>
					<option value="<%=q.getId()%>"><%=q.getNome()%></option>
				<%
				}
				%>
				</Select></td>
				<td><input class="botao" id="Show" type="button" value="Mostrar" name="cmd"/></td>
				</tr>
				    	</table>
				    	<table  class="tabela" id="resultado" align="center" style="border:1px solid cyan;"></table>
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

				<button id="myBtn2" value="Total">Ver Total</button>
				<div id="myModal2" class="modal">
				  <div class="modal-content">
				    <span class="close2">&times;</span>
				    <h1 align="center">Vendo Total:</h1>
					<table id="resultado2" align="center" style="border:1px solid cyan;"></table>		    	
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
	<script src="https://code.jquery.com/jquery-1.10.1.js" integrity="sha256-663tSdtipgBgyqJXfypOwf9ocmvECGG8Zdl3q+tk+n0=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		var esc=$('#Escola');
		var maxE=esc.find('option').length;
		var dd = $('#Jurado');
		var max_len = dd.find('option').length;
		var quesito = $('#Quesito');
		var max = quesito.find('option').length;
		$('#Insert').click(function(){
			var es = $("#Escola").val();
				//alert('olhaa' +ques);
			if (es == "Império de Casa Verde"){
				var x = dd.find('option:selected').index();
				if (max_len == x + 1) x = -1;
				dd.find('option').eq(x + 1).prop('selected', true);
				$("#Escola").val($("#Escola option:first").val());
				var juri=$("#Jurado").val();
				if(juri =="1º Jurado"){
					var y = quesito.find('option:selected').index();
				    if (max == y + 1) y = -1;
				    quesito.find('option').eq(y + 1).prop('selected', true);
				}
			}else{
				var z = esc.find('option:selected').index();
				if (maxE == z + 1) z = -1;
				esc.find('option').eq(z + 1).prop('selected', true);
			}
		});
	</script>
</div>
</body>
</html>