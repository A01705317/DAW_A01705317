function cuadradoYcubico()
{
    let numero = prompt("Ingrese un número");
    let cuadrado= new Array(numero);
    let cubo = new Array(numero);
    let numeros = new Array(numero);
    
    for (let i=1; i<=numero; i++)
    {
        cuadrado[i]=Math.pow(i,2);
    }
    
    for (let i=1; i<=numero; i++)
    {
        cubo[i]=Math.pow(i,3);
    }
    
    for (let i=1; i<=numero; i++)
    {
        numeros[i]=i;
    }
  
    var article = document.getElementsByTagName("article")[0];
    var tabla   = document.createElement("table");
    var tblBody = document.createElement("tbody");
 
  
    for (var i = 0; i <=2; i++)
    {
        var column = document.createElement("tr");
 
        for (var j = 0; j <= numero; j++)
        {
   
            var celda = document.createElement("td");
            
            if(j==0 && i==0)
            {
                var textoCelda = document.createTextNode("Número");
            }
            else if(j==0 && i==1)
            {
                var textoCelda = document.createTextNode("Cuadrados");
            }
            else if(j==0 && i==2)
            {
                var textoCelda = document.createTextNode("Cubos");
            }
            else
            {
                if(i==0)
                {
                    var textoCelda = document.createTextNode(numeros[j]);
                }
                else if(i==1)
                {
                   var textoCelda = document.createTextNode(cuadrado[j]); 
                }
                else
                {
                   var textoCelda = document.createTextNode(cubo[j]); 
                }
            }
            
            celda.appendChild(textoCelda);
            column.appendChild(celda);
        
        }
        tblBody.appendChild(column);
    }
 
    tabla.appendChild(tblBody);
    article.appendChild(tabla);
    tabla.setAttribute("border", "1");
   
}

function checarSuma()
{
    let numero1 = Math.floor(Math.random() * (50 - 1)) + 1;
    let numero2 = Math.floor(Math.random() * (50 - 1)) + 1;
    
    let tiempo1 = Date.now();
    let respuesta = prompt("Ingrese el Resultado de la Suma de: " + numero1 + " + " + numero2);
    let tiempo2 = Date.now();
    
    let suma = numero1 + numero2;
    let tiempo = (tiempo2-tiempo1)/1000;
    
    if(respuesta == suma)
    {
        document.write("Respuesta Correcta!<br/>Tiempo de Respuesta: " + tiempo + " segundos");
    }
    else document.write("Respuesta Incorrecta!<br/>Tiempo de Respuesta: " + tiempo + " segundos");
}


function contador(array)
{
    let negativos = 0, positivos = 0, ceros = 0;
    
    for(let i = 0; i < array.length; i++)
    {
        if(array[i] < 0)
        {
            negativos++;
        }
        if(array[i] == 0)
        {
            ceros++;
        }
        if(array[i] > 0)
        {
            positivos++;
        }
    }
    
    document.write("Array: " + array + "<br/><br/>Negativos: " + negativos + "<br/><br/>Ceros: " + ceros + "<br/><br/>Positivos: " + positivos);
}

function promedios(matriz) 
{
    let promediosRenglones = [
        [0],
        [0],
        [0],
        [0],
    ]
    
    for(let renglon = 0; renglon<4; renglon++)
    {
        for (let columna = 0; columna<4; columna++)
        {
             promediosRenglones[renglon][0]= promediosRenglones[renglon][0] + matriz[renglon][columna];
        }
        promediosRenglones[renglon][0] = promediosRenglones[renglon][0]/4 + " ";
    }
    
    document.write("Matriz 4x4: " + matriz + "<br/>Promedios por Renglones: " + promediosRenglones);
}

function inverso()
{
    let numero = prompt("Ingrese un Número");
    let numeroInvertido = "";
    
    while((numero/10) != 0)
    {
        numeroInvertido += numero%10;
        numero = parseInt(numero/10);
    }
    
    document.write("Invertido: " + numeroInvertido);    
}

function problema()
{
    alert("Problema de Clase de Algoritmos\n\nDescripción del Problema: According to an old legeng, a long time ago Ankh-Morpork residents did something wrong to miss Fortune, and she cursed them. She said that at some time n snacks of distinct sizes will fall on the city, and the residents should build a Snacktower of them by placing snacks one on another. Of course, big snacks should be at the bottom of the tower, while small snacks should be at the top.\n\nYears passed, and once different snacks started to fall onto the city, and the residents began to build the Snacktower.\n\nHowever, they faced some troubles. Each day exactly one snack fell onto the city, but their order was strange. So, at some days the residents weren't able to put the new stack on the top of the Snacktower: they had to wait until all the bigger snacks fell. Of course, in order to not to anger miss Fortune again, the residents placed each snack on the top of the tower immediately as they could do it.\n\nWrite a program that models the behavior of Ankh-Morpork residents.")
    
    alert("Input: The first line contains single integer n (1 ≤ n ≤ 100 000) — the total number of snacks.\n\nThe second line contains n integers, the i-th of them equals the size of the snack which fell on the i-th day. Sizes are distinct integers from 1 to n.\n\nOutput: Print n lines. On the i-th of them print the sizes of the snacks which the residents placed on the top of the Snacktower on the i-th day in the order they will do that. If no snack is placed on some day, leave the corresponding line empty.")
    
    alert("Example 1:\nInput:\n3\n3 1 2\nOutput:\n3\n2 1\n\n\nExample 2:\nInput:\n5\n4 5 1 2 3\nOutput:\n5 4\n3 2 1")

    let snack_array = new Array(100000);
    
    let num_snacks = prompt("Ingrese el número total de snacks:");
    
    let current_snack = num_snacks;
    
    for(var i=0; i < num_snacks; i++)
    {
 	    let tamano_snack = prompt("Ingrese el tamaño del snack:");
        
        snack_array[tamano_snack]=1;
        
        while(snack_array[current_snack]==1)
        {
            document.write(current_snack + " ");
            current_snack--;
        }
        document.write("<br/>");

    }
    return 0;
    
}