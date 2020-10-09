<?php
require_once("util.php");

include("_header.html");
include("_body.html");
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

include("_form.html");
include("_preguntas.html");
include("_footer.html");

?>