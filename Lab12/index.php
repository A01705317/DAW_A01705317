<?php

    if(isset($_POST["nombre"]))
    {
        $_SESSION["usuario"] = $_POST["usuario"];
    }

    if(!isset($_SESSION["usuario"]))
    {
        $_SESSION["usuario"] = "No hay usuario previo!";
    }


    include("_header.html");
    include("_body.html");
    include("_form.html");
    include("_preguntas.html");
    include("_footer.html");

?>