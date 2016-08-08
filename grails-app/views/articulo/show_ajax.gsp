
<%@ page import="code.Articulo" %>

<g:if test="${!articuloInstance}">
    <elm:notFound elem="Articulo" genero="o" />
</g:if>
<g:else>

    <g:if test="${articuloInstance?.titulo}">
        <div class="row">
            <div class="col-md-2 text-info">
                Titulo
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${articuloInstance}" field="titulo"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${articuloInstance?.subtitulo}">
        <div class="row">
            <div class="col-md-2 text-info">
                Subtitulo
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${articuloInstance}" field="subtitulo"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${articuloInstance?.descripcion}">
        <div class="row">
            <div class="col-md-2 text-info">
                Descripcion
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${articuloInstance}" field="descripcion"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${articuloInstance?.texto}">
        <div class="row">
            <div class="col-md-2 text-info">
                Texto
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${articuloInstance}" field="texto"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${articuloInstance?.imagen}">
        <div class="row">
            <div class="col-md-2 text-info">
                Imagen
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${articuloInstance}" field="imagen"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${articuloInstance?.metaDescripcion}">
        <div class="row">
            <div class="col-md-2 text-info">
                Meta Descripcion
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${articuloInstance}" field="metaDescripcion"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${articuloInstance?.estado}">
        <div class="row">
            <div class="col-md-2 text-info">
                Estado
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${articuloInstance}" field="estado"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${articuloInstance?.fecha}">
        <div class="row">
            <div class="col-md-2 text-info">
                Fecha
            </div>
            
            <div class="col-md-3">
                <g:formatDate date="${articuloInstance?.fecha}" format="dd-MM-yyyy" />
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${articuloInstance?.orden}">
        <div class="row">
            <div class="col-md-2 text-info">
                Orden
            </div>
            
            <div class="col-md-3">
                <g:fieldValue bean="${articuloInstance}" field="orden"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${articuloInstance?.seccion}">
        <div class="row">
            <div class="col-md-2 text-info">
                Seccion
            </div>
            
            <div class="col-md-3">
                ${articuloInstance?.seccion?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
</g:else>