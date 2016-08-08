<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Code - Artículo</title>

    <!-- no se cargan estos scripts -->
    <g:javascript src="${resource(dir: 'js/plugins/ckeditor', file: 'ckeditor.js')}"></g:javascript>
    <script src="${resource(dir: 'js/plugins/ckeditor', file: 'ckeditor.js')}"></script>
    <script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js/vendor', file: 'jquery.ui.widget.js')}"></script>
    <script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js/imgResize', file: 'load-image.min.js')}"></script>
    <script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js/imgResize', file: 'canvas-to-blob.min.js')}"></script>
    <script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js', file: 'jquery.iframe-transport.js')}"></script>
    <script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js', file: 'jquery.fileupload.js')}"></script>
    <script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js', file: 'jquery.fileupload-process.js')}"></script>
    <script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js', file: 'jquery.fileupload-image.js')}"></script>
    <link href="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/css', file: 'jquery.fileupload.css')}"
          rel="stylesheet">

</head>

<body>
<style type="text/css">
.mediano {
    margin-top: 5px;
    padding-top: 9px;
    height: 30px;
    font-size: inherit;
    /*font-size: medium;*/
    text-align: right;
}

.sobrepuesto {
    position: absolute;
    top: 1px;
    font-size: 14px;
}

.nav-tabs > li > a {
    border: medium none;

}

.nav-tabs > li > a:hover {
    background-color: #475563 !important;
    border: medium none;
    border-radius: 0;
    color: #fff;
    /*color:#475563 !important;;*/
}

</style>

<div class="col-md-12" style="margin-top: -50px;">Artículo</div>

<div class="panel panel-primary col-md-12">

    <div class="panel-heading">
        <h3 class="panel-title" style="text-align: right"><i class="fa fa-pencil-square"></i> Bitácora - Artículo
        </h3>

        <a href="#" id="btnGuardar" class="btn btn-sm btn-success sobrepuesto" title="Guardar información">
            <i class="fa fa-save"></i> Guardar
        </a>
        <a href="#" id="btnImprimir" class="btn btn-sm btn-info sobrepuesto" style="margin-left: 94px"
           title="Imrpimir artículo">
            <i class="fa fa-print"></i> Imprimir
        </a>
        <a href="${createLink(controller: 'buscarBase', action: 'busquedaBase')}" id="btnConsultarr"
           class="btn btn-sm btn-primary sobrepuesto" style="margin-left: 188px" title="Consultar artículo">
            <i class="fa fa-check"></i> Consultar
        </a>
        <a href="#" id="btnArticulo" class="btn btn-sm btn-primary sobrepuesto"
           style="margin-left: 290px" title="Crear nuevo registro">
            <i class="fa fa-check"></i> Crear Nuevo
        </a>
        <a href="#" id="btnVer" class="btn btn-sm btn-primary sobrepuesto" style="margin-left: 410px"
           title="Ver registro">
            <i class="fa fa-search"></i> Ver
        </a>

    </div>

    <div>
        <g:form name="frmArticulo" role="form" action="guardarArtc_ajax" method="POST">
            <div class="row">
                <div class="col-md-8">
                    <span class="col-md-3 label label-primary text-info mediano">Título</span>

                    <div class="col-md-9">
                        <g:textField name="titulo" id="titulo" class="form-control required"
                                     maxlength="127" value="${artc?.titulo}"/>
                    </div>
                </div>

                <div class="col-md-4">
                    <span class="col-md-3 label label-primary text-info mediano">Orden</span>

                    <div class="col-md-4">
                        <g:textField name="orden" id="orden" class="form-control" maxlength="255"
                                     value="${artc?.orden}"/>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-md-12">
                    <span class="col-md-2 label label-primary text-info mediano">Subtítulo</span>

                    <div class="col-md-10">
                        <span class="grupo">
                            <g:textArea name="subtitulo" id="subtitulo" class="form-control required" maxlength="255"
                                        style="height: 40px; resize: none" value="${artc?.subtitulo}"/>
                        </span>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <span class="col-md-2 label label-primary text-info mediano">Descripción</span>

                    <div>
                        <div class="col-md-10">
                            <span class="grupo">
                                <g:textArea name="descripcion" id="descripcion" class="form-control required" maxlength="255"
                                            style="height: 60px; resize: none" value="${artc?.descripcion}"/>
                            </span>
                        </div>

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <span class="col-md-2 label label-primary text-info mediano">Texto</span>

                    <div class="col-md-10">
                        <textArea name="texto" id="texto">${artc?.texto}</textArea>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-bottom: 20px">
                <div class="col-md-12">
                    <span class="col-md-2 label label-primary text-info mediano">Imagen</span>

                    <div class="col-md-10">
                        <g:textField name="imagen" id="imagen" class="form-control" maxlength="255"
                                     value="${artc?.imagen}"/>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-bottom: 20px">
                <div class="col-md-12">
                    <span class="col-md-2 label label-primary text-info mediano">Meta</span>

                    <div class="col-md-10">
                        <g:textField name="metaDescripcion" id="metaDescripcion" class="form-control" maxlength="255"
                                     value="${artc?.metaDescripcion}"/>
                    </div>
                </div>
            </div>

        </g:form>
    </div>
