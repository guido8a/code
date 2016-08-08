
<%@ page import="code.Articulo" %>

<g:if test="${!articuloInstance}">
    <elm:notFound elem="Articulo" genero="o" />
</g:if>
<g:else>

    %{--Seccion: <h2 style="display: inline">${articuloInstance?.seccion.titulo}</h2><br/>--}%
    <div style="text-align: center">
        Título: <h2 style="display: inline">${articuloInstance?.titulo}</h2><br/>
        Subtítulo: <h3 style="display: inline">${articuloInstance?.subtitulo}</h3><br/>
        Descripción: <strong>${articuloInstance?.descripcion}</strong>
    </div>

    <div class="row" style="margin-bottom: 10px">
        <strong style="margin-left: 15px">Artículo:</strong>
        <div class="col-xs-12" style="background: #eeeeee; max-height: 400px; overflow: auto; padding: 20px;">
            <util:renderHTML html="${articuloInstance?.texto}"/>
        </div>
    </div>

    <div>
        <div style="text-align: center; width: 100%">Imagen:<img src="${resource(dir: 'images', file: articuloInstance.imagen)}" style="max-height: 120px;"/></div><br/>
        Meta: <info>${articuloInstance?.metaDescripcion}</info><br/>
        Estado: <strong>${articuloInstance?.estado}</strong><br/>
        Creado el: <strong>${articuloInstance?.fecha}</strong><br/>
        Orden: <strong>${articuloInstance?.orden}</strong>
    </div>

</g:else>

<script type="text/javascript">
    $(function () {
        $("#dlTitulo").html("Sección: ${articuloInstance.seccion.titulo}")
    });
</script>