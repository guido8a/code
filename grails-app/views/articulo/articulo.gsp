<%@ page import="code.Seccion" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Code - Artículo</title>
</head>

<body>

<!-- no se cargan estos scripts si están el en head -->
<script src="${resource(dir: 'js/plugins/ckeditor', file: 'ckeditor.js')}"></script>
%{--<script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js/vendor', file: 'jquery.ui.widget.js')}"></script>--}%
%{--<script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js/imgResize', file: 'load-image.min.js')}"></script>--}%
%{--<script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js/imgResize', file: 'canvas-to-blob.min.js')}"></script>--}%
%{--<script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js', file: 'jquery.iframe-transport.js')}"></script>--}%
%{--<script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js', file: 'jquery.fileupload.js')}"></script>--}%
%{--<script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js', file: 'jquery.fileupload-process.js')}"></script>--}%
%{--<script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js', file: 'jquery.fileupload-image.js')}"></script>--}%
%{--<link href="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/css', file: 'jquery.fileupload.css')}"--}%
      %{--rel="stylesheet">--}%

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

<elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

%{--<div class="col-md-12" style="margin-top: -50px;">Artículo</div>--}%
<div class="btn-group" style="float: left; margin-bottom: 10px">
    <g:link controller="articulo" action="lista" class="btn btn-primary " title="Regresar a la lista de artículos">
        <i class="fa fa-chevron-left"></i> Regresar
    </g:link>
</div>

<div class="panel panel-primary col-md-12">

    <div class="panel-heading">
        <h3 class="panel-title" style="text-align: right"><i class="fa fa-pencil-square"></i> Artículo
        </h3>

        <a href="#" id="btnGuardar" class="btn btn-sm btn-success sobrepuesto" title="Guardar información">
            <i class="fa fa-save"></i> Guardar
        </a>
        %{--<a href="${createLink(controller: 'articulo', action: 'list')}" id="btnConsultarr"--}%
           %{--class="btn btn-sm btn-primary sobrepuesto" style="margin-left: 90px" title="Consultar artículo">--}%
            %{--<i class="fa fa-check"></i> Lista--}%
        %{--</a>--}%
        <a href="#" id="btnArticulo" class="btn btn-sm btn-primary sobrepuesto"
           style="margin-left: 160px" title="Crear nuevo registro">
            <i class="fa fa-book"></i> Crear Nuevo
        </a>
        <a href="#" id="btnVer" class="btn btn-sm btn-primary sobrepuesto" style="margin-left: 281px"
           title="Ver registro">
            <i class="fa fa-search"></i> Ver
        </a>

    </div>

    <div>
        <g:form name="frmArticulo" role="form" action="guardarArtc_ajax" method="POST">
            <div class="row">
                <div class="col-md-12">
                    <span class="col-md-2 label label-primary text-info mediano">Sección</span>
                    <div class="col-md-10 text-info">
                        <g:select name="seccion" id="seccionId" from="${code.Seccion.list()}" optionKey="id"
                            value="${artc?.seccion?.id}" optionValue="titulo" class="form-control"
                            style="color: #3d658a"/>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="grupo col-md-8">
                    <span class="col-md-3 label label-primary text-info mediano">Título</span>

                    <div class="col-md-9">
                        <g:textField name="titulo" id="titulo" class="form-control required"
                                     maxlength="127" value="${artc?.titulo}"/>
                    </div>
                </div>

                <div class="col-md-4">
                    <span class="col-md-3 label label-primary text-info mediano">Orden</span>

                    <div class="col-md-4">
                        <g:textField name="orden" id="orden" class="form-control required" maxlength="255"
                                     value="${artc?.orden}"/>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <span class="col-md-3 label label-primary text-info mediano">Subtítulo</span>

                    <div class="col-md-9">
                        <span class="grupo">
                            <g:textArea name="subtitulo" id="subtitulo" class="form-control required" maxlength="255"
                                        style="height: 40px; resize: none" value="${artc?.subtitulo}"/>
                        </span>
                    </div>
                </div>


                <div class="col-md-4">
                    <span class="col-md-3 label label-primary text-info mediano">Estado</span>

                    <div class="col-md-6">
                        <g:select from="${['P':'Provisional', 'A':'Aprobado']}" optionValue="value" optionKey="key" class="form-control" name="estado" value="${artc?.estado}"/>
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
                <span class="grupo col-md-12">
                    <span class="col-md-2 label label-primary text-info mediano">Meta</span>

                    <div class="grupo col-md-10">
                        <g:textField name="meta" id="metaDescripcion" class="form-control required" maxlength="255"
                                     value="${artc?.metaDescripcion}"/>
                    </div>
                </span>
            </div>

        </g:form>
    </div>
</div>


<div class="modal fade " id="dialog" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="background-color: #d8d8d8">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <span id="dlTitulo" style="font-size: large">Artículo</span>
            </div>

            <div class="modal-body" id="dialog-body" style="padding: 15px">

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
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
//                async: true,
                data: {
                    id: base_id,
                    seccion: $("#seccionId").val(),
                    titulo: $("#titulo").val(),
                    orden: $("#orden").val(),
                    subtitulo: $("#subtitulo").val(),
                    descripcion: $("#descripcion").val(),
                    texto: txto,
                    imagen: $("#imagen").val(),
                    metaDescripcion: $("#metaDescripcion").val(),
                    estado : $("#estado").val()
                },
                success: function (msg) {
//                    console.log('retorna:', msg);
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
            %{--estado: {--}%
                %{--remote: {--}%
                    %{--url: "${createLink(action: 'validarEstado_ajax')}",--}%
                    %{--type: "post",--}%
                    %{--data: {--}%
                        %{--estado: $("#estado").val()--}%
                    %{--}--}%
                %{--}--}%
            %{--},--}%
            meta: {
                remote: {
                    url: "${createLink(action: 'validarMeta_ajax')}",
                    type: "post",
                    data: {
                        meta: $("#meta").val()
                    }
                }
            }
        },
        messages: {
            titulo: {
                remote: "El número mínimo de caracteres debe ser de 3"
            },
//            estado: {
//                remote: "El número mínimo de caracteres debe ser de 3"
//            },
            meta: {
                remote: "El campo meta esta vacío"
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


    $("#btnVer").click(function () {
        var id_base = ${artc?.id}
                console.log('id:', id_base);
//        $("#dialog-body").html(spinner);
        $.ajax({
            type: 'POST',
            url: '${createLink(controller: 'articulo', action: 'show_ajax')}',
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