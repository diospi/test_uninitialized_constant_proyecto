// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs

//$(document).ready(function() {
//
//	$('#my-link').click(function(event){
//		$('#my-link').prev("input[type=hidden]").val("1");
//		$('#my-link').closest('.fields').hide();
//	});
//});

// set default date format para todos los datepickers

//function size_window()
//{
//    var width = $(window).width() - 10;
//    var height = $(window).height()- 95;
//    $('#cuerpo').css({'width':width, 'height': height});
//    $('#contenedor').css({'width':width});
//}
//
//
//$(document).ready(function(){
//    size_window()
//    $(window).resize(function(){
//        size_window()
//    });
//
//});


//$('.horst').live('click', function(e) {
//    alert('hallo');
//    window.open( $(this).attr('href'), "Popup", "height=600, width=600" );
//    e.preventDefault();
//});

//function openPopup(link)
//{
//    alert('hallo Friedheim');
//    link.hide();
//    window.open(link.href,'exam_dialog','toolbar=no,location=no,menubar=no,scrollbars=yes,resizable=no');
//    return false;
//}

//viene de http://stackoverflow.com/questions/9276086/popup-window-to-return-data-to-parent-on-close

//function HandlePopupResult(result) {
//    $.ajax({
//        url: "/ajax/producto",
//        type: "GET",
//        data: { id: result},
//        dataType: "text",
//        success: function(responseData){
//            data = JSON.parse(responseData)
//            num_id = $('#line_nr').val()
//            $('#ft_venta_venta_dets_attributes_'+num_id+'_producto_id').val(data.id)
//            $('#ft_venta_venta_dets_attributes_'+num_id+'_cantidad').val(1)
//            $('#ft_venta_venta_dets_attributes_'+num_id+'_precio').val(data.precio)
//            $('#ft_venta_venta_dets_attributes_'+num_id+'_cantidad').select()
//        }
//    });
//
//
////    num_id = this.id.replace(/\D/g, "")
////    $('#ft_venta_venta_dets_attributes_'+num_id+'_producto_id').val ui.item.id
////    $('#ft_venta_venta_dets_attributes_'+num_id+'_cantidad').val ui.item.cantidad
////    $('#ft_venta_venta_dets_attributes_'+num_id+'_precio').val ui.item.precio
////    $('#ft_venta_venta_dets_attributes_'+num_id+'_cantidad').select()
////        # $('.igv').val(num_id)  # anum var = / (^ - * \ d + $) | (. ^ - * \ d + \ \ d + $) /
////        # $('#ft_venta_venta_dets_attributes_'+num_id+'_subtotal').val ui.item.precio*ui.item.cantidad
////})
////)
//}

//function CloseMySelf(sender) {
//    try {
//        window.opener.HandlePopupResult(sender.getAttribute("result"));
//    }
//    catch (err) {}
//    window.close();
//    return false;
//}


function agreagar_a_multiple(idx) //clase,objfin)
{
    var num = idx.id.replace(/\D/g,'')
    var idarea = "#hds_atencion_atencion_dets_attributes_"+num+"_comentario"
    $.ajax({
        url: "/ajax/notas_medicas",
        type: "GET",
        data: { id: idx.value },
        dataType: "text",
        success: function(responseData){
            $(idarea).val(responseData);
        }
    });
}



$.datepicker.setDefaults(
    $.extend(
        {'dateFormat':'yy-mm-dd',
         'hideIfNoPrevNext': true}

    )
);

$(function() {
    $( "#hasDatepicker" ).datepicker( $.datepicker.regional[ "es" ] );
});

function remove_fields(link, remove_classes){
    $(link).prev("input[type=hidden]").val('1');
    $(link).closest('.fields').hide();
    //remover classes, que no calcule estos valores
    $(link).closest('.fields').find('*').removeClass(remove_classes);
}


function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $(link).parent().prev().find("tbody tr:last").first().after(content.replace(regexp, new_id));


    //despues de anadir poner igv-checkbox activado, si es activado para todo el documento
    if ($('#hds_documento_igv_check').is(':checked')){
        $("#hds_documento_documento_dets_attributes_"+ new_id+"_igv_check").prop("checked", true);
    }
    /*++++++++++++++++++++++++++++++++++++
     // todo code duplicacion de documentos.js.coffee actualisar_cc_proyecto_fields
     //despues de añadir ocultar / mostrar centrocosto y proyecto field
     var radio_val = $('input:radio[name=documento[gasto_ingreso]]:checked').val();
     if (radio_val=="compra"){
     $(".centrocosto_show").show();
     $(".proyecto_show").hide();
     }
     else{
     $(".centrocosto_show").hide();
     $(".proyecto_show").show();
     }
     ++++++++++++++++++++++++++++++++++*/
}

//function hasClass(element, cls) {
//    alert(element.className());
////    alert(element.className());
//    return (' ' + element.className() + ' ').indexOf(' ' + cls + ' ') > -1;
//}

// ==========================Para Accordion Basico=========================================
function inicioAccordion()
{
//    $("#main_menu li").on('click','a',alert('hallo Friedheim'));
//        function () { alert('Hallo Friedheim');}
//    );
    menu = false;
    $('li.main_menu').on('click', 'a', mostrarDetallesAccordionOCloseMenu); //,function() {$(this).slideUp(1500);});
    $('li:not(.main_menu)').on('mouseover','a', mostrarDetallesAccordion)
    $('li:not(.main_menu)').on('mouseover','span', mostrarDetallesAccordion)
//        $(' li').on('mousedown', 'ul', function(){ alert("adios") });
    $('li ul').addClass('esconder');
//        $('#menu-hor').blur(alert("adios")) ;
}


