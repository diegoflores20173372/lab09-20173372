<%@page import="java.util.*"%>
<%@page import="model.entity.*"%>
<%
	ArrayList<Producto> produc = (ArrayList<Producto>) request.getAttribute("nuevo");
    ArrayList<String> BallotLLant = (ArrayList<String>) request.getAttribute("cantidad"); // tiene 185/13R13R5  medidaRaroRcantidad
    ArrayList<Integer> cantidad = new ArrayList<Integer>();
    for(int i=0;i<BallotLLant.size();i++){
		String llanta = BallotLLant.get(i);
		String [] llantar = llanta.split("R");
		cantidad.add(Integer.parseInt(llantar[2]));
    }
    // boletas emitidas dos veces del mismo producto
    for(int i=0;i<produc.size();i++){
    	for(int j=0;j<produc.size();j++){
    		if(produc.get(i).getId() ==produc.get(j).getId()&&(i!=j) ){
    			cantidad.set(i,cantidad.get(i)+cantidad.get(j) );
    			cantidad.remove(j); produc.remove(j); 
    		}
    	}
    }
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no,initial-scale=1.0,maximum-scale=1.0,minimun-scale=1.0">
<link rel="stylesheet" type="text/css" href="/css/estilo.css">
<link rel="stylesheet" type="text/css" href="/css/estilTablaLab08.css">

<link href="https://fonts.googleapis.com/css?family=Calligraffitti"
	rel="stylesheet">
<title>A�adir Boleta</title>


<header>
<div class="wrapper">


	<ul class="nav">
	<li><a href="/ballots/rank"> Reporte</a></li>
	<li><a href="/ballots/ranking"> Report </a>
		<li><a href="/roles"> Roles </a>
			<ul>
				<li><a id="add" href="/roles/add">A�adir rol</a></li>
				<li><a id="add" href="/roles">Lista roles</a></li>
			</ul></li>
		<li><a href="/users"> User </a>
			<ul>
				<li><a id="add" href="/users/add">A�adir Usuario</a></li>
				<li><a id="add" href="/users">Lista Usuario</a></li>
			</ul></li>
		<li><a href="/resources"> Recursos </a>
			<ul>
				<li><a id="add" href="/resources/add">A�adir recurso</a></li>
				<li><a id="add" href="/resources">Lista recurso</a></li>
			</ul></li>
		<li><a href="/ballots"> Boletas </a>
			<ul>
				<li><a id="add" href="/ballots/add">A�adir Boleta</a></li>
				<li><a id="add" href="/ballots">Lista Boletas</a></li>
			</ul></li>
		<li><a href="/productos"> Productos </a>
			<ul>
				<li><a id="add" href="/productos/add">A�adir Producto</a></li>
				<li><a id="add" href="/productos">Lista Producto</a></li>
			</ul></li>
		<li><a href="/access"> Access </a>
			<ul>
				<li><a id="add" href="/access/add">A�adir access</a></li>
				<li><a id="add" href="/access">Lista access</a></li>
			</ul></li>
		<li><a href="/users/login"> Login</a></li>
		<li><a href="/users/logout"> LogOut</a></li>

	</ul>
</div>
</header>
<br>
<br></br>
</br>



</head>
<body>
	<div align=center width=100%>
			<% if (produc.isEmpty()){ %>
				<h1>No hay boletas emitidas</h1>
			<%} else { %>
				<h1>Ranking Productos mas vendidos</h1>
				<table id="customers">
					<tr >
					    <th>PUESTO</th>
					    <th>ID</th>  
						<th>MODELO</th>
						<th>MARCA</th>
						<th>MEDIDA</th>
						<th>PRECIO</th>
						<th>ARO</th>
						<th>CANTIDAD</th>
					</tr>
			<%
			for (int i = 0; i < produc.size(); i++) {
				%>
				<tr>
				<td><%=i+1 %></td>
				<td><%=produc.get(i).getId() %></td>
				<td><%=produc.get(i).getModelo()  %></td>
				<td><%=produc.get(i).getMarca() %></td>
				<td><%=produc.get(i).getMedida() %></td>
				<td><%=produc.get(i).getPrecio() %></td>
				<td><%=produc.get(i).getAro() %></td>
			  <td ><%=cantidad.get(i) %></td>     
			</tr>
		<%} %>
		</table>
	<%} %>
</div>
		
	<footer id="pie">Valeria Nicoll Calderon Rodriguez-Diego Flores Camargo - Rodrigo Oleachea Sanchez
	 <br><a title="facebook" href="https://web.facebook.com/pg/Llantas-DJ-486510835126807/about/?ref=page_internal"><img src="/css/icoface.png" width="20px" /></a>
         <a title="Whatsapp" href="https://web.whatsapp.com/" ><img src="/css/icoWhats.png" width="20px" /></a>980702144 <a title="Gmail" href="https://mail.google.com/mail/" ><img src="/css/icoGmail.png" width="20px" /></a>jcamarguito@hotmail.com
          </footer>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
		integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
		crossorigin="anonymous"></script>

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
		integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
		crossorigin="anonymous"></script>
</body>
</html>