<%@page import="java.util.*"%>
<%@page import="model.entity.Producto"%>
<%
	List<Producto> productos = (List<Producto>) request.getAttribute("producto");
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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista Productos</title>
<link rel="stylesheet" type="text/css" href="/css/estilo.css">
<link rel="stylesheet" type="text/css" href="/css/estilTabla.css">

<link href="https://fonts.googleapis.com/css?family=Calligraffitti"
	rel="stylesheet">
<header>
	<div class="wrapper">


		<ul class="nav">
		<li><a href="/ballots/rank"> Reporte</a></li>
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
					<li><a id="add" href="/productos/search">Buscar Producto</a>
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
<div class="container text-center py-5">
	<h1>Búsqueda de Producto</h1>
</div>
<br>
<br>
<br>
<br>
</head>
<body>

	<div class="jumbotron boxlogin">
		<form method="get" action="/productos/search" id="flogin"
			name="Formulario"
			onsubmit="document.forms['Formulario']['Enviar'].disabled=true;">
			<label>Seleccione el tipo de búsqueda.</label> <select
				name="busqueda" class="form-control">
				<option value="aro">Aro</option>
				<option value="medida">Medida</option>
				<option value="marca">Marca</option>
				<option value="modelo">Modelo</option>
			</select> <input type="text" name="pBus" placeholder="Ingrese palabra clave"
				required> <input type="submit" value="Buscar" name="Enviar">
		</form>
		
	</div>


	<footer id="pie">Valeria Nicoll Calderon Rodriguez, Diego Joel
		Flores Camargo, Rodrigo André Olaechea Sánchez </footer>
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