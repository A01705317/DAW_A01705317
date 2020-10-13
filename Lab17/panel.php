<?php 
session_start();
require_once ('util.php');
include("header.html");

if ($_SESSION['rol'] == "Administrador") {
    echo "<div class='row center-align'>";
    echo "<div class='col s12 '>";
    echo "<div class='col s4'>";
    echo "<a class='grey darken-1 waves-effect waves-light btn'>Sub-consultas</a>";
    echo "</div>";
    echo "<div class='col s4'>";
    echo "<a class='grey darken-1 waves-effect waves-light btn'>Transacciones</a>";
    echo "</div>";
    echo "<div class='col s4'>";
    echo "<a class='grey darken-1 waves-effect waves-light btn'>Nueva Transacción</a>";
    echo "</div>";
    echo "</div>";
    echo "</div>";

   
    echo "<div class='row center-align'>";
    $result = getUsers();
    if(mysqli_num_rows($result) > 0)
    {
   
        
        echo "<div class='col s4 push-s2'>";
   
        //output data of each row
        echo "<table>";
        echo "<thead>";
        echo "<tr>";
        echo "<th> ID </th>";
        echo "<th> Nombre </th>";
        echo "<th> Apellido </th>";
        echo "</tr>";
        echo "</thead>";
        echo "<tbody>";
        while($row = mysqli_fetch_assoc($result))
        {
           
            echo "<tr>";
            echo "<td>" . $row["Id_Usuario"] . "</td>";
     
            echo "<td>" . $row["Nombre"] . "</td>";
     
            echo "<td>$" . $row["Apellidos"] . "</td>";
            echo "</tr>";
        }
        echo "</tbody>";
        echo "</table>";
        echo "</div>";
        
      
       
    }
    $result2 = getEmp();
    if(mysqli_num_rows($result2) > 0)
    {
   
        
        echo "<div class='col s4  push-s2'>";
   
        //output data of each row
        echo "<table>";
        echo "<thead>";
        echo "<tr>";
        echo "<th> ID Empleado </th>";
        echo "<th> RFC Empleado </th>";
        echo "</tr>";
        echo "</thead>";
        echo "<tbody>";
        while($row = mysqli_fetch_assoc($result2))
        {
           
            echo "<tr>";
            echo "<td>" . $row["Id_Usuario"] . "</td>";
     
            echo "<td>" . $row["RFC"] . "</td>";
     
            echo "</tr>";
        }
        echo "</tbody>";
        echo "</table>";
        echo "</div>";
        
      
       
    }

    echo "</div>";
}

if ($_SESSION['rol'] == "Cliente") {
    echo "<div class='row center-align'>";
    echo "<div class='col s12'>";
    echo "<div class='col s3'>";
    echo "<a class='grey darken-1 waves-effect waves-light btn'>Cuenta</a>";
    echo "</div>";
    echo "<div class='col s3'>";
    echo "<a class='grey darken-1 waves-effect waves-light btn'>Información personal</a>";
    echo "</div>";
    echo "<div class='col s3'>";
    echo "<a class='grey darken-1 waves-effect waves-light btn'>Transacciones</a>";
    echo "</div>";
    echo "<div class='col s3'>";
    echo "<a class='grey darken-1 waves-effect waves-light btn'>Nueva Transacción</a>";
    echo "</div>";
    echo "</div>";
    echo "</div>";
}

if ($_SESSION['rol'] == "Empleado") {
    echo "<div class='row center-align'>";
    echo "<div class='col s12 push-s1'>";
    echo "<div class='col s2'>";
    echo "<a class='grey darken-1 waves-effect waves-light btn'>Área de trabajo</a>";
    echo "</div>";
    echo "<div class='col s2'>";
    echo "<a class='grey darken-1 waves-effect waves-light btn'>Información personal</a>";
    echo "</div>";
    echo "<div class='col s2'>";
    echo "<a class='grey darken-1 waves-effect waves-light btn'>Cuenta</a>";
    echo "</div>";
    echo "<div class='col s2'>";
    echo "<a class='grey darken-1 waves-effect waves-light btn'>Transacciones</a>";
    echo "</div>";
    echo "<div class='col s2'>";
    echo "<a class='grey darken-1 waves-effect waves-light btn'>Nueva Transacción</a>";
    echo "</div>";
    echo "</div>";
    echo "</div>";
}

include("footer.html");




?>