function cambiacolorfila(table)
{
    $(table+" tr").hover(function() { $(this).css({ 'background':'limegreen'}); },function() { $(this).css({ 'background':''}); } );
}




function closeMenu()
{
    $('#menu-hor li ul').fadeOut(100);
    menu = false;
}


function sleep(ms)
{
    var dt = new Date();
    dt.setTime(dt.getTime() + ms);
    while (new Date().getTime() < dt.getTime());
}

function mostrarDetallesAccordionOCloseMenu(){
    if (menu == true){
        closeMenu();
    }else{
        //TODO eliminar duplicacion de codigo con funcion mostrarDetallesAccordion no funciona si llama a este funcion
        // quizas no conoce $(this)
        menu = true;
        sleep(30)
        $(this).parent()
            .siblings()
            .children()
            .filter('.esconder')
            .slideUp();   // OCultar               Menu
        //       actualizar_path($(this))
        $(this).next().slideDown(20)    // Muestra
    }
}

function mostrarDetallesAccordion()
{
    menu = true;
    sleep(30)
    $(this).parent()
        .siblings()
        .children()
        .filter('.esconder')
        .slideUp();   // OCmenuultar               Menu
    //       actualizar_path($(this))

    $(this).next().slideDown(20)    // Muestra
//    $('#menu-hor li').hover(
//        function () {
////                $('ul', this).fadeIn(); 	// fadeIn will show the sub cat menu
//        },
//        function () {
////            $('ul', this).fadeOut(100);	 // fadeOut will hide the sub cat menu
//        }
//    );
}

$(document).ready(function() {

    inicioAccordion();

 //   $("tr").hover(function() { $(this).css({ 'background':'#FFFCCC'}); },function() { $(this).css({ 'background':''}); } );

    $(document).click(function(event) {
        var text = $(event.target).text();
        var containsClassMenuSpan = $(event.target).hasClass('menu_span');

        if (text != ' Menu' && !containsClassMenuSpan){
            closeMenu();
        }
    });
});


function mostrar_path(url)
{
    $('#navegador').html("PAHT/"+url);//(url.clone() + url.clone())  ;
}


//***********************************************************
function actualizar_path(obj_x)
{
    var listas = [];
    var ii=0;
    while(obj_x.parent().id != '#menu-lateral')
    {
        listas.push(obj_x.clone());//.push($("<spam> | </spam>"));
        listas.push($("<spam>|</spam>"))   ;
        if(obj_x.parent().parent("ul.esconder").length>0)
        {
            obj_x = obj_x.parent().parent("ul.esconder").siblings("a:first");
        }
        else
        {
            obj_x = obj_x.parent().parent();
            break;
        }
        if(ii++>100) {
            break;   // Evita Bucle infinito
        }
    }
    var new_path = $("<spam> PATH :: </spam>");
    for(var i=listas.length;i>0;i--)
    {
        new_path.append(listas[i-1])  ;
    }
    $('#navegador').html(new_path);//.html($("<spam>WIL:// </spam>").append(listas.join("")))  ;
}
function calcular_centro_menu(lista_objetos)
{
    var total = lista_objetos.length;
    var ancho = lista_objetos.first.width
    var alto = lista_objetos.first.height
    var x = $(this).screenX
    var y = $(this).screenY


    if(total==7)
    {
        lista_objetos[6].css({ float:rigth, position: absolute })

    }
      alert(lista_objetos.length);

}

// ===================================================================/* */
$(document).ready(function() {

    $("#mostrar_ocultos_check").click (function() {
       if($("#mostrar_ocultos_check").is(':checked'))
       {
           $(".estado0").show();

       }
       else
       {
           $(".estado0").hide();
       }

    })





    if ($('.tabla_datos_titulos_cabezera_fijo').length > 0) {
        $('.tabla_datos_titulos_cabezera_fijo').scrollbarTable();
    }

    $(function() {
        return $('.ui-autocomplete-input').click(function() {
            return $(this).select();
        });                                                                                                          f
    });
    /*  ==========Codigo para  coffeScript
     $ ->
     $('input:text').click ->
     $(this).select()
     */
//    calcular_centro_menu($("#menu-hor ul").children("li:visible"))

});

function myround(zahl,n_stelle) {
    var zahl = (Math.round(zahl * Math.pow(10,n_stelle)) / Math.pow(10,n_stelle ));
    return zahl;
}

function anadir_leading_ceros(numero, numero_digitos) {
    var str = '' + numero;
    while (str.length < numero_digitos){
        str = '0' + str;
    }
return str;
}

// best_in_place
$(document).ready(function() {
    $('.best_in_place').best_in_place();
});

// no submit on enter in autocomplete fields

$(document).ready(function() {
    $('.ui-autocomplete-input ').keypress(function(e){
//        if ( e.which == 13 ) return false;
//        //or...
        if ( e.which == 13  && !$(e.target).hasClass('permit_enter'))
            e.preventDefault();
    });
});