</div>


<script type="text/javascript">


    CKEDITOR.replace('texto', {
        height: "240px",
//        customConfig: 'config.js'
        customConfig: 'config.js',
        filebrowserBrowseUrl: '${createLink(controller: "artcImagenes", action: "browser")}',
        filebrowserUploadUrl: '${createLink(controller: "artcImagenes", action: "uploader")}'
    });

    CKEDITOR.on('instanceReady', function (ev) {
        // Prevent drag-and-drop.
        ev.editor.document.on('drop', function (ev) {
            ev.data.preventDefault(true);
        });
    });


    $("#btnArticulo").click(function () {
        location.href = "${createLink(action: 'articulo')}"
    });

    $("#btnGuardar").click(function () {
        var $form = $("#frmArticulo");
        var txto = CKEDITOR.instances.texto.getData();
        var base_id = '${artc?.id}';
        if ($form.valid()) {
            $.ajax({
                type: 'POST',
                url: "${createLink(action: 'guardarArtc_ajax')}",
                data: {
                    id: base_id,
                    titulo: $("#titulo").val(),
                    orden: $("#orden").val(),
                    subtitulo: $("#subtitulo").val(),
                    descripcion: $("#descripcion").val(),
                    texto: txto,
                    imagen: $("#imagen").val(),
                    metaDescripcion: $("#metaDescripcion").val()
                },
                success: function (msg) {
                    var parte = msg.split("_");
                    if (parte[0] == 'ok') {
                        log("Problema guardado correctamente", "success")
                        setTimeout(function () {
                            reCargar(parte[1]);
                        }, 500);
                    } else {
                        log("Error al guardar el problema", "error")
                    }
                }
            });
        }
    });

    function reCargar(id) {
        var url = "${createLink(action: 'articulo')}" + "/" + id
        location.href = url
    }


    var validator = $("#frmArticulo").validate({
        errorClass: "help-block",
        errorPlacement: function (error, element) {
            if (element.parent().hasClass("input-group")) {
                error.insertAfter(element.parent());
            } else {
                error.insertAfter(element);
            }
            element.parents(".grupo").addClass('has-error');
        },
        success: function (label) {
            label.parents(".grupo").removeClass('has-error');
        },
        rules: {
            titulo: {
                remote: {
                    url: "${createLink(action: 'validarTitulo_ajax')}",
                    type: "post",
                    data: {
                        id: $("#titulo").val()
                    }
                }
            },
            clave: {
                remote: {
                    url: "${createLink(action: 'validarEstado_ajax')}",
                    type: "post",
                    data: {
                        id: $("#estado").val()
                    }
                }
            }
        },
        messages: {
            titulo: {
                remote: "El número mínimo de caracteres debe ser de 3"
            },
            clave: {
                remote: "El número mínimo de caracteres debe ser de 3"
            }
        }
    });
    $(".form-control").keydown(function (ev) {
        if (ev.keyCode == 13) {
            submitForm();
            return false;
        }
        return true;
    });


    function createContainer() {
        var file = document.getElementById("file");
        var next = $("#files").find(".fileContainer").size();
        if (isNaN(next))
            next = 1;
        else
            next++;
        var ar = file.files[next - 1];
        var div = $('<div class="fileContainer ui-corner-all d-' + next + '">');
        var row1 = $("<div class='row resumen'>");
        var row3 = $("<div class='row botones'  style='text-align: center'>");
        var row4 = $("<div class='row'>");
        row1.append("<div class='col-md-1 etiqueta'>Descripción</div>");
        row1.append("<div class='col-md-5'><textarea maxlength='254' style='resize: none' class='form-control " + next + "' required id='descripcion' name='descripcion' cols='5' rows='5'></textarea></div>");
        row3.append(" <a href='#' class='btn btn-azul subir' style='margin-right: 15px;' clase='" + next + "'><i class='fa fa-upload'></i> Guardar Imagen</a>");
        div.append("<div class='row' style='margin-top: 0px'><div class='titulo-archivo col-md-10'><span style='color: #327BBA'>Archivo:</span> " + ar.name + "</div></div>");
        div.append(row1);
        div.append(row3);
        $("#files").append(div);
        if ($("#files").height() * 1 > 120) {
            $("#titulo-arch").show();
            $("#linea-arch").show();
        } else {
            $("#titulo-arch").hide();
            $("#linea-arch").hide();
        }
    }

    function reset() {
        $("#files").find(".fileContainer").remove()
    }

    $("#file").change(function () {
        reset();
        archivos = $(this)[0].files;
        var length = archivos.length;
        for (i = 0; i < length; i++) {
            createContainer();
        }
        boundBotones();
    });


    function boundBotones() {
        $(".subir").unbind("click");
        $(".subir").bind("click", function () {
            error = false;
            $("." + $(this).attr("clase")).each(function () {
                if ($(this).val().trim() == "") {
                    error = true;
                }
            });
            if (error) {
                bootbox.alert("La imagen debe tener una descripción")
            } else {
                /!*Aqui subir*!/
                upload($(this).attr("clase") * 1 - 1);
            }
        });
    }


    var request = [];
    var tam = 0;
    function upload(indice) {
        var base = "${artc?.id}";
        var file = document.getElementById("file");
        var formData = new FormData();
        tam = file.files[indice];
        var type = tam.type;
        if (okContents[type]) {
            tam = tam["size"];
            var kb = tam / 1000;
            var mb = kb / 1000;
            if (mb <= 5) {
                formData.append("file", file.files[indice]);
                formData.append("id", base);
                $("." + (indice + 1)).each(function () {
                    //            console.log($(this))
                    formData.append($(this).attr("name"), $(this).val());
                });
                var rs = request.length;
                $(".d-" + (indice + 1)).addClass("subiendo").addClass("rs-" + rs);
                $(".rs-" + rs).find(".resumen").remove();
                $(".rs-" + rs).find(".botones").remove();
                $(".rs-" + rs).find(".claves").remove();
                $(".rs-" + rs).append('<div class="progress-bar-svt ui-corner-all" id="p-b"><div class="progress-svt background-image" id="p-' + rs + '"></div></div>').css({
                    height: 100,
                    fontWeight: "bold"
                });
                request[rs] = new XMLHttpRequest();
                request[rs].open("POST", "${g.createLink(controller: 'base',action: 'subirImagen')}");


                request[rs].upload.onprogress = function (ev) {
                    var loaded = ev.loaded;
                    var width = (loaded * 100 / tam);
                    if (width > 100)
                        width = 100;
                    //        console.log(width)
                    $("#p-" + rs).css({width: parseInt(width) + "%"});
                    if ($("#p-" + rs).width() > 50) {
                        $("#p-" + rs).html("" + parseInt(width) + "%");
                    }
                };
                request[rs].send(formData);
                request[rs].onreadystatechange = function () {
                    //            console.log("rs??",rs)
                    if (request[rs].readyState == 4 && request[rs].status == 200) {
                        if ($("#files").height() * 1 > 120) {
                            $("#titulo-arch").show();
                            $("#linea-arch").show();
                        } else {
                            $("#titulo-arch").hide();
                            $("#linea-arch").hide();
                        }
                        $(".rs-" + rs).html("<i class='fa fa-check' style='color:#327BBA;margin-right: 10px'></i> " + $(".rs-" + rs).find(".titulo-archivo").html() + " subido exitosamente").css({
                            height: 50,
                            fontWeight: "bold"
                        }).removeClass("subiendo");

                        cargarCarrusel(${artc?.id})
                    }
                };
            } else {
                var $div = $(".fileContainer.d-" + (indice + 1));
                $div.addClass("bg-danger").addClass("text-danger");
                var $p = $("<div>").addClass("alert divError").html("No puede subir archivos de más de 5 megabytes");
                $div.prepend($p);
                return false;
            }
        } else {
            var $div = $(".fileContainer.d-" + (indice + 1));
            $div.addClass("bg-danger").addClass("text-danger");
            var $p = $("<div>").addClass("alert divError").html("No puede subir archivos de tipo <b>" + type + "</b>");
            $div.prepend($p);
            return false;
        }
    }


    $("#btnVer").click(function () {
        var id_base = ${artc?.id}
                console.log('id:', id_base);
        $("#dialog-body").html(spinner);
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'base', action: 'ver_ajax')}',
            data: {
                id: id_base
            },
            success: function (msg) {
                $("#dialog-body").html(msg)
            }
        });
        $("#dialog").modal("show");
    });


</script>

</body>
</html>