<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.List"%>

<%@ page import="model.entity.*"%>
<%List<Access> acc = (List<Access>)request.getAttribute("access");%>
<%List<Rol> roles = (List<Rol>)request.getAttribute("roles");%>
<%List<Resources> resources = (List<Resources>)request.getAttribute("resources");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>Lista Access</title>
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
                            <li><a id="add"href="/roles/add" >Añadir rol</a></li>
                             <li><a id="add"href="/roles">Lista roles</a></li>
                        </ul>
                    </li>
                    <li><a href="/users"> User </a>
                       <ul>
                            <li><a id="add"href="/users/add" >Añadir Usuario</a></li>
                             <li><a id="add"href="/users">Lista Usuario</a></li>
                        </ul>
                    </li>
                     <li><a href="/resources"> Recursos </a>
                       <ul>
                            <li><a id="add"href="/resources/add" >Añadir recurso</a></li>
                             <li><a id="add"href="/resources">Lista recurso</a></li>
                        </ul>
                    </li>
                    <li><a href="/ballots"> Boletas </a>
                       <ul>
                            <li><a id="add"href="/ballots/add" >Añadir Boleta</a></li>
                             <li><a id="add"href="/ballots">Lista Boletas</a></li>
                        </ul>
                    </li>
                     <li><a href="/productos"> Productos </a>
                       <ul>
                            <li><a id="add"href="/productos/add" >Añadir Producto</a></li>
                             <li><a id="add"href="/productos">Lista Producto</a></li>
                        </ul>
                    </li>
                    <li><a href="/access"> Access </a>
                       <ul>
                            <li><a id="add"href="/access/add" >Añadir access</a></li>
                             <li><a id="add"href="/access">Lista access</a></li>
                        </ul>
                    </li>
                      <li><a href="/users/login"> Login</a></li>
                     <li><a href="/users/logout"> LogOut</a></li>
                    
                </ul>
        </div>
        </header>
<br><br><br><br>
</head>
<body>
     
		
		<div align=center width=100%>
			<% if (acc.isEmpty()){ %>
				<h1>No hay access</h1>
			<%} else {%>
				<h1>Lista de Access</h1>
				<table id="customers">
					<tr >
					    <th>ID</th>  
						<th>ROL</th>
						<th>RECURSO</th>
						<th>ESTATUS</th>
						<th>CREACION</th>
						<th>FUNCIONES</th>
					</tr>
				<% for (Access acce: acc){%>
				<tr>
						<td><%=acce.getId() %></td>
							<% for (Rol role: roles){
							if(role.getId().equals(acce.getIdRol()) ){ %>
								<td><%= role.getNombre() %></td>
								<%
								break;} } 
						
						 for (Resources reso: resources){
							if(reso.getId().equals(acce.getIdUrl())){ %>
								<td><%=reso.getUrl() %></td>
								<%break;} } %>
						
						<td><%=acce.isStatus() %></td>
						<td><%=acce.getFecha() %></td>
					
					  <td >
                	<a href="/access/view?id=<%=acce.getId() %>">Ver</a>
                	<a href="/access/edit?id=<%=acce.getId() %>">Editar</a>
                	<a href="/access/delete?id=<%=acce.getId() %>">Borrar</a>
                </td>     
					</tr>
				<%} %>
				</table>
			<%} %>
		</div>
	 <footer id="pie">Valeria Nicoll Calderon Rodriguez-Diego Flores Camargo - Rodrigo Oleachea Sanchez
	 <br><a title="facebook" href="https://web.facebook.com/pg/Llantas-DJ-486510835126807/about/?ref=page_internal"><img src="/css/icoface.png" width="20px" /></a>
         <a title="Whatsapp" href="https://web.whatsapp.com/" ><img src="/css/icoWhats.png" width="20px" /></a>980702144 <a title="Gmail" href="https://mail.google.com/mail/" ><img src="/css/icoGmail.png" width="20px" /></a>jcamarguito@hotmail.com
          </footer>
               <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

                            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>

                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
</body>
</html>