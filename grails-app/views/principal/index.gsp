<!DOCTYPE html>
<html lang="en">

<head>
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-121607475-1"></script>
	<script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-121607475-1');
	</script>
	<!-- Global site tag (gtag.js) - Google Analytics -->

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Desarrollo de software. Sistemas de manejo de obras. Sistemas contables. Sistemas manejo documentos. Sistema evaluación académica. Sistema evaluacion academica">
	<meta name="keywords" content="desarrollo software, gestion obras, construccion obras civiles, obras viales, obras de riego, construcciones, fiscalización, administracion, contrato, actas, manejo obras, contablilidad, evaluación académica">
	<meta name="keywords" content="presupuesto, fórmula polinómica, análisis de precios unitarios, rubros, valor agregado ecuatoriano, VAE, presupuesto y subpresupuesto, reajuste de precios">
	<meta name="keywords" content="cantidades de obra, transporte, costos indirectos, distancia al perso, distancia al volumen, anticipo, cronograma, coposición de obra, coejecución, ejecución directa">
	<meta name="keywords" content="contrato, multas, cronograma contractual, rubros contratados, incices inec, precios">
	<meta name="keywords" content="cronograma de ejecución, planilla, anticipo, avance de obra, liquidacion de obra, costo mas porcentaje, orden de obra, onden de cambio">
	<meta name="keywords" content="facturas, complementario, cronograma consolidado, acta de entrega recepción provicional definitiva">
	<meta name="keywords" content="desarrollo software, java, grails, phyton, moodle, postgresql, jquery, bootstrap">
	<meta name="author" content="tedein">
	<meta name="robots" content="index,nofollow">
	<meta name="revisit-after" content="30 days">
	<meta name="distribution" content="global">

	<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
	<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
	<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">

	<script src="${resource(dir: 'agency-theme/vendor/jquery', file: 'jquery.min.js')}"></script>
	<script src="${resource(dir: 'agency-theme/vendor/jquery', file: 'jquery.js')}"></script>
	<script src="${resource(dir: 'js/bootbox-4.3.0', file: 'js/bootbox.js')}"></script>

	<script src="${resource(dir: 'js', file: 'loader.js')}"></script>

	<title>TEDEIN S.A.</title>

	<link href='${resource(dir: 'js/datedropper3', file: 'datedropper.js')}' rel='stylesheet'>
	<link href='${resource(dir: 'js/datedropper3', file: 'datedropper.min.js')}' rel='stylesheet'>

	<!-- Bootstrap Core CSS -->
	%{--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">--}%
	%{--<link href='${resource(dir: 'bootstrap-3.1.1', file: 'css/bootstrap.min.css')}' rel='stylesheet'>--}%
	<link href='${resource(dir: 'agency-theme/vendor/bootstrap', file: 'css/bootstrap.min.css')}' rel='stylesheet'>

	<!-- Custom Fonts -->
	%{--<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">--}%
	%{--<link href='${resource(dir: 'font-awesome-4.2.0', file: 'css/font-awesome.min.css')}' rel='stylesheet'>--}%
	<link href='${resource(dir: 'agency-theme/vendor/font-awesome', file: 'css/font-awesome.min.css')}' rel='stylesheet'>
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

	<!-- Theme CSS -->
	%{--<link href="css/agency.min.css" rel="stylesheet">--}%
	%{--<link href='${resource(dir: 'agency-theme', file: 'css/agency.min.css')}' rel='stylesheet'>--}%
	<link href='${resource(dir: 'agency-theme', file: 'css/agency.css')}' rel='stylesheet'>



	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
        <!--<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>-->
	<!--<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>-->
	%{--<![endif]-->--}%

	<style type="text/css">
	input::-webkit-input-placeholder {
		color: gray !important;
	}

	input:-moz-placeholder { /* Firefox 18- */
		color: gray !important;
	}

	input::-moz-placeholder {  /* Firefox 19+ */
		color: gray !important;
	}

	input:-ms-input-placeholder {
		color: gray !important;
	}


	textarea::-webkit-input-placeholder {
		color: gray !important;
	}

	textarea:-moz-placeholder { /* Firefox 18- */
		color: gray !important;
	}

	textarea::-moz-placeholder {  /* Firefox 19+ */
		color: gray !important;
	}

	textarea:-ms-input-placeholder {
		color: gray !important;
	}


	body, html, main {
		/*important */
		height: 100% !important;
	}


	.cd-fixed-bg {
		min-height: 100%;
		background-size: cover;
		background-attachment: fixed;
		background-repeat: no-repeat;
		background-position: center center;
	}

	.cd-fixed-bg.cd-bg-1 {
		/*background-image: url("../agency-theme/img/portada.jpeg");*/
		background-image: url("../agency-theme/img/imagen_fondo_v2.jpg");
	}
	.cd-fixed-bg.cd-bg-2 {
		background-image: url("../agency-theme/img/portada2.jpeg");
	}
	.cd-fixed-bg.cd-bg-3 {
		/*background-image: url("../agency-theme/img/portada3.jpeg");*/
		background-image: url("../agency-theme/img/imagen_fondo_v2.jpg");
	}

	.cd-scrolling-bg {
		/*min-height: 100% !important;*/
	}

	.cd-color-2{
		background-color: #006dba !important;
	}


	/* --------------------------------

Primary style

-------------------------------- */
	html * {
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
	}

	*, *:after, *:before {
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
	}

	body {
		font-size: 100%;
		font-family: "Roboto", sans-serif;
		color: #3d3536;
		background-color: white;
	}

	body, html {
		/* important */
		height: 100%;
	}

	a {
		color: #b4d7a8;
		text-decoration: none;
	}

	/* --------------------------------

    Modules - reusable parts of our design

    -------------------------------- */
	.cd-container {
		/* this class is used to give a max-width to the element it is applied to, and center it horizontally when it reaches that max-width */
		width: 100%;
		max-width: 768px;
		margin: 0 auto;
	}
	.cd-container::after {
		/* clearfix */
		content: '';
		display: table;
		clear: both;
	}


	/* --------------------------------

    Main components

    -------------------------------- */
	.cd-header {
		position: relative;
		top: 0;
		left: 0;
		width: 100%;
		height: 50px;
		background: rgba(255, 255, 255, 0.95);
		box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
		z-index: 2;
	}
	.cd-header:after {
		content: "";
		display: table;
		clear: both;
	}
	.cd-header #cd-logo {
		float: left;
		margin: 13px 0 0 5%;
	}
	.cd-header #cd-logo img {
		display: block;
	}
	@media only screen and (min-width: 768px) {
		.cd-header {
			height: 70px;
		}
		.cd-header #cd-logo {
			margin: 23px 0 0 5%;
		}
	}

	.cd-main-nav ul {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		-webkit-transform: translateY(-100%);
		-moz-transform: translateY(-100%);
		-ms-transform: translateY(-100%);
		-o-transform: translateY(-100%);
		transform: translateY(-100%);
	}
	.cd-main-nav ul.is-visible {
		-webkit-transform: translateY(50px);
		-moz-transform: translateY(50px);
		-ms-transform: translateY(50px);
		-o-transform: translateY(50px);
		transform: translateY(50px);
	}
	.cd-main-nav a {
		display: block;
		height: 50px;
		line-height: 50px;
		padding-left: 5%;
		background: #2f292a;
		border-top: 1px solid #453c3d;
		color: #8e7d7f;
	}
	@media only screen and (min-width: 768px) {
		.cd-main-nav {
			width: auto;
			height: auto;
			background: none;
			cursor: auto;
		}
		.cd-main-nav ul {
			position: static;
			width: auto;
			-webkit-transform: translateY(0);
			-moz-transform: translateY(0);
			-ms-transform: translateY(0);
			-o-transform: translateY(0);
			transform: translateY(0);
			line-height: 70px;
		}
		.cd-main-nav ul.is-visible {
			-webkit-transform: translateY(0);
			-moz-transform: translateY(0);
			-ms-transform: translateY(0);
			-o-transform: translateY(0);
			transform: translateY(0);
		}
		.cd-main-nav li {
			display: inline-block;
			margin-left: 1em;
		}
		.cd-main-nav a {
			display: inline-block;
			height: auto;
			line-height: normal;
			background: transparent;
			padding: .6em 1em;
			border-top: none;
			color: #3d3536;
			text-transform: uppercase;
			font-weight: bold;
			font-size: 14px;
			font-size: 0.875rem;
		}
		.no-touch .cd-main-nav a:hover {
			color: #99a478;
		}
	}

	.cd-main-content {
		/* you need to assign a min-height to the main content so that the children can inherit it*/
		height: 100%;
		position: relative;
		z-index: 1;
	}

	.cd-fixed-bg {
		position: relative;
		min-height: 100%;
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center center;
		z-index: 1;
	}
	.cd-fixed-bg h1, .cd-fixed-bg h2 {
		position: absolute;
		left: 50%;
		top: 50%;
		bottom: auto;
		right: auto;
		-webkit-transform: translateX(-50%) translateY(-50%);
		-moz-transform: translateX(-50%) translateY(-50%);
		-ms-transform: translateX(-50%) translateY(-50%);
		-o-transform: translateX(-50%) translateY(-50%);
		transform: translateX(-50%) translateY(-50%);
		width: 90%;
		max-width: 1170px;
		text-align: center;
		font-size: 30px;
		font-size: 1.875rem;
		text-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
		color: white;
	}

	@media only screen and (min-width: 768px) {
		.cd-fixed-bg h1, .cd-fixed-bg h2 {
			font-size: 36px;
		}
	}
	@media only screen and (min-width: 1170px) {
		.cd-fixed-bg {
			background-attachment: fixed;
		}
		.cd-fixed-bg h1, .cd-fixed-bg h2 {
			font-size: 48px;
			font-weight: 300;
		}
	}

	.cd-scrolling-bg {
		padding: 4em 0;
		line-height: 1.6;
		box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
		z-index: 2;
	}
	.cd-scrolling-bg.cd-color-1 {
		background-color: #3d3536;
		color: #a6989a;
	}
	.cd-scrolling-bg.cd-color-2 {
		background-color: #99a478;
		color: #3d3536;
	}
	.cd-scrolling-bg.cd-color-3 {
		background-color: #fffff9;
		color: #3d3536;
	}
	@media only screen and (min-width: 368px) {
		.cd-scrolling-bg {
			position: relative;
			padding: 8em 0;
			font-size: 20px;
			font-size: 1.25rem;
			line-height: 2;
			font-weight: 300;
		}
	}

	a:link {
		color: #003347;
	}

	a:visited {
		color: #222;
	}

	a:hover {
		color: #89d1f5;
	}

	/*------------------*/

	.client {
		width:280px;
		height:260px;
		background-color:#fff;
		text-align:center;
		float:left;
		font-family: 'Open Sans', sans-serif;
		letter-spacing:1px;
		-webkit-transition: all 0.1s;
		-moz-transition: all 0.1s;
		transition: all 0.1s;
		border-right:1px solid #f0f0f0;
		border-bottom:1px solid #f0f0f0;
		/*cursor:pointer;*/
	}

	.logo {
		display:block;
		width:75px;
		height:75px;
		margin-bottom:30px;
		margin:35px auto;
	}

	.client h2, .client h3 {
		font-size:16px;
		color:#888;
		padding:0px;
		margin:0px;
	}

	.client h3 {
		font-weight:100;
		margin-top:0px;
	}

	.clearer {
		clear:both;
	}

	.client:hover {
		-ms-transform: scale(1.1,1.1); /* IE 9 */
		-webkit-transform: scale(1.1,1.1); /* Safari */
		transform: scale(1.1,1.1);
		-webkit-box-shadow: 10px 10px 91px 0px rgb(63, 113, 186);
		-moz-box-shadow: 10px 10px 91px 0px rgb(63, 113, 186);
		box-shadow: 10px 10px 91px 0px rgb(63, 113, 186);
		z-index:9999;
		border-right:1px solid transparent;
		border-bottom:1px solid transparent;
		/*cursor:pointer;*/
		background-color:#fff;
	}

	.italica {
		font-size: 16px;
		font-family: "Droid Serif", "Helvetica Neue", Helvetica, Arial, sans-serif;
		text-transform: none;
		font-style: italic;
		font-weight: 400;
		color: #606060;
	}

