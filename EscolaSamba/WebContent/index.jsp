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
	<tr>
		<td>
			<input class="botao" id="visualizar" type="submit" value="VerQuesitos" name="cmd"/>
			</form>
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
	<!--<input id="teste2" type="submit" value="Testando">
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
	</script>-->
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