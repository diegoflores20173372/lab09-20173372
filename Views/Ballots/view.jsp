<%@page import="model.entity.Ballot"%>
<%
	Ballot a = (Ballot) request.getAttribute("ballot");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/css/estilo.css">
<link rel="stylesheet" type="text/css" href="/css/estilTabla.css">
<title>Vista de la Boleta</title>
<link href="https://fonts.googleapis.com/css?family=Calligraffitti"
	rel="stylesheet">
<header>
<div class="wrapper">

	<ul class="nav">
		<li><a href="/roles"> Roles </a>
			<ul>
				<li><a id="add" href="/roles/add">Añadir rol</a></li>
				<li><a id="add" href="/roles">Lista roles</a></li>
			</ul></li>
		<li><a href="/users"> User </a>
			<ul>
				<li><a id="add" href="/users/add">Añadir Usuario</a></li>
				<li><a id="add" href="/users">Lista Usuario</a></li>
			</ul></li>
		<li><a href="/resources"> Recursos </a>
			<ul>
				<li><a id="add" href="/resources/add">Añadir recurso</a></li>
				<li><a id="add" href="/resources">Lista recurso</a></li>
			</ul></li>
		<li><a href="/ballots"> Boletas </a>
			<ul>
				<li><a id="add" href="/ballots/add">Añadir Boleta</a></li>
				<li><a id="add" href="/ballots">Lista Boletas</a></li>
			</ul></li>
		<li><a href="/productos"> Productos </a>
			<ul>
				<li><a id="add" href="/productos/add">Añadir Producto</a></li>
				<li><a id="add" href="/productos">Lista Producto</a></li>
			</ul></li>
		<li><a href="/access"> Access </a>
			<ul>
				<li><a id="add" href="/access/add">Añadir access</a></li>
				<li><a id="add" href="/access">Lista access</a></li>
			</ul></li>
		<li><a href="/users/login"> Login</a></li>
		<li><a href="/users/logout"> LogOut</a></li>

	</ul>
</div>

</header>
<br>
<br>
<br>
<br>
<br>
</head>
<body>
	<div align=center width=100%>
		<h1 id="id" name="<%=a.getId() %>">Vista de la Boleta</h1>
		<table id="customers">
			<tr>
				<th>ID</th>
				<td><%=a.getId() %></td>
			</tr>
			<tr>
				<th>Cliente</th>
				<td><%=a.getCliente() %></td>
			</tr>
			<tr>
				<th>DNI</th>
				<td><%=a.getDni() %></td>
			</tr>
			<tr>
				<th>Llanta</th>
				<td><%=a.getLlanta() %></td>
			</tr>
			<tr>
				<th>Dirección</th>
				<td><%=a.getDireccion() %> <%=a.getDistrito() %></td>
			</tr>
			<tr>
				<th>Teléfono</th>
				<td><%=a.getTelefono() %></td>
			</tr>
			<tr>
				<th>Cantidad</th>
				<td><%=a.getCantidad() %></td>
			</tr>
			<tr>
				<th>N° de Boleta</th>
				<td><%=a.getNBoleta() %></td>
			</tr>
			<tr>
				<th>Precio Llanta</th>
				<td><%=a.getPrecioUnitario() %></td>
			</tr>
			<tr>
				<th>Precio Total</th>
				<td><%=a.getPrecioFinal() %></td>
			</tr>
			
		</table>
	</div>



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