</style>

</head>

<body id="page-top" class="index">


<!-- Navigation -->
<nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header page-scroll">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand page-scroll" href="#page-top">Tedein S.A.</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<g:each in="${secciones}" var="sec">
					<li>
						<a class="page-scroll" href="#${sec?.id}">${sec?.menu}</a>
					</li>
				</g:each>
				<li>
					<a class="page-scroll" href="#contact">Contacto</a>
				</li>
				<li>
					<a href="#page-top" style="padding: 0" id="btnImagen">
						<img id="foto" src="${resource(dir: 'images', file: 'tedein.jpeg')}" style="width: 50px; height: 50px"/>
					</a>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>

<!-- Header -->
<header>
	<div class="container">
		<div class="intro-text">
%{--
			<a href="http://www.tedein.com.ec/quanto" class="btn btn-lg"
			   style="margin-bottom: 50px; border-color: #ffffff; color: #ffffff">Prueba Piloto de FIMCBOR</a>
--}%
			<div class="intro-lead-in" style="text-align: center;"><img src="${resource(dir: 'images', file: 'tedein.jpeg')}"></div>
			<div class="intro-lead-in" style="color: #89d1f5">${sitio?.descripcion}</div>
			<div class="intro-heading" style="color: #89d1f5">${sitio?.nombre}</div>
			<a href="#${secciones.first()?.id}" class="page-scroll btn btn-xl">Más Información</a>
		</div>
	</div>
