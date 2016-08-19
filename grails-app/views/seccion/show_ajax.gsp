
<%@ page import="code.Seccion" %>

<g:if test="${!seccionInstance}">
    <elm:notFound elem="Seccion" genero="o" />
</g:if>
<g:else>


    <g:if test="${seccionInstance?.titulo}">
        <div class="row">
            <div class="col-md-2 text-info">
                Título
            </div>

            <div class="col-md-10">
                <g:fieldValue bean="${seccionInstance}" field="titulo"/>
            </div>

        </div>
    </g:if>


    <g:if test="${seccionInstance?.menu}">
        <div class="row">
            <div class="col-md-2 text-info">
                Menú
            </div>
            
            <div class="col-md-10">
                <g:fieldValue bean="${seccionInstance}" field="menu"/>
            </div>
            
        </div>
    </g:if>
    

    
    <g:if test="${seccionInstance?.subtitulo}">
        <div class="row">
            <div class="col-md-2 text-info">
                Subtítulo
            </div>
            
            <div class="col-md-10">
                <g:fieldValue bean="${seccionInstance}" field="subtitulo"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${seccionInstance?.orden}">
        <div class="row">
            <div class="col-md-2 text-info">
                Orden
            </div>
            
            <div class="col-md-6">
                <g:fieldValue bean="${seccionInstance}" field="orden"/>
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${seccionInstance?.estado}">
        <div class="row">
            <div class="col-md-2 text-info">
                Estado
            </div>

            <div class="col-md-3">
                <g:fieldValue bean="${seccionInstance}" field="estado"/>
            </div>

        </div>
    </g:if>
    
    %{--<g:if test="${seccionInstance?.imagen}">--}%
        %{--<div class="row">--}%
            %{--<div class="col-md-2 text-info">--}%
                %{--Imagen--}%
            %{--</div>--}%
            %{----}%
            %{--<div class="col-md-3">--}%
                %{--<g:fieldValue bean="${seccionInstance}" field="imagen"/>--}%
            %{--</div>--}%
            %{----}%
        %{--</div>--}%
    %{--</g:if>--}%
    
    <g:if test="${seccionInstance?.layout}">
        <div class="row">
            <div class="col-md-2 text-info">
                Layout
            </div>
            
            <div class="col-md-10">
                ${seccionInstance?.layout?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
    <g:if test="${seccionInstance?.sitio}">
        <div class="row">
            <div class="col-md-2 text-info">
                Sitio
            </div>
            
            <div class="col-md-6">
                ${seccionInstance?.sitio?.encodeAsHTML()}
            </div>
            
        </div>
    </g:if>
    
</g:else>