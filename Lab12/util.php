<?php
    function comprobar($nombre, $apellido, $edad, $afiliacion, $estado, $ciudad,  $tiempo, $tel, $email)
    {
        if($tiempo <= 27 && ($estado == "Queretaro" || $estado == "Nuevo Leon" || $estado == "Aguascalientes" || $estado == "Baja California" || $estado == "Baja California Sur" || $estado == "Campeche" || $estado == "Coahuila" || $estado == "Colima" || $estado == "Chiapas" || $estado == "Chihuahua" || $estado == "Durango" || $estado == "Guanajuato" || $estado == "Guerrero" || $estado == "Hidalgo" || $estado == "Jalisco" || $estado == "Michoacan" || $estado == "Estado de Mexico" || $estado == "Ciudad de Mexico" || $estado == "Morelos" || $estado == "Nayarit" || $estado == "Oaxaca" || $estado == "Puebla" || $estado == "Quintana Roo" || $estado == "San Luis Potosi" || $estado == "Sinaloa" || $estado == "Sonora" || $estado == "Tabasco" || $estado == "Tamaulipas" || $estado == "Tlaxcala" || $estado == "Veracruz" || $estado == "Yucatan"|| $estado == "Zacatecas" ))
        {
            $resp = "FELICIDADES!!!";
            $foto = "https://cdn0.iconfinder.com/data/icons/social-messaging-ui-color-shapes/128/check-circle-green-512.png";
            $msj =  "felicidades ha calificado al Campeonato Nacional de Natación.";
            
        }
        else
        {
            $resp = "Lo sentimos";
            $foto = "https://cdn.pixabay.com/photo/2017/02/12/21/29/false-2061131_960_720.png";
            if($tiempo > 27)
            {
                $msj =  "lo sentimos no ha calificado al Campeonato Nacional de Natación, porque no dió el tiempo requerido.";
            }
            else
            {
                $msj =  "lo sentimos no ha calificado al Campeonato Nacional de Natación, porque no habita en un estado de México.";
            }
            
        }
        include("_calificacion.html");
    }
?>