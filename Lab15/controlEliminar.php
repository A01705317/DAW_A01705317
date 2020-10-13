<?php

    require_once("util.php"); 
    include("_header.html");

    if ( (empty($_POST["nombre"]) && empty($_POST["apellido"]) && empty($_POST["estilo"]) && empty($_POST["distancia"]) && empty($_POST["tiempo"])))
    {
        die("Ingrese datos faltantes del nadador!");
    }
    eliminar_nadador();
    function eliminar_nadador()
    {
        $id = htmlspecialchars($_POST["nombre"]);
        $nombre = htmlspecialchars($_POST["apellido"]);
        $descripcion = htmlspecialchars($_POST["estilo"]);
        $cantidad = htmlspecialchars($_POST["distancia"]);
        $precio = htmlspecialchars($_POST["tiempo"]);

        if(isset($nombre) && isset($apellido)&& isset($estilo))
        {
            if(is_numeric($distancia) && is_numeric($tiempo))
            {
                if(insertNadador($nombre,$apellido,$estilo,$distancia,$tiempo))
                {
                    echo("Nadador Eliminado!");
                }
                else
                {
                    echo("No se ha eliminado el nadador!");
                }
            }
            else
            {
                echo("No se ha eliminado el nadador!");
            }
        }
    }

    include("_nadadores.html");
    $result = getNadador();
    if(mysqli_num_rows($result)>0)
    {
        echo '<table class="table container shadow">';
        while($row = mysqli_fetch_assoc($result))
        {
            echo "<tr>";
            echo "<td>".$row["nombre"]."<td>";
            echo "<td>".$row["apellido"]."<td>";
            echo "<td>".$row["estilo"]."<td>";
            echo "<td>".$row["distancia"]."<td>";
            echo "<td>".$row["tiempo"]."<td>";
            echo "<tr>";
        }
        echo "</table>";
    
    }
    include("_terminado.html"); 
    include("_footer.html"); 
?>