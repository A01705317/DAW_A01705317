<?php
    //Despliega las funciones hechas anteriormente en algunas vistas.
    session_start();
    require_once ('util.php');
    
    if(isset($_POST["submit"]) && !empty($_POST["submit"])){
        $_POST["user_name"]=htmlspecialchars($_POST["user_name"]);
        $_POST["password"]=htmlspecialchars($_POST["password"]);
        $usuario = $_POST["user_name"];
        $contra = $_POST["password"];

        if(isset($_POST["user_name"]) && !empty($_POST["user_name"]) && isset($_POST["password"]) && !empty($_POST["password"])){
            $pass = getPass($usuario);
            
            if ($pass == $contra) {
               
                $rol = getRol($usuario);
                $_SESSION['usuario'] = $usuario;
                $_SESSION['rol'] = $rol;
                
                

                header("Location: panel.php");

            }else
                echo '<script>alert("Contraseña incorrecta ");</script>';
        }else
        echo '<script>alert("Asegurate de ingresar todos los datos");</script>';
    }

    include("main.html");
?>