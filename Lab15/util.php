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

    function insertNadador($nombre,$apellido,$estilo,$distancia,$tiempo)
    {
        $conexion_bd = conectDB();
        $registrar = 'INSERT INTO Nadador (nombre, apellido, estilo, distancia, tiempo) VALUES(?, ?, ?, ?, ?)';    
        if ( !($statement = $conexion_bd->prepare($registrar))) 
        {
          die("Error: (" . $conexion_bd->errno . ") " . $conexion_bd->error);
          return 0;
        }
        if (!$statement->bind_param("sssss",$nombre,$apellido,$estilo,$distancia,$tiempo))
        {
          die("Error en vinculación: (" . $statement->errno . ") " . $statement->error);
          return 0;
        }
        if (!$statement->execute())
        {
          die("Error en ejecución: (" . $statement->errno . ") " . $statement->error);
          return 0;
        }
    
        closeDB($conexion_bd);
        return 1;
    }

    function editNadador($nombre,$apellido,$estilo,$distancia,$tiempo)
    {
        $conexion_bd = conectDB(); 
        $modificar = 'UPDATE Nadador SET apellido=(?), estilo=(?), distancia=(?), tiempo=(?)  WHERE nombre=(?)';
    
        if ( !($statement = $conexion_bd->prepare($modificar)))
        {
          die("Error: (" . $conexion_bd->errno . ") " . $conexion_bd->error);
          return 0;
        }
        if (!$statement->bind_param("sssss",$nombre,$descripcion,$cantidad,$precio,$id )) {
          die("Error en vinculación: (" . $statement->errno . ") " . $statement->error);
          return 0;
        }
        if (!$statement->execute())
        {
          die("Error en ejecución: (" . $statement->errno . ") " . $statement->error);
          return 0;
        }
        closeDB($conexion_bd);
        return 1;
      }

    function deleteAccesorio($id,$nombre,$descripcion,$cantidad,$precio)
    {
        $conexion_bd = conectDB();
        $eliminar = 'DELETE FROM Nadador WHERE nombre=(?) AND apellido=(?) AND estilo=(?) AND disrtancia=(?) AND tiempo=(?)';
        if ( !($statement = $conexion_bd->prepare($eliminar)) )
        {
          die("Error: (" . $conexion_bd->errno . ") " . $conexion_bd->error);
          return 0;
        }
        if (!$statement->bind_param("sssss", $id,$nombre,$descripcion,$cantidad,$precio))
        {
          die("Error en vinculación: (" . $statement->errno . ") " . $statement->error);
          return 0;
        }
        if (!$statement->execute())
        {
          die("Error en ejecución: (" . $statement->errno . ") " . $statement->error);
          return 0;
        }
        closeDB($conexion_bd);
        return 1;
    }
?>