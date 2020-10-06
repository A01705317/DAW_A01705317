<?php
    function conectDB()
    {
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbnadadores = "dbnadadores";
        
        $conexion_db = mysqli_connect($servername, $username, $password, $dbnadadores);
            if (!$conexion_db)
            {
                die("Connection failed: ". mysqli_connect_error());
            }
            return $conexion_db;
    }



    function closeDB($conexion_db)
    {
        mysqli_close($conexion_db);
    }
    
    function getNadador()
    {
        $conexion_db = conectDB();
        $sql = "SELECT nombre, apellido, estilo, distancia, tiempo FROM Nadador";
        $resultado = mysqli_query($conexion_db,$sql);
        closeDB($conexion_db);
        return $resultado;
    }


    function getNadadorByNombre($nombre_nadador)
    {
        $conexion_db = conectDB();
        $sql = "SELECT nombre, apellido, estilo, distancia, tiempo FROM Nadador WHERE nombre LIKE '%".$nombre_nadador."'";
        $resultado = mysqli_query($conexion_db,$sql);
        closeDB($conexion_db);
        return $resultado;
    }

    function getNadadorByTiempo($tiempo_nadador)
    {
        $conexion_db = conectDB();
        $sql = "SELECT nombre, apellido, estilo, distancia, tiempo FROM Nadador WHERE tiempo <= '".$tiempo_nadador."'";
        $resultado = mysqli_query($conexion_db,$sql);
        closeDB($conexion_db);
        return $resultado;
    }
?>