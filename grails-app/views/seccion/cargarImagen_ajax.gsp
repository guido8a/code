<%--
  Created by IntelliJ IDEA.
  User: gato
  Date: 22/08/16
  Time: 02:57 PM
--%>


<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>
<script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js/vendor', file: 'jquery.ui.widget.js')}"></script>
<script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js/imgResize', file: 'load-image.min.js')}"></script>
<script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js/imgResize', file: 'canvas-to-blob.min.js')}"></script>
<script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js', file: 'jquery.iframe-transport.js')}"></script>
<script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js', file: 'jquery.fileupload.js')}"></script>
<script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js', file: 'jquery.fileupload-process.js')}"></script>
<script src="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/js', file: 'jquery.fileupload-image.js')}"></script>
<link href="${resource(dir: 'js/plugins/jQuery-File-Upload-9.5.6/css', file: 'jquery.fileupload.css')}" rel="stylesheet">




<div class="row" style="height: 200px">
    %{--<div class="form-group ${hasErrors(bean: seccionInstance, field: 'imagen', 'error')} col-md-4" >--}%
        %{--<span class="grupo">--}%
            %{--<div class="col-md-6">--}%
                %{--<div class="btn-group">--}%
                    %{--<g:link controller="articulo" action="lista" class="btn btn-success btnCargarImagen">--}%
                        %{--<i class="fa fa-file-photo-o"></i> Cargar Imagen--}%
                    %{--</g:link>--}%
                %{--</div>--}%
            %{--</div>--}%
        %{--</span>--}%
    %{--</div>--}%
    %{--<div class="col-md-6">--}%

    %{--</div>--}%


    <div class="form-group" style="height: 80px">
        <div class="col-md-10">
            <div class="col-md-6">
                <span class="btn btn-success fileinput-button" style="position: relative;height: 40px">
                    <i class="glyphicon glyphicon-plus"></i>
                    <span>Seleccionar imagen</span>
                    <input type="file" name="file" id="file">
                </span>
            </div>
            <div id="divImagen" class="col-md-6">

            </div>
        </div>
    </div>
    <div id="progress" class="progress progress-striped active col-md-3" style="width: 40%">
        <div class="progress-bar progress-bar-info"></div>
    </div>
</div>





<script>

    <g:if test="${seccion?.imagen}">
    cargarImagen(${seccion?.id});
    </g:if>


    function cargarImagen (idO) {
        $.ajax({
            type    : "POST",
            url     : "${createLink(action: 'seccionImagen_ajax')}",
            data:{
                id: idO
            },
            success : function (msg) {
                $("#divImagen").html(msg);
            }
        });
    }

    //subir imagen

    $(function () {
        $('#file').fileupload({
            url              : '${createLink(controller: 'seccion', action:'uploadFile', id: seccion?.id)}',
            dataType         : 'json',
            maxNumberOfFiles : 1,
            acceptFileTypes  : /(\.|\/)(jpe?g|png)$/i,
            maxFileSize      : 1000000 // 1 MB
        }).on('fileuploadadd', function (e, data) {
//                    console.log("fileuploadadd");
            openLoader("Cargando");
            data.context = $('<div/>').appendTo('#files');
            $.each(data.files, function (index, file) {
                var node = $('<p/>')
                        .append($('<span/>').text(file.name));
                if (!index) {
                    node
                            .append('<br>');
                }
                node.appendTo(data.context);
            });
        }).on('fileuploadprocessalways', function (e, data) {
//                    console.log("fileuploadprocessalways");
            var index = data.index,
                    file = data.files[index],
                    node = $(data.context.children()[index]);
            if (file.preview) {
                node
                        .prepend('<br>')
                        .prepend(file.preview);
            }
            if (file.error) {
                node
                        .append('<br>')
                        .append($('<span class="text-danger"/>').text(file.error));
            }
            if (index + 1 === data.files.length) {
                data.context.find('button')
                        .text('Upload')
                        .prop('disabled', !!data.files.error);
            }
        }).on('fileuploadprogressall', function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .progress-bar').css(
                    'width',
                    progress + '%'
            ).show();
        }).on('fileuploaddone', function (e, data) {
            cargarImagen(${seccion?.id});
            setTimeout(function () {
                $('#progress .progress-bar').css(
                        'width',
                        0 + '%'
                ).hide();
            }, 700);
            var exito = $('<span class="text-success"/>').text('Archivo cargado exitosamente!');
            $.each(data.files, function (index, file) {
                $(data.context.children()[index])
                        .append('<br>')
                        .append(exito);
//                $("#mensaje").append(exito).toggle(3500);
            });
        }).on('fileuploadfail', function (e, data) {
            closeLoader();
            $.each(data.files, function (index, file) {
                var error = $('<span class="text-danger"/>').text('File upload failed.');
                $(data.context.children()[index])
                        .append('<br>')
                        .append(error);
            });
        });
    })






</script>

