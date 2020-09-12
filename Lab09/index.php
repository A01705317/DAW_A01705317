<?php 
  include("_header.html");  
  include("_body.html");  

  function prom(&$arr)
  {
    shuffle($arr);
    return array_sum($arr)/count($arr);
  }

  function mediana(&$arr)
  {
    sort($arr);
    $cuenta = count($arr);
    $enmedio = floor(($cuenta-1)/2);
    if($cuenta % 2)
    {
      $mediana = $arr[$enmedio];
    }
    else
    {
      $low = $arr[$enmedio];
      $high = $arr[$enmedio];
      $mediana = (($low+$high)/2);
    }
    return $mediana;
  }
  
  function lista(&$arr, &$prom, &$mediana)
  {
    shuffle($arr);
    echo"<div class=\"row\">";
    echo "<div class=\"col s12 m3\">";
    echo "<ul class=\"collection\">";
    foreach($arr as $value)
    {
        echo "<li class=\"collection-item\">" .$value. "</li>";
    }
    echo"</ul>";
    echo"</div>";
      
    //segunda lista con respuestas
    echo "<div class=\"col s12 m8\">";
    echo "<ul class=\"collection\">";
    for($i = 0; $i< 4; $i++)
    {
        if($i==0)
        {
            echo "<li class=\"collection-item\"> Promedio: " .$prom. "</li>";
        }
        else if($i==1)
        {
            echo "<li class=\"collection-item\"> Mediana: " .$mediana. "</li>";
        }
        else if($i==2)
        {
            echo "<li class=\"collection-item\"> Menor a mayor: " ;
            sort($arr);
            foreach ($arr as $value)
            {
                echo $value. ", ";
            }
            echo "</li>";
        }
        else if($i==3)
        {
            echo "<li class=\"collection-item\"> Mayor a menor: " ;
            rsort($arr);
            foreach ($arr as $value)
            {
                echo $value. ", ";
            }
              echo "</li>";
        }
    }
    echo"</ul>";
    echo"</div>";
    echo"</div>";
    
  }

  function tabla()
  {
    $n = rand(3,15);
    echo "<p>Numero</p>" .$n ;
    echo "<blockquote>";
    echo "<table class=\"highlight\"><tbody>";
      //cuadrados
    echo"<tr> <th> Cuadrado </th>";
    
    for($i = 1; $i<= $n; $i++)
    {
        echo "<td>" .pow($i,2). "</td>";    
    }
    //Cubos
    //cuadrados
    echo"<tr> <th> Cubo </th>";
    for($i = 1; $i<= $n; $i++)
    {
        echo "<td>" .pow($i,3). "</td>"; 
    }
    echo "</tbody></table>";
    echo "</blockquote>";
  }

  function libre()
  {
  
      echo"<h5>String 1: anagram</h5>";
      echo"<h5>String 2: nagaram</h5>";
 
      $str1 = "anagram";
      $str2 = "anargam";
          
      if (count_chars($str1, 1) == count_chars($str2, 1))
      {
        echo "<br><h5>This two strings are an anagram</h5>";
      }
      else
      {
        echo "<br><h5>This two strings are not an anagram</h5>";
      }
    
  }

  $arr1 = array(13,87,22,9,54,12);
  $arr2 = array(34,73,86,43,100,92,2);
  
  $prom1 = prom($arr1);
  $prom2 = prom($arr2);

  $med1 = mediana($arr1);
  $med2 = mediana($arr2);
  
  include("_ejercicios.html");
  include("_preguntas.html");  
  include("_footer.html"); 
?> 