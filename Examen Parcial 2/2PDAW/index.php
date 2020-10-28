<?php
    require_once("model.php");

    session_start();

    if (isset($_POST["estado"]) && isset($_POST["nombre"]))
    {
        convertir($_POST["estado"], $_POST["nombre"]);
    }

    include("_header.html");
    include("_body.html");
    include("_tema.html");
    include("_form.html");
    include("_ajax.html");
    include("_tabla.html");
    include("_footer.html"); 
?>