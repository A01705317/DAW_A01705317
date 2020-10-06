<?php

    require_once("util.php");
    $result = getNadador();

    include("_header.html");
    include("_body.html");
    
    include("_form.html");
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




    include("_form1.html");
    $resultado =getNadadorByTiempo(49.82);
    if(mysqli_num_rows($resultado) > 0)
    {
        echo '<table class="table container shadow">';
        while($row = mysqli_fetch_assoc($resultado))
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




    include("_form2.html");
    $res =getNadadorByNombre("Caeleb");
    if(mysqli_num_rows($res) > 0)
    {
        echo '<table class="table container shadow">';
        while($row = mysqli_fetch_assoc($res))
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

    
    include("_preguntas.html");
    include("_footer.html");

?>