$("#buscar").change(function () {
    $.get("buscar.php", {
        id: $("#buscar").val(),
    }).done(function (data) {
        $("#resultados_busqueda").html(data);
    }).fail(function () {
        alert("error");
    });
});