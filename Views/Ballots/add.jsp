
<%
	String Nboleta = (String) request.getAttribute("Nboleta");
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
<link rel="stylesheet" type="text/css" href="/css/style.css">

<link href="https://fonts.googleapis.com/css?family=Calligraffitti"
	rel="stylesheet">
<title>Añadir Boleta</title>


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
<br></br>
</br>
<div class="container text-center py-5">
	<h1>Añadir Boleta</h1>
</div>


</head>
<body>
	<div class="jumbotron boxlogin">
		<form method="post" action="/ballots/add" name="Reci" if="flogin">
			<label>Nombre Cliente: </label><br> 
			<input class="form-control" type="text" name="Usuario" placeholder="Su nombre: " autofocus required><br /> 
			<label>DNI: </label> <br>
			<input class="form-control" type="number" name="dni" placeholder="N° DNI" required><br /> 
			<label>Dirección: </label> <br>
			<input class="form-control" type="text" name="direccion" placeholder="Su dirección..." required> <br /> 
			<label>Distrito: </label> <br>
			<input class="form-control" type="text" name="distrito" placeholder="Su distrito..." required> 
			<label>Teléfono: </label> <br>
			<input class="form-control" type="number" name="telefono" required><br /> 
			<label>Cantidad: </label> <br>
			<input class="form-control" type="number" name="cantidad" placeholder="N°" required> 
			<label>N° Boleta: </label> <br>
			<input class="form-control" type="text" readonly value="<%=Nboleta%>"><br /> 
			<label>Llanta: </label> <br>
			<input class="form-control" type="text" name="llanta" required> <br /> 
			<label>PrecioUnitario: </label><br> 
			<input class="form-control" type="text" name="precioUnit" required> 
			<input name="Enviar" type="submit" value="Emitir Boleta">
		</form>
	</div>
	<script>
				(function(){
					
					var formulario = document.getElementsByName('Reci')[0],
						elementos = formulario.elements,
						boton = document.getElementById('submit');
					
					var validarCliente = function(e){
						if(formulario.Usuario.value == ""){
							alert("Llene el campo usuario");
							e.preventDefault();
						}
						else if(isNaN(formulario.Usuario.value)===false){
							alert("El campo USUARIO solo debe contener letras");
							e.preventDefault();
						}
					}
					var validarDNI = function(e){
						if(formulario.dni.value == ""){
							alert("Llene el campo DNI");
							e.preventDefault();
						}
						else if(isNaN(formulario.dni.value)){
							alert("El campo DNI deben ser solo numeros");
							e.preventDefault();
						} 
						else if(formulario.telefono.value.length < 8 || formulario.celular.value.length > 8){
							alert("El campo dni debe contener un número de 8 digitos");
							e.preventDefault();
						}
					}
					var validarDireccion = function(e){
						if(formulario.direccion.value == ""){
							alert("Llene el campo direccion");
							e.preventDefault();
						}
					}
					var validarDistrito = function(e){
						if(formulario.distrito.value == ""){
							alert("Llene el campo distrito");
							e.preventDefault();
						}
						else if(isNaN(formulario.distrito.value)){
							alert("Complete el campo DISTRITO solo con letras");
							e.preventDefault();
						}
						var validarTelefono = function(e){
							if(formulario.telefono.value == ""){
								alert("Llene el campo telefono");
								e.preventDefault();
							}
							else if(isNaN(formulario.telefono.value)){
								alert("Compelete el campo TELEFONO solo con números");
								e.preventDefault();
							}
							else if(formulario.telefono.value.length < 9 || formulario.celular.value.length > 9){
								alert("El campo telefono debe contener un número de 9 digitos");
								e.preventDefault();
							}
						}

					}
					var validarCantidad = function(e){
						if(formulario.cantidad.value == ""){
							alert("Llene el campo cantidad");
							e.preventDefault();
						}
					}
					var bloqueoBoton = function(e){
						document.forms['Reci']['Enviar'].disabled=true;
					}
					var validar = function(e){
						validarCliente(e);
						validarDNI(e);
						validarDistrito(e);
						validarDireccion(e);
						validarTelefono(e);
						validarCantidad(e);
						bloqueoBoton(e);
					}
					
					formulario.addEventListener("submit",validar);
					
					
				}())	
			</script>

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