</header>


<g:each in="${secciones}" var="se" status="j">
	<div class="cd-scrolling-bg cd-color-3">
		<section id="${se?.id}" class="portfolio fondo" style="display: block !important;">
			<div class="container fondo">
				<div class="row">
					<div class="col-lg-12 text-center">
						<h2 class="section-heading">${se?.titulo}</h2>
						<h3 class="section-subheading text-muted">${se?.subtitulo}</h3>
					</div>
				</div>

				<g:if test="${se?.imagen}">
					<elm:plantilla seccion="${se?.id}"/>
				</g:if>
			</div>
		</section>
	</div>
</g:each>


<!-- Contact Section -->
<section id="contact">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<h2 style="color: #9fd1ff">Contáctenos</h2>

				<div class="col-lg-3"></div>
				<div class="col-lg-6 text-center">
					<div class="panel-group well">
						<div class="row" style="height: 80px">
							<label>Dirección:</label>
							<div class="italica">Rio Coca y Avenida de los Shyris E8 - 138. Oficina 201</div>
							<div class="italica">Quito - Ecuador.</div>
						</div>
						<div class="row" style="height: 60px">
							<label>Teléfonos:</label>
							<div class="italica">022 924 427 - 098 491 6620</div>
						</div>
						<div class="row" style="height: 40px">
							<label>E-mail:</label>
							<div class="italica">soporte@tedein.com.ec, informacion@tedein.com.ec </div>
						</div>
					</div>
				</div>
				<div class="col-lg-12 text-center">
					<h3 class="section-subheading text-muted" style="color: #ffffff">
						Ingrese sus datos personales. <br>Para poder responderle lo más pronto posible, por favor ingrese un correo electrónico o un teléfono válido.
					</h3>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<form name="sentMessage" id="contactForm" novalidate>
					<div class="row" style="margin-top: -40px">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Nombre y apellido *" id="name" required data-validation-required-message="Ingrese su nombre y apellido.">
								<p class="help-block text-danger"></p>
							</div>
							<div class="form-group">
								<input type="email" class="form-control" placeholder="Email *" id="email" required data-validation-required-message="Ingrese su correo electrónico.">
								<p class="help-block text-danger"></p>
							</div>
							<div class="form-group">
								<input type="tel" class="form-control" placeholder="Teléfono *" id="phone" required data-validation-required-message="Ingrese su número de teléfono.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<textarea class="form-control" placeholder="Tu pregunta o requerimiento *" id="message" required data-validation-required-message="Ingrese una pregunta o requerimiento"></textarea>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="col-lg-12 text-center">
							<div id="success"></div>
							<button class="btn btn-xl" id="btnEnviarMail">Enviar</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<span class="copyright">Copyright &copy; Tedein S.A. ${new java.util.Date().format("yyyy")} </span>
			</div>
			<div class="col-md-4">
				<ul class="list-inline quicklinks">
					<li><a href="${createLink(controller: 'login', action: 'login')}">Login</a>
					</li>
				</ul>
			</div>
			<div class="col-md-4">
				<span class="copyright">Versión ${message(code: 'version', default: '1.1.0x')}</span>
			</div>
		</div>
	</div>
