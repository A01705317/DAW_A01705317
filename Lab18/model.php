<?php

function conectar()
{
    $conexion_bd = mysqli_connect("localhost","root","","among_us");
    
    if ($conexion_bd == NULL)
    {
        die("No se pudo conectar a la base de datos");
    }
    
    $conexion_bd->set_charset("utf8");
    
    return $conexion_bd;
}

function desconectar($conexion_bd)
{
    mysqli_close($conexion_bd);
}

function select($name, $tabla, $id="id", $nombre="nombre")
{
    $resultado = '<select id="'.$name.'"  name="'.$name.'" class="browser-default">';
    $resultado .= '<option value="" disabled selected>Selecciona un '.$tabla.'</option>';
    $conexion_bd = conectar();
    
    $consulta = 'SELECT '.$id.', '.$nombre.' FROM '.$tabla.' ORDER BY '.$nombre.' ASC';
    $resultados_consulta = $conexion_bd->query($consulta);  
    
    while ($row = mysqli_fetch_array($resultados_consulta, MYSQLI_BOTH)) {
        
        $resultado .= '<option value="'.$row[$id].'">'.$row[$nombre].'</option>';
    }
    
    mysqli_free_result($resultados_consulta); //Liberar la memoria
    
    $resultado .= '</select><label>'.$tabla.'</label>';
    
    desconectar($conexion_bd);
    return $resultado;
}

function tabla_acusaciones()
{
    
    $consulta = 'SELECT t.id as acusador_id, t.nombre as acusador, s.nombre as acusado, created_at as fecha ';
    $consulta .= 'FROM acusa, tripulante  t, tripulante s ';
    $consulta .= 'WHERE  t.Id = acusa.acusador_id AND s.Id = acusa.acusado_id';
    $consulta .= ' ORDER BY fecha DESC';
    
    $conexion_bd = conectar();
    $resultados_consulta = $conexion_bd->query($consulta);  
    
    $resultado = '<table id="acusaciones" class="striped">';
    $resultado .= '<tr><th>Acusador</th><th>Acusado</th><th>Fecha</th><tr>';
    
    while ($row = mysqli_fetch_array($resultados_consulta, MYSQLI_ASSOC))
    {     
        $resultado .= '<tr>';
        $resultado .= '<td><a href="editar.php?id='.$row["acusador_id"].'">'.$row["acusador"].'</a></td>';
        $resultado .= '<td>'.$row["acusado"].'</td>';
        $resultado .= '<td>'.$row["fecha"].'</td>';
        $resultado .= '</tr>';
    }
    
    mysqli_free_result($resultados_consulta); //Liberar la memoria
    
    $resultado .= '</table>';
    
    desconectar($conexion_bd);
    return $resultado;
}

function buscar($acusador_id)
{
    
    $consulta = 'SELECT a.acusado_id, t.nombre, a.created_at ';
    $consulta .= 'FROM acusa a, tripulante t ';
    $consulta .= 'WHERE a.acusado_id = t.Id AND acusador_id = '.$acusador_id;
    $consulta .= ' ORDER BY created_at DESC';
    
    $conexion_bd = conectar();
    $resultados_consulta = $conexion_bd->query($consulta);  
    
    $resultado = '<table id="acusaciones" class="striped">';
    $resultado .= '<tr><th>Acusados</th><th>Fecha</th><tr>';
    
    while ($row = mysqli_fetch_array($resultados_consulta, MYSQLI_ASSOC))
    {     
        $resultado .= '<tr>';
        $resultado .= '<td>'.$row["nombre"].'</td>';
        $resultado .= '<td>'.$row["created_at"].'</td>';
        $resultado .= '</tr>';
    }
    
    mysqli_free_result($resultados_consulta); //Liberar la memoria
    
    $resultado .= '</table>';
    
    desconectar($conexion_bd);
    return $resultado;
}

function acusa($acusador_id, $acusado_id)
{
     
    $conexion_bd = conectar();
    
    $consulta = "INSERT INTO acusa(acusador_id, acusado_id) VALUES (?,?)";
    
    if(!($statement = $conexion_bd->prepare($consulta))) {
        die("Error(".$conexion_bd->errno."): ".$conexion_bd->error);
    }
    
    if(!($statement->bind_param("ss",$acusador_id, $acusado_id))) {
        die("Error de vinculación(".$statement->errno."): ".$statement->error);
    }
    
    if(!$statement->execute()) {
        die("Error en ejecución de la consulta(".$statement->errno."): ".$statement->error);
    }
    
    desconectar($conexion_bd);
}

?>