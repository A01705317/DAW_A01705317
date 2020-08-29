function comprobar()
{
    let password1 = document.getElementById("password1").value;
    let password2 = document.getElementById("password2").value;
    let longitud=false;
    let coinciden=false;
    let caracter=false;
    
    if(password1.length>=8)
    {
        longitud=true;
    }
    if (password1 == password2)
    {
  	     coinciden=true;
    }
    if(password1.match(/[!#$%*&.-]/))
    {
        caracter = true;
    }
    if(longitud==true && coinciden==true && caracter==true)
    {
        alert("Las contraseñas coinciden, cumplen con los requisitos de longitud de 8 carcateres y por lo menos un caracter especial.");
    }
    else alert("Las contraseñas o no coinciden, o no cumplen con los requisitos de longitud de 8 carcateres, o no tiene por lo menos un caracter especial.");    
}

function calcularPago()
{
    
    let cuatrimoto = document.getElementById("cuatrimoto").value;
    let raft = document.getElementById("raft").value;
    let paracaidismo = document.getElementById("paracaidismo").value;
    let zipline = document.getElementById("zipline").value;
    let escalada = document.getElementById("escalada").value;
    let bungee = document.getElementById("bungee").value;
    
    let total_cuatrimoto = 0;
    let total_raft = 0;
    let total_paracaidismo = 0;
    let total_zipline = 0;
    let total_escalada = 0;
    let total_bungee = 0;
    
    if(total_cuatrimoto > 2)
    {
        total_cuatrimoto = cuatrimoto*799;
    }
    else total_cuatrimoto = cuatrimoto*999;
    
    if(total_raft > 2)
    {
        total_raft = raft*599;
    }
    else total_raft = raft*799;
    
    if(total_paracaidismo > 2)
    {
        total_paracaidismo = paracaidismo*3000;
    }
    else total_paracaidismo = paracaidismo*3500;
    
    if(total_zipline > 2)
    {
        total_zipline = zipline*200;
    }
    else total_zipline = zipline*250;
   
    if(total_escalada > 2)
    {
        total_escalada = escalada*470;
    }
    else total_escalada = escalada*500;
   
    if(total_bungee > 2)
    {
        total_bungee = bungee*799;
    }
    else total_bungee = bungee*999;
        
    var subtotal = total_cuatrimoto + total_raft + total_paracaidismo + total_zipline + total_escalada + total_bungee;
    var iva = subtotal*.16;
    var total = subtotal+iva;
    
    document.getElementById("subtotal").innerHTML = "Subtotal: $ "+subtotal;    
    document.getElementById("iva").innerHTML = "IVA: $ " + iva.toFixed(2);
    document.getElementById("total").innerHTML = "Total: $ " + total;
}

function pago()
{
    
    let cuatrimoto = document.getElementById("cuatrimoto").value;
    let raft = document.getElementById("raft").value;
    let paracaidismo = document.getElementById("paracaidismo").value;
    let zipline = document.getElementById("zipline").value;
    let escalada = document.getElementById("escalada").value;
    let bungee = document.getElementById("bungee").value;
    
    let total_cuatrimoto = 0;
    let total_raft = 0;
    let total_paracaidismo = 0;
    let total_zipline = 0;
    let total_escalada = 0;
    let total_bungee = 0;
    
    if(total_cuatrimoto > 2)
    {
        total_cuatrimoto = cuatrimoto*799;
    }
    else total_cuatrimoto = cuatrimoto*999;
    
    if(total_raft > 2)
    {
        total_raft = raft*599;
    }
    else total_raft = raft*799;
    
    if(total_paracaidismo > 2)
    {
        total_paracaidismo = paracaidismo*3000;
    }
    else total_paracaidismo = paracaidismo*3500;
    
    if(total_zipline > 2)
    {
        total_zipline = zipline*200;
    }
    else total_zipline = zipline*250;
   
    if(total_escalada > 2)
    {
        total_escalada = escalada*470;
    }
    else total_escalada = escalada*500;
   
    if(total_bungee > 2)
    {
        total_bungee = bungee*799;
    }
    else total_bungee = bungee*999;
        
    var subtotal = total_cuatrimoto + total_raft + total_paracaidismo + total_zipline + total_escalada + total_bungee;
    var iva = subtotal*.16;
    var total = subtotal+iva;
    
    let nombre = document.getElementById("nombre").value;
    let apellido = document.getElementById("apellido").value;
    let no_tarjeta = document.getElementById("no_tarjeta").value;
    let cvv = document.getElementById("cvv").value;
    
    let nom=true;
    let ap=true;
    let no=true;
    let lno=true;
    let lcvv=true;
    
    if(nombre.match(/[1234567890!"·$%&/()=?¿]/))
    {
        nom = false;
        alert("El nombre solo puede llevar letras.");
    }
    if(apellido.match(/[1234567890!"·$%&/()=?¿]/))
    {
        ap = false;
        alert("El apellido solo puede llevar letras.");
    }
    if(no_tarjeta.length != 16)
    {
        lno = false;
        alert("El número de tarjeta debe de tener 16 dígitos.");
    }
    if(cvv.length != 3)
    {
        lcvv = false;
        alert("El CVV debe de tener 3 dígitos.");
    } 
    if(nom==true && ap==true && lno==true && lcvv==true)
    {
        document.getElementById("total").innerHTML = "<br>Pago Exitoso!<br>Total: $ " + total;
    }
    else alert("Error: Intentelo de nuevo! ");  
}

function cuatrimoto()
{
	document.getElementById("Cuatrimoto").innerHTML=
	"<h4>Recorrido de 50 km.<br>Todo el equipo incluido.</h4>";
}
function raft()
{
	document.getElementById("Raft").innerHTML=
	"<h4>Recorrido de 35 km.<br>Todo el equipo incluido.</h4>";
}
function paracaidas()
{
	document.getElementById("Paracaidas").innerHTML=
	"<h4>Altura de 5000m.<br>Todo el equipo incluido.</h4>";
}
function zipline()
{
	document.getElementById("Zipline").innerHTML=
	"<h4>Recorrido de 15 km.<br>Todo el equipo incluido.</h4>";
}
function escalada()
{
	document.getElementById("Escalada").innerHTML=
	"<h4>Escalada de 2500m.<br>Todo el equipo incluido.</h4>";
}
function bungee()
{
	document.getElementById("Bungee").innerHTML=
	"<h4>Altura de 500m.<br>Todo el equipo incluido.</h4>";
}

function cambiarTexto(obj)
{
    obj.style.color="orange";
}

function stillThere()
{
  setTimeout(function(){ confirm("¿Sigues comprando actividades?"); }, 20000);
}

function agrandar(obj)
{
    obj.style.width = "40%";
}

function regresar(obj)
{
  obj.style.width = "30%";
}








