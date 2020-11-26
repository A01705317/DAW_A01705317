<?php
    require_once("model.php");
    require_once("util.php");
    
    session_start();
    limpiar_entradas();

    if (isset($_POST["acusador"]) && isset($_POST["acusado"]))
    {
        acusa($_POST["acusador"], $_POST["acusado"]);
    }

    include("_header.html");
    include("_body.html");
    include("_tema.html");
    include("_form.html");
    include("_espacio_ajax.html");
    include("_tabla.html");
    include("_preguntas.html");
    include("_footer.html"); 
?>