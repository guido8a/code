<%@ page import="code.Seccion" %>

<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>
<g:if test="${!seccionInstance}">
    <elm:notFound elem="Seccion" genero="o" />
</g:if>
<g:else>
    <g:form class="form-horizontal" name="frmSeccion" role="form" action="save" method="POST">
        <g:hiddenField name="id" value="${seccionInstance?.id}" />


        <div class="form-group ${hasErrors(bean: seccionInstance, field: 'titulo', 'error')} ">
            <span class="grupo">
                <label for="titulo" class="col-md-2 control-label text-info">
                    Título Sección
                </label>
                <div class="col-md-10">
                    <g:textArea name="titulo" cols="40" rows="5" maxlength="255" class="form-control" value="${seccionInstance?.titulo}" style="height: 65px; resize: none"/>
                </div>

            </span>
        </div>



        <div class="form-group ${hasErrors(bean: seccionInstance, field: 'menu', 'error')} ">
            <span class="grupo">
                <label for="menu" class="col-md-2 control-label text-info">
                    Menú
                </label>
                <div class="col-md-10">
                    <g:textField name="menu" maxlength="63" required="" class="form-control required" value="${seccionInstance?.menu}"/>
                </div>
                
            </span>
        </div>
        

        <div class="form-group ${hasErrors(bean: seccionInstance, field: 'subtitulo', 'error')} ">
            <span class="grupo">
                <label for="subtitulo" class="col-md-2 control-label text-info">
                    Subtitulo
                </label>
                <div class="col-md-10">
                    <g:textArea name="subtitulo" cols="40" rows="5" maxlength="255" class="form-control" value="${seccionInstance?.subtitulo}" style="height: 65px; resize: none"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: seccionInstance, field: 'orden', 'error')} ">
            <span class="grupo">
                <label for="orden" class="col-md-2 control-label text-info">
                    Orden
                </label>
                <div class="col-md-2">
                    %{--<g:field name="orden" type="number" value="${seccionInstance.orden}" class="digits form-control required" required=""/>--}%
                    <g:textField name="orden" value="${seccionInstance.orden}" class="digits form-control required" required="" maxlength="2"/>
                </div>
                
            </span>
        </div>
        <div class="form-group ${hasErrors(bean: seccionInstance, field: 'estado', 'error')} ">
            <span class="grupo">
                <label for="estado" class="col-md-2 control-label text-info">
                    Estado
                </label>
                <div class="col-md-2">
                    <g:select name="estado" from="${seccionInstance.constraints.estado.inList}" class="form-control" value="${seccionInstance?.estado}" valueMessagePrefix="seccion.estado"/>
                </div>
            </span>
        </div>

        %{--<div class="form-group ${hasErrors(bean: seccionInstance, field: 'imagen', 'error')} ">--}%
            %{--<span class="grupo">--}%
                %{--<label for="imagen" class="col-md-2 control-label text-info">--}%
                    %{--Imagen--}%
                %{--</label>--}%
                %{--<div class="col-md-6">--}%
                    %{--<div class="btn-group">--}%
                        %{--<g:link controller="articulo" action="lista" class="btn btn-success btnCargarImagen">--}%
                            %{--<i class="fa fa-file-photo-o"></i> Cargar Imagen--}%
                        %{--</g:link>--}%
                    %{--</div>--}%
                %{--</div>--}%
            %{--</span>--}%
        %{--</div>--}%
        
        <div class="form-group ${hasErrors(bean: seccionInstance, field: 'layout', 'error')} ">
            <span class="grupo">
                <label for="layout" class="col-md-2 control-label text-info">
                    Layout
                </label>
                <div class="col-md-8">
                    <g:select id="layoutId" name="layout" from="${code.Layout.list()}" optionKey="id" required="" value="${seccionInstance?.layout?.id}" class="many-to-one form-control"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: seccionInstance, field: 'sitio', 'error')} ">
            <span class="grupo">
                <label for="sitio" class="col-md-2 control-label text-info">
                    Sitio
                </label>
                <div class="col-md-8">
                    <g:select id="sitioId" name="sitio" from="${code.Sitio.list()}" optionKey="id" required="" value="${seccionInstance?.sitio?.id}" class="many-to-one form-control"/>
                </div>
                
            </span>
        </div>
        
    </g:form>

    <script type="text/javascript">
        var validator = $("#frmSeccion").validate({
            errorClass     : "help-block",
            errorPlacement : function (error, element) {
                if (element.parent().hasClass("input-group")) {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element);
                }
                element.parents(".grupo").addClass('has-error');
            },
            success        : function (label) {
                label.parents(".grupo").removeClass('has-error');
            }
        });
        $(".form-control").keydown(function (ev) {
            if (ev.keyCode == 13) {
                submitForm();
                return false;
            }
            return true;
        });







    </script>

</g:else>