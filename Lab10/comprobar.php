<?php

  require_once("util.php");

  if ( !(isset($_POST["nombre"]) && isset($_POST["apellido"])&& isset($_POST["edad"]) && isset($_POST["afiliacion"]) && isset($_POST["estado"]) && isset($_POST["ciudad"]) && isset($_POST["tiempo"]) && isset($_POST["email"]) && isset($_POST["tel"])))
  {
    die();
  }

  $nombre = htmlspecialchars($_POST["nombre"]);
  $apellido = htmlspecialchars($_POST["apellido"]);
  $edad = htmlspecialchars($_POST["edad"]);
  $afiliacion = htmlspecialchars($_POST["afiliacion"]);
  $estado = htmlspecialchars($_POST["estado"]);   
  $ciudad = htmlspecialchars($_POST["ciudad"]);
  $tiempo = htmlspecialchars($_POST["tiempo"]);
  $tel = htmlspecialchars($_POST["tel"]);  
  $email = htmlspecialchars($_POST["email"]);
  
  include("_header.html");  

  comprobar($nombre, $apellido, $edad, $afiliacion, $estado, $ciudad, $tiempo, $tel, $email);

  include("_footer.html");  
?>