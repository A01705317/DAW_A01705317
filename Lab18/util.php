<?php

    function limpiar_entradas()
    {
        if (isset($_GET["impostor"]))
        {
            $_GET["impostor"] = htmlspecialchars($_GET["impostor"]);
        }
        if (isset( $_POST["impostor"]))
        {
            $_POST["impostor"] = htmlspecialchars($_POST["impostor"]);
        }
        if (isset( $_POST["acusador"]))
        {
            $_POST["acusador"] = htmlspecialchars($_POST["acusador"]);
        }
        if (isset( $_POST["acusado"]))
        {
            $_POST["acusado"] = htmlspecialchars($_POST["acusado"]);
        }
        if (isset( $_POST["id"]))
        {
            $_POST["id"] = htmlspecialchars($_POST["id"]);
        }
        if (isset( $_POST["nombre"]))
        {
            $_POST["nombre"] = htmlspecialchars($_POST["nombre"]);
        }
        if (isset( $_GET["id"]))
        {
            $_GET["id"] = htmlspecialchars($_GET["id"]);
        }
    }

?>