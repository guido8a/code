<%--
  Created by IntelliJ IDEA.
  User: gato
  Date: 10/08/16
  Time: 10:19 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Lista de Artículos</title>
</head>

<body>

%{--<div class="panel panel-success">--}%
    %{--<div class="panel-heading">--}%
        %{--<h3 class="panel-title" style="text-align: center"> <i class="fa fa-gear"></i>Lista de Artículos</h3>--}%
    %{--</div>--}%

    <div class="row">
        <div class="col-md-2 negrilla control-label">Sección: </div>
        <div class="col-md-7">
            <g:select name="seccion_name" id="seccion" optionKey="id" optionValue="titulo"
                      class="form-control" from="${code.Seccion.list([sort: 'titulo', order: 'asc'])}"/>
        </div>
    </div>

    <div class="row" id="tablaArticulos">

    </div>
%{--</div>--}%

<script type="text/javascript">

    cargarTabla($("#seccion").val());


    $("#seccion").change(function () {
        cargarTabla($(this).val());
    });

    function cargarTabla (idS) {
        $.ajax({
            type: 'POST',
            url: "${createLink(controller: 'articulo', action: 'list')}",
            data:{
                id: idS
            },
            success: function (msg){
                $("#tablaArticulos").html(msg)
            }
        })
    }
</script>



</body>
</html>