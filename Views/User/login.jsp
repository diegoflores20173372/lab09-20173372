<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.google.appengine.api.users.User" %>
    <%User user = (User) request.getAttribute("user"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Vista del login</title>
<link rel="stylesheet" type="text/css" href="/css/estilo.css">
<link rel="stylesheet" type="text/css" href="/css/estilTablaLab08.css">

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
        <br><br><br><br><br>
</head>
<body>
<div align=center width=100%>
        <h1>Bienvenido    <%=user.getEmail()   %></h1>
        </div>
    <div align=center width=100%>
             
    <h1>GITHUB
       <a title="gitHub" href="https://github.com/diegoflores20173372/lab09-20173372"><img src="/css/icoGit.jpg" width="100px" /></a></h1></div>
       Rodrigo Olaechea Sánchez
       <a hre="https://www.youtube.com/playlist?list=PLO95U1-JWyX32isnWhfw-KEnBC8Yr2dMK">Videos Español Inglés</a>
       Valeria Calderón Rodríguez
       <a href="https://youtu.be/H_p4aFEzh5M">Video Español parte 1</a>
       <a href="https://youtu.be/ifPFFKOLBh8">Video Español parte 2</a>
       <a href="https://www.youtube.com/watch?v=U9oarKh6cKQ&feature=youtu.be">Video Inglés</a>
       Diego Flores Camargo
       <a href="https://youtu.be/p86nxRCQBMU">Video 1</a>
       <a href="https://youtu.be/Ke3T1ntT9VA">Video 2</a>
         <footer id="pie">Valeria Nicoll Calderon Rodriguez-Diego Flores Camargo - Rodrigo Oleachea Sanchez
	 <br><a title="facebook" href="https://web.facebook.com/pg/Llantas-DJ-486510835126807/about/?ref=page_internal"><img src="/css/icoface.png" width="20px" /></a>
         <a title="Whatsapp" href="https://web.whatsapp.com/" ><img src="/css/icoWhats.png" width="20px" /></a>980702144 <a title="Gmail" href="https://mail.google.com/mail/" ><img src="/css/icoGmail.png" width="20px" /></a>jcamarguito@hotmail.com
          </footer>
</body>
</html>