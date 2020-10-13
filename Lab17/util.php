<?php
    //Haz una función llamada connectDb la cual validará que la conexión sea correcta.
    function connectDb()
    {
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "rbac";

        $con = mysqli_connect($servername, $username, $password, $dbname);

        //check connection
        if(!$con)
        {
            die("Connection faled: " . mysqli_connect_error());
        }

        return $con;
    }
    //Haz una función llamada closeDB que recibirá como parámetro una conexión establecida previamente.
    //La variable $mysql es una conexión establecida anteriormente
    //tomando de ejemplo la maigen anterior, podría mandar a llamar la función
    //mandando como parámetro $con
    function closeDb($mysql)
    {
        mysqli_close($mysql);
    }

    function getPass($username)
    {
        $conn = connectDb();
        $sql = "SELECT Contrasena FROM usuario WHERE Id_usuario =  '$username' ";
        $result = mysqli_query($conn, $sql);
        $row = $result->fetch_assoc();
        $pass = implode(',' ,$row);
        
        closeDb($conn);
        
        return $pass;
    }

    function getRol($idusuario)
    {
        $conn = connectDb();
        $sql = "SELECT Id_Rol FROM roles_usuario WHERE Id_usuario = '$idusuario'";
        $result = mysqli_query($conn, $sql);
        $row = $result->fetch_assoc();
        $rol = implode(',' ,$row);

        closeDb($conn);
        return $rol;
    }

    function getUsers()
    {
        $conn = connectDb();
        $sql = "SELECT Id_Usuario, Nombre, Apellidos FROM usuario";
        $result = mysqli_query($conn, $sql);

        closeDb($conn);

        return $result;
    }

    function getEmp()
    {
        $conn = connectDb();
        $sql = "SELECT Id_Usuario, RFC FROM trabajadores";
        $result = mysqli_query($conn, $sql);

        closeDb($conn);

        return $result;
    }

?>

