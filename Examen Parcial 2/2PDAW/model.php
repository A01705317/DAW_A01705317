<?php

function conectar()
{
    $conexion_bd = mysqli_connect("localhost","root","","zombies");
    
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

function select($name, $tabla, $id="id_estado", $nombre="nombre_estado")
{
    $resultado = '<select id="'.$name.'"  name="'.$name.'" class="browser-default">';
    $resultado .= '<option value="" disabled selected>Selecciona un '.$tabla.'</option>';
    $conexion_bd = conectar();
    
    $consulta = 'SELECT '.$id.', '.$nombre.' FROM '.$tabla.' ORDER BY '.$nombre.' ASC';
    $resultados_consulta = $conexion_bd->query($consulta);  
    
    while ($row = mysqli_fetch_array($resultados_consulta, MYSQLI_BOTH)) {
        
        $resultado .= '<option value="'.$row[$id].'">'.$row[$nombre].'</option>';
    }
    
    mysqli_free_result($resultados_consulta);
    
    $resultado .= '</select><label>'.$tabla.'</label>';
    
    desconectar($conexion_bd);
    return $resultado;
}

function tabla_zombies()
{    
    $consulta = 'SELECT e.id_estado as ID_Estado, e.nombre_estado as Estado, z.nombre as Nombre, z.created_at as Fecha ';
    $consulta .= 'FROM zombie z, estado  e';
    $consulta .= 'WHERE  e.id_estado = convertir.estado_id';
    $consulta .= 'ORDER BY fecha DESC';
    
    $conexion_bd = conectar();
    $resultados_consulta = $conexion_bd->query($consulta);  
    
    $resultado = '<table id="zombies" class="striped">';
    $resultado .= '<tr><th>Estado</th><th>Nombre</th><th>Fecha</th><tr>';
    
    while ($row = mysqli_fetch_array($resultados_consulta, MYSQLI_ASSOC))
    {     
        $resultado .= '<tr>';
        $resultado .= '<td><a href="editar.php?id='.$row["id_estado"].'">'.$row["nombre_estado"].'</a></td>';
        $resultado .= '<td>'.$row["nombre"].'</td>';
        $resultado .= '<td>'.$row["fecha"].'</td>';
        $resultado .= '</tr>';
    }
    
    mysqli_free_result($resultados_consulta);
    
    $resultado .= '</table>';
    
    desconectar($conexion_bd);
    return $resultado;
}

function buscar($nombre_estado)
{
    
    $consulta = 'SELECT z.estado_id, e.nombre_estado, z.created_at ';
    $consulta .= 'FROM zombie z, estado e';
    $consulta .= 'WHERE e.id_estado = z.estado_id AND nombre_estado = '.$nombre_estado;
    $consulta .= ' ORDER BY created_at DESC';
    
    $conexion_bd = conectar();
    $resultados_consulta = $conexion_bd->query($consulta);  
    
    $resultado = '<table id_estado="conversiones" class="striped">';
    $resultado .= '<tr><th>Estado</th><th>Fecha</th><tr>';
    
    while ($row = mysqli_fetch_array($resultados_consulta, MYSQLI_ASSOC))
    {     
        $resultado .= '<tr>';
        $resultado .= '<td>'.$row["nombre"].'</td>';
        $resultado .= '<td>'.$row["created_at"].'</td>';
        $resultado .= '</tr>';
    }
    
    mysqli_free_result($resultados_consulta);
    
    $resultado .= '</table>';
    
    desconectar($conexion_bd);
    return $resultado;
}

function convertir($id_estado, $nombre)
{
     
    $conexion_bd = conectar();
    
    $consulta = "INSERT INTO convertir(id_estado, nombre) VALUES (?,?)";
    
    if(!($statement = $conexion_bd->prepare($consulta)))
    {
        die("Error(".$conexion_bd->errno."): ".$conexion_bd->error);
    }
    
    if(!($statement->bind_param("ss",$id_estado, $nombre)))
    {
        die("Error de vinculación(".$statement->errno."): ".$statement->error);
    }
    
    if(!$statement->execute())
    {
        die("Error en ejecución de la consulta(".$statement->errno."): ".$statement->error);
    }
    
    desconectar($conexion_bd);
}

?>