</footer>

<div id="aqui"></div>


<script type="text/javascript">

    var url = "${resource(dir:'images', file:'spinner-gif-17.gif')}";
    var spinner = $("<img style='margin-left:15px; height: 7%; width: 7%' src='" + url + "' alt='Enviando...'/>");


	$("#btnEnviarMail").click(function () {

		var nombre= $("#name").val();
		var telefono= $("#phone").val();
		var correo = $("#email").val();
		var mensaje = $("#message").val();

        var btn = $(this);
        var $btn = btn.clone(true);


		if(nombre != '' && telefono != '' && correo != '' && mensaje != ''){

           btn.replaceWith(spinner);

			$.ajax({
				type: 'POST',
				url: "${createLink(controller: 'principal', action: 'enviarMail_ajax')}",
				data:{
					nombre: nombre,
					telefono: telefono,
					correo: correo,
					mensaje: mensaje

				},
				success: function (msg) {
                    spinner.replaceWith($btn);

					if(msg == 'ok'){
						alert("Su mensaje ha sido enviado correctamente, pronto estaremos comunicándonos con usted.")
					}else{
                        alert("Ha ocurrido un error al enviar su mensaje, porfavor intente otra vez.")
					}

				}
			})
		} else{
			alert("Debe llenar todos los campos!")
		}
	});


	$(".btnArt").click(function () {
		var id = $(this).attr("at_id");
		$.ajax({
			type:'POST',
			url:"${createLink(controller: 'principal', action: 'dialogos_ajax')}",
			data: {
				id: id
			},
			success: function (msg) {
				$("#aqui").html(msg);
			}
		});
	});


