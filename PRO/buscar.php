<?php
    require_once("model.php");
    require_once("util.php");

    limpiar_entradas();

    echo buscar($_GET["id"]);
?>