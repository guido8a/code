<%@ page import="code.Articulo" %>

<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>
<g:if test="${!articuloInstance}">
    <elm:notFound elem="Articulo" genero="o" />
</g:if>
<g:else>
    <g:form class="form-horizontal" name="frmArticulo" role="form" action="save" method="POST">
        <g:hiddenField name="id" value="${articuloInstance?.id}" />
        
        <div class="form-group ${hasErrors(bean: articuloInstance, field: 'titulo', 'error')} ">
            <span class="grupo">
                <label for="titulo" class="col-md-2 control-label text-info">
                    Titulo
                </label>
                <div class="col-md-6">
                    <g:textArea name="titulo" cols="40" rows="5" maxlength="255" required="" class="allCaps form-control required" value="${articuloInstance?.titulo}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: articuloInstance, field: 'subtitulo', 'error')} ">
            <span class="grupo">
                <label for="subtitulo" class="col-md-2 control-label text-info">
                    Subtitulo
                </label>
                <div class="col-md-6">
                    <g:textArea name="subtitulo" cols="40" rows="5" maxlength="255" required="" class="allCaps form-control required" value="${articuloInstance?.subtitulo}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: articuloInstance, field: 'descripcion', 'error')} ">
            <span class="grupo">
                <label for="descripcion" class="col-md-2 control-label text-info">
                    Descripcion
                </label>
                <div class="col-md-6">
                    <g:textArea name="descripcion" cols="40" rows="5" maxlength="1023" required="" class="allCaps form-control required" value="${articuloInstance?.descripcion}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: articuloInstance, field: 'texto', 'error')} ">
            <span class="grupo">
                <label for="texto" class="col-md-2 control-label text-info">
                    Texto
                </label>
                <div class="col-md-6">
                    <g:textField name="texto" required="" class="allCaps form-control required" value="${articuloInstance?.texto}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: articuloInstance, field: 'imagen', 'error')} ">
            <span class="grupo">
                <label for="imagen" class="col-md-2 control-label text-info">
                    Imagen
                </label>
                <div class="col-md-6">
                    <g:textArea name="imagen" cols="40" rows="5" maxlength="255" class="allCaps form-control" value="${articuloInstance?.imagen}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: articuloInstance, field: 'metaDescripcion', 'error')} ">
            <span class="grupo">
                <label for="metaDescripcion" class="col-md-2 control-label text-info">
                    Meta Descripcion
                </label>
                <div class="col-md-6">
                    <g:textArea name="metaDescripcion" cols="40" rows="5" maxlength="255" required="" class="allCaps form-control required" value="${articuloInstance?.metaDescripcion}"/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: articuloInstance, field: 'estado', 'error')} ">
            <span class="grupo">
                <label for="estado" class="col-md-2 control-label text-info">
                    Estado
                </label>
                <div class="col-md-6">
                    <g:textField name="estado" maxlength="1" required="" class="allCaps form-control required" value="${articuloInstance?.estado}"/>
                </div>
                
            </span>
        </div>
        

        <div class="form-group ${hasErrors(bean: articuloInstance, field: 'orden', 'error')} ">
            <span class="grupo">
                <label for="orden" class="col-md-2 control-label text-info">
                    Orden
                </label>
                <div class="col-md-6">
                    <g:field name="orden" type="number" value="${articuloInstance.orden}" class="digits form-control required" required=""/>
                </div>
                
            </span>
        </div>
        
        <div class="form-group ${hasErrors(bean: articuloInstance, field: 'seccion', 'error')} ">
            <span class="grupo">
                <label for="seccion" class="col-md-2 control-label text-info">
                    Seccion
                </label>
                <div class="col-md-6">
                    <g:select id="seccion" name="seccion.id" from="${code.Seccion.list()}" optionKey="id" required="" value="${articuloInstance?.seccion?.id}" class="many-to-one form-control"/>
                </div>
                
            </span>
        </div>
        
    </g:form>

    <script type="text/javascript">
        var validator = $("#frmArticulo").validate({
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