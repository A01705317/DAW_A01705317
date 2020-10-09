$(document).ready(function() {

    
    $('#plantilla').hide();
    $('#personalizar').hide();
    $('#publicacion').hide();
    $('#dominio').hide()
    $("div").find('.nDom').hide();
    $("div").find('.yDom').hide();
    
    $("div").find('.cont-element').each(function () {
            
        $(this).hide();

    });


    $(".side-element").click(function () {
        $(this).addClass("active");
        $(".side-element").not(this).removeClass("active");
        $('#place-holder').hide();

        let sidenav = $(this).attr("nav-id");

        $("div").find('.cont-element').each(function () {
            
            if (sidenav == $(this).attr("nav-id")) {

                $(this).show(); 
            }else
                $(this).hide();
 
        });
        
    });

    $(".plantilla").click(function () {

        $(this).addClass("viewing");
        $(".plantilla").not(this).removeClass("viewing");

        let button = $(this).attr("id-template");

        $("div").find('.prev').each(function () {
            
            if (button == $(this).attr("id-template")) {

                $(this).addClass("selected"); 
            }else
                $(this).removeClass("selected");
 
        });
        
       
    });
    
    $(".buttNeDom").click(function () {
        $("div").find('.nDom').show();
        $("div").find('.yDom').hide();
    });
    $(".buttYaDom").click(function () {
        $("div").find('.yDom').show();
        $("div").find('.nDom').hide();
    });

});