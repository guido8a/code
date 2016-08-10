<html xmlns:>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'prmo.label', default: 'Prmo')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>

<style type="text/css">
@page {
    size   : 8.5in 11in;  /* width height */
    margin : 0.25in;
}

.titl {
    font-family: 'open sans condensed';
    font-weight: bold;
    text-shadow: -2px 2px 1px rgba(0, 0, 0, 0.25);
    color:#0088CC;
    margin-top: 20px;
}
.centrado {
    text-align: center;
    margin-top: 40px;
}
.logo {
    height: 595px;
    background: #d7d7d7;
    padding: 10px;
    width: 910px;
    margin: auto;
    margin-top: 5px
}
.login2 {
    border: 5px solid #2080B0;
    background:#C7C7C5; /*#a7a7a5*/
    color: #939Aa2;
    width: 300px;
    position: relative;
    padding-left: 60px;
    margin: 0px
}


</style>

</head>

<div style="text-align: center; width: 100%; margin-top: 160px;">
    <img class="img-login" src="${resource(dir: 'images', file: 'tedein.jpeg')}" style="margin-top: -100px;"/>
    <h1 style="display: inline; margin-top: 40px;">Tedein S.A.</h1>

    <elm:flashMessage tipo="${flash.tipo}" clase="${flash.clase}">${flash.message}</elm:flashMessage>

        <div style="width: 300px; margin: auto; margin-top: 60px;">

            <div class="tdn-tab-body" style="background: #f4f4f8; width: 200px; margin: auto">


                <g:form name="frmLogin" action="validar">
                    <input name="auth_tk" type="hidden" value="${token}" />
                    <div class="input-group input-login">
                        <g:textField name="user" class="form-control required noEspacios" placeholder="Usuario"/>
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    </div>

                    <div class="input-group input-login">
                        <g:passwordField name="pass" class="form-control required" placeholder="Contraseña"/>
                        <span class="input-group-addon"><i class="fa fa-unlock-alt"></i></span>
                    </div>

                </g:form>
            </div>
    <div style="margin-top: 20px; width: 300px">
        <a href="#" id="btn-salir" class="btn btn-primary">Cancelar <i class="fa fa-close" style="width: 60px"></i>
        </a>

        <a href="#" id="btn-login" class="btn btn-primary">Validar <i class="fa fa-unlock" style="width: 60px"></i>
        </a>
    </div>
        </div>

</div>

</div>



    <script type="text/javascript">
        var $frm = $("#frmLogin");
        function doLogin() {
            if ($frm.valid()) {
                $("#btn-login").replaceWith(spinner);
                $frm.submit();
            }
        }

        $(function () {
            $("#user").focus();

            $frm.validate({
//                    validClass    : "text-success",
                errorClass     : "text-danger",
                errorPlacement : function (error, element) {
                    if (element.parent().hasClass("input-group")) {
                        error.insertAfter(element.parent());
                    } else {
                        error.insertAfter(element);
                    }
                    console.log("error ", error, element, element.parents(".input-group"));
                    element.parents(".input-group").addClass('has-error');
                }
            });

            $("#btn-login").click(function () {
                doLogin();
            });

            $("#btn-salir").click(function () {
                var url = "${createLink(controller: 'principal', action: 'index')}";
                location.href = url
            });

            $frm.find("input").keyup(function (ev) {
                if (ev.keyCode == 13) {
                    doLogin();
                }
            })
        });
    </script>

</body>

</html>
