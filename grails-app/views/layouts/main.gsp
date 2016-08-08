<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">


	%{--<elm:favicon/>--}%

	<title><g:layoutTitle default="Code"/></title>

	<!-- Bootstrap core CSS 3.1.1 -->
	<elm:bootstrapCss/>

	%{--<script src="${resource(dir: 'js/plugins/ckeditor', file: 'ckeditor.js')}"></script>--}%

	<link href="${resource(dir: 'font-awesome-4.2.0/css', file: 'font-awesome.min.css')}" rel="stylesheet">

	<!-- JQuery -->
	<script src="${resource(dir: 'js/jquery/js', file: 'jquery-1.9.1.js')}"></script>
	<script src="${resource(dir: 'js/jquery/js', file: 'jquery-ui-1.10.3.custom.min.js')}"></script>
	<link href="${resource(dir: 'js/jquery/css/ui-lightness', file: 'jquery-ui-1.10.3.custom.min.css')}" rel="stylesheet">

	<!-- funciones de JS -->
	<script src="${resource(dir: 'js', file: 'functions.js')}"></script>
	<script src="${resource(dir: 'js', file: 'funciones.js')}"></script>
	<script src="${resource(dir: 'js', file: 'loader.js')}"></script>

	<!-- plugins -->
	<script src="${resource(dir: 'js/plugins/bootbox/js', file: 'bootbox.js')}"></script>

	<!-- el datepicker -->
	<script src="${resource(dir: 'js/plugins/bootstrap-datepicker/js', file: 'bootstrap-datepicker.js')}"></script>
	<script src="${resource(dir: 'js/plugins/bootstrap-datepicker/js/locales', file: 'bootstrap-datepicker.es.js')}"></script>
	<link href="${resource(dir: 'js/plugins/bootstrap-datepicker/css', file: 'datepicker.css')}" rel="stylesheet">

	<!-- lo q muestra la cantidad restante de caracteres en los texts -->
	<script src="${resource(dir: 'js/plugins/bootstrap-maxlength/js', file: 'bootstrap-maxlength.js')}"></script>

	<!-- la validacion del lado del cliente -->
	<script src="${resource(dir: 'js/plugins/jquery-validation-1.11.1/js', file: 'jquery.validate.min.js')}"></script>
	<script src="${resource(dir: 'js/plugins/jquery-validation-1.11.1/localization', file: 'messages_es.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery.validate.custom.js')}"></script>

	<!-- las alertas growl -->
	<script src="${resource(dir: 'js/plugins/pines/js', file: 'jquery.pnotify.js')}"></script>
	<link href="${resource(dir: 'js/plugins/pines/css', file: 'jquery.pnotify.default.css')}" rel="stylesheet">

	<!-- context menu para el click derecho -->
	<script type="text/javascript" src="${resource(dir: 'js/plugins/lzm.context/js', file: 'lzm.context-0.5.js')}"></script>
	<link href="${resource(dir: 'js/plugins/lzm.context/css', file: 'lzm.context-0.5.css')}" rel="stylesheet">


	<link href='${resource(dir: "font-tulpen", file: "stylesheet.css")}' rel='stylesheet' type='text/css'>

	<!-- el manager de fechas -->
	<script src="${resource(dir: 'js/plugins', file: 'date.js')}"></script>

	<!-- los tooltips bonitos -->
	<script src="${resource(dir: 'js/plugins/jquery.qtip-2.2.0', file: 'jquery.qtip.min.js')}"></script>
	<link href='${resource(dir: "js/plugins/jquery.qtip-2.2.0", file: "jquery.qtip.min.css")}' rel='stylesheet' type='text/css'>

	<!-- Custom styles -->
	<link href="${resource(dir: 'css', file: 'custom.css')}" rel="stylesheet">
	<link href="${resource(dir: 'css', file: 'custom/loader.css')}" rel="stylesheet">
	<link href="${resource(dir: 'css', file: 'custom/modals.css')}" rel="stylesheet">
	<link href="${resource(dir: 'css', file: 'custom/tablas.css')}" rel="stylesheet">
	<link href="${resource(dir: 'css', file: 'custom/datepicker.css')}" rel="stylesheet">
	<link href="${resource(dir: 'css', file: 'custom/context.css')}" rel="stylesheet">
	<link href='${resource(dir: "css", file: "CustomSvt.css")}' rel='stylesheet' type='text/css'>
	<link href='${resource(dir: "css", file: "custom/pnotify.css")}' rel='stylesheet' type='text/css'>
	%{--Buscador--}%
	<link href='${resource(dir: 'css', file: 'buscador.css')}' rel='stylesheet'>

	<elm:bootstrapJs/>

	<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>

</head>

<body>
%{--<div id="modalTabelGray"></div>--}%

%{--
<div id="modalDiv" class="ui-corner-all">
	<div class="loading-title">Procesando</div>
	<img src="${resource(dir: 'images', file: 'spinner32.gif')}">

	<div class="loading-footer">Espere por favor</div>
</div>
--}%

<div class="container" style="min-width: 1000px !important;">
	<g:layoutBody/>
</div> <!-- /container -->


%{--<script type="text/javascript">


	var affixElement = '#navbar-main';

	$(affixElement).affix({
		offset: {
			top: function () {
				return (this.top = $(affixElement).offset().top)
			},
			bottom: function () {
				return (this.bottom = $('#footer').outerHeight(true))
			}
		}
	});


</script>--}%

</body>

</html>