</script>



<!-- jQuery -->
%{--<script src="vendor/jquery/jquery.min.js"></script>--}%
%{--<script src="${resource(dir: 'js/jquery', file: 'js/jquery-ui-1.10.3.custom.min.js')}"></script>--}%
<script src="${resource(dir: 'agency-theme/vendor/jquery', file: 'jquery.min.js')}"></script>
<script src="${resource(dir: 'agency-theme/vendor/jquery', file: 'jquery.js')}"></script>

<!-- Bootstrap Core JavaScript -->
%{--<script src="vendor/bootstrap/js/bootstrap.min.js"></script>--}%
%{--<script src="${resource(dir: 'agency-theme/vendor/bootstrap', file: 'js/bootstrap.min.js')}"></script>--}%
<script src="${resource(dir: 'agency-theme/vendor/bootstrap', file: 'js/bootstrap.js')}"></script>

<!-- Plugin JavaScript -->
%{--<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>--}%
<script src="${resource(dir: 'jquery-easing', file: 'jquery.easing.1.3.min.js')}"></script>

<!-- Contact Form JavaScript -->
%{--<script src="js/jqBootstrapValidation.js"></script>--}%
<script src="${resource(dir: 'agency-theme', file: 'js/jqBootstrapValidation.js')}"></script>
<script src="${resource(dir: 'agency-theme', file: 'js/contact_me.js')}"></script>
%{--<script src="js/contact_me.js"></script>--}%

<!-- Theme JavaScript -->
%{--<script src="js/agency.min.js"></script>--}%
<script src="${resource(dir: 'agency-theme', file: 'js/agency.min.js')}"></script>

</body>

</html>
