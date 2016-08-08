<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<script src="${resource(dir: 'agency-theme/vendor/jquery', file: 'jquery.min.js')}"></script>
	<script src="${resource(dir: 'agency-theme/vendor/jquery', file: 'jquery.js')}"></script>
	<script src="${resource(dir: 'js/bootbox-4.3.0', file: 'js/bootbox.js')}"></script>

	<title>TEDEIN S.A.</title>

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
	<link href='${resource(dir: 'agency-theme', file: 'css/agency.min.css')}' rel='stylesheet'>


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
		background-image: url("../agency-theme/img/portada.jpeg");
	}
	.cd-fixed-bg.cd-bg-2 {
		background-image: url("../agency-theme/img/portada2.jpeg");
	}
	.cd-fixed-bg.cd-bg-3 {
		background-image: url("../agency-theme/img/portada3.jpeg");
	}
	/*.cd-fixed-bg.cd-bg-4 {*/
	/*background-image: url("../img/cd-background-4.jpg");*/
	/*}*/

	.cd-scrolling-bg {
		min-height: 100% !important;
	}

	.cd-color-2{
		background-color: #006dba !important;
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
			<div class="intro-lead-in" style="color: #ff8123">${sitio?.descripcion}</div>
			<div class="intro-heading" style="color: #ff8123">${sitio?.nombre}</div>
			<a href="#${secciones.first()?.id}" class="page-scroll btn btn-xl">Más Información</a>
		</div>
	</div>
</header>


<g:each in="${secciones}" var="se" status="j">

	<section id="${se?.id}" class="bg-light-gray portfolio">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading">${se?.titulo}</h2>
					<h3 class="section-subheading text-muted">${se?.subtitulo}</h3>
				</div>
			</div>
			<elm:plantilla  seccion="${se?.id}"/>

		</div>
	</section>
</g:each>




%{--<div class="row">--}%
	%{--<div class="col-lg-12">--}%

			%{--<div class="row">--}%
				%{--<div class="col-md-3">--}%
					%{--<img src='${resource(dir: 'images', file: 'manos.png')}' style='height: 150px'>--}%
				%{--</div>--}%
				%{--<div class="col-md-9">--}%
					%{--<div class="form-group">--}%
						%{--<textarea class="form-control" placeholder="Tu pregunta o requerimiento *" id="message" required data-validation-required-message="Ingrese una pregunta o requerimiento"></textarea>--}%
					%{--<p class=""> Tedein S.A. es una empresa comprometida con el buen uso y la utilización adecuada de la tecnología para la solución de problemas de las empresas.--}%
					%{--Usualmente la tecnología llega a ser el mal necesario que las empresas deben sufrir. Tedein, busca hacer de la tecnología el principal aliado en el éxito empresarial.--}%
					%{--Su ámbito de acción es el desarrollo de grandes sistemas de información, los mismos que permiten aplicar los beneficios de la tecnología al quehacer cotidiano de la empresa. En este campo hemos desarrollado sistemas financieros, de control de producción, de construcción y presupuesto de obras civiles, de evaluación, etc.</p>--}%
					%{--</div>--}%
				%{--</div>--}%
			%{--</div>--}%
	%{--</div>--}%
%{--</div>--}%

<!-- Services Section -->
%{--<section id="services">--}%
	%{--<div class="container">--}%
		%{--<div class="row">--}%
			%{--<div class="col-lg-12 text-center">--}%
				%{--<h2 class="section-heading">Services</h2>--}%
				%{--<h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>--}%
			%{--</div>--}%
		%{--</div>--}%
		%{--<div class="row text-center">--}%
			%{--<div class="col-md-4">--}%
				%{--<span class="fa-stack fa-4x">--}%
					%{--<i class="fa fa-circle fa-stack-2x text-primary"></i>--}%
					%{--<i class="fa fa-shopping-cart fa-stack-1x fa-inverse"></i>--}%
				%{--</span>--}%
				%{--<h4 class="service-heading">E-Commerce</h4>--}%
				%{--<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>--}%
			%{--</div>--}%
			%{--<div class="col-md-4">--}%
				%{--<span class="fa-stack fa-4x">--}%
					%{--<i class="fa fa-circle fa-stack-2x text-primary"></i>--}%
					%{--<i class="fa fa-laptop fa-stack-1x fa-inverse"></i>--}%
				%{--</span>--}%
				%{--<h4 class="service-heading">Responsive Design</h4>--}%
				%{--<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>--}%
			%{--</div>--}%
			%{--<div class="col-md-4">--}%
				%{--<span class="fa-stack fa-4x">--}%
					%{--<i class="fa fa-circle fa-stack-2x text-primary"></i>--}%
					%{--<i class="fa fa-lock fa-stack-1x fa-inverse"></i>--}%
				%{--</span>--}%
				%{--<h4 class="service-heading">Web Security</h4>--}%
				%{--<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>--}%
			%{--</div>--}%
		%{--</div>--}%
	%{--</div>--}%
%{--</section>--}%

<!-- Portfolio Grid Section -->
%{--<section id="portfolio" class="bg-light-gray">--}%
%{--<div class="container">--}%
%{--<div class="row">--}%
%{--<div class="col-lg-12 text-center">--}%
%{--<h2 class="section-heading">${quanto[0].seccion.titulo}</h2>--}%

%{--<h3 class="section-subheading text-muted">${quanto[0].seccion.subtitulo}</h3>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="row">--}%

%{--<g:each in="${quanto}" var="qnto">--}%
%{--<div class="col-md-4 col-sm-6 portfolio-item">--}%
%{--<a href="#${qnto.seccion?.id}" class="portfolio-link btnArt" data-toggle="modal" at_id="${qnto.id}">--}%
%{--<div class="portfolio-hover">--}%
%{--<div class="portfolio-hover-content">--}%
%{--<i class="fa fa-plus fa-3x"></i>--}%
%{--</div>--}%
%{--</div>--}%
%{--<img src="${resource(dir: 'images', file: qnto.imagen)}" class="img-responsive" alt="${qnto.descripcion}" >--}%
%{--</a>--}%

%{--<div class="portfolio-caption">--}%
%{--<h4>${qnto.titulo}</h4>--}%

%{--<p class="text-muted">${qnto.subtitulo}</p>--}%
%{--</div>--}%
%{--</div>--}%
%{--</g:each>--}%



%{--<div class="col-md-4 col-sm-6 portfolio-item">--}%
%{--<a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">--}%
%{--<div class="portfolio-hover">--}%
%{--<div class="portfolio-hover-content">--}%
%{--<i class="fa fa-plus fa-3x"></i>--}%
%{--</div>--}%
%{--</div>--}%
%{--<img src="img/portfolio/roundicons.png" class="img-responsive" alt="">--}%
%{--<img src="${resource(dir: 'agency-theme', file: 'img/portfolio/roundicons.png')}"--}%
%{--class="img-responsive" alt="">--}%
%{--</a>--}%

%{--<div class="portfolio-caption">--}%
%{--<h4>Round Icons</h4>--}%

%{--<p class="text-muted">Graphic Design</p>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="col-md-4 col-sm-6 portfolio-item">--}%
%{--<a href="#portfolioModal2" class="portfolio-link" data-toggle="modal">--}%
%{--<div class="portfolio-hover">--}%
%{--<div class="portfolio-hover-content">--}%
%{--<i class="fa fa-plus fa-3x"></i>--}%
%{--</div>--}%
%{--</div>--}%
%{--<img src="img/portfolio/startup-framework.png" class="img-responsive" alt="">--}%
%{--</a>--}%

%{--<div class="portfolio-caption">--}%
%{--<h4>Startup Framework</h4>--}%

%{--<p class="text-muted">Website Design</p>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="col-md-4 col-sm-6 portfolio-item">--}%
%{--<a href="#portfolioModal3" class="portfolio-link" data-toggle="modal">--}%
%{--<div class="portfolio-hover">--}%
%{--<div class="portfolio-hover-content">--}%
%{--<i class="fa fa-plus fa-3x"></i>--}%
%{--</div>--}%
%{--</div>--}%
%{--<img src="img/portfolio/treehouse.png" class="img-responsive" alt="">--}%
%{--</a>--}%

%{--<div class="portfolio-caption">--}%
%{--<h4>Treehouse</h4>--}%

%{--<p class="text-muted">Website Design</p>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="col-md-4 col-sm-6 portfolio-item">--}%
%{--<a href="#portfolioModal4" class="portfolio-link" data-toggle="modal">--}%
%{--<div class="portfolio-hover">--}%
%{--<div class="portfolio-hover-content">--}%
%{--<i class="fa fa-plus fa-3x"></i>--}%
%{--</div>--}%
%{--</div>--}%
%{--<img src="img/portfolio/golden.png" class="img-responsive" alt="">--}%
%{--</a>--}%

%{--<div class="portfolio-caption">--}%
%{--<h4>Golden</h4>--}%

%{--<p class="text-muted">Website Design</p>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="col-md-4 col-sm-6 portfolio-item">--}%
%{--<a href="#portfolioModal5" class="portfolio-link" data-toggle="modal">--}%
%{--<div class="portfolio-hover">--}%
%{--<div class="portfolio-hover-content">--}%
%{--<i class="fa fa-plus fa-3x"></i>--}%
%{--</div>--}%
%{--</div>--}%
%{--<img src="img/portfolio/escape.png" class="img-responsive" alt="">--}%
%{--</a>--}%

%{--<div class="portfolio-caption">--}%
%{--<h4>Escape</h4>--}%

%{--<p class="text-muted">Website Design</p>--}%
%{--</div>--}%
%{--</div>--}%

%{--<div class="col-md-4 col-sm-6 portfolio-item">--}%
%{--<a href="#portfolioModal6" class="portfolio-link" data-toggle="modal">--}%
%{--<div class="portfolio-hover">--}%
%{--<div class="portfolio-hover-content">--}%
%{--<i class="fa fa-plus fa-3x"></i>--}%
%{--</div>--}%
%{--</div>--}%
%{--<img src="img/portfolio/dreams.png" class="img-responsive" alt="">--}%
%{--</a>--}%

%{--<div class="portfolio-caption">--}%
%{--<h4>Dreams</h4>--}%

%{--<p class="text-muted">Website Design</p>--}%
%{--</div>--}%
%{--</div>--}%

%{--</div>--}%
%{--</div>--}%
%{--</section>--}%

<!-- About Section -->
%{--<section id="about">--}%
%{--<div class="container">--}%
%{--<div class="row">--}%
%{--<div class="col-lg-12 text-center">--}%
%{--<h2 class="section-heading">About</h2>--}%
%{--<h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>--}%
%{--</div>--}%
%{--</div>--}%
%{--<div class="row">--}%
%{--<div class="col-lg-12">--}%
%{--<ul class="timeline">--}%
%{--<li>--}%
%{--<div class="timeline-image">--}%
%{--<img class="img-circle img-responsive" src="img/about/1.jpg" alt="">--}%
%{--</div>--}%
%{--<div class="timeline-panel">--}%
%{--<div class="timeline-heading">--}%
%{--<h4>2009-2011</h4>--}%
%{--<h4 class="subheading">Our Humble Beginnings</h4>--}%
%{--</div>--}%
%{--<div class="timeline-body">--}%
%{--<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>--}%
%{--</div>--}%
%{--</div>--}%
%{--</li>--}%
%{--<li class="timeline-inverted">--}%
%{--<div class="timeline-image">--}%
%{--<img class="img-circle img-responsive" src="img/about/2.jpg" alt="">--}%
%{--</div>--}%
%{--<div class="timeline-panel">--}%
%{--<div class="timeline-heading">--}%
%{--<h4>March 2011</h4>--}%
%{--<h4 class="subheading">An Agency is Born</h4>--}%
%{--</div>--}%
%{--<div class="timeline-body">--}%
%{--<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>--}%
%{--</div>--}%
%{--</div>--}%
%{--</li>--}%
%{--<li>--}%
%{--<div class="timeline-image">--}%
%{--<img class="img-circle img-responsive" src="img/about/3.jpg" alt="">--}%
%{--</div>--}%
%{--<div class="timeline-panel">--}%
%{--<div class="timeline-heading">--}%
%{--<h4>December 2012</h4>--}%
%{--<h4 class="subheading">Transition to Full Service</h4>--}%
%{--</div>--}%
%{--<div class="timeline-body">--}%
%{--<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>--}%
%{--</div>--}%
%{--</div>--}%
%{--</li>--}%
%{--<li class="timeline-inverted">--}%
%{--<div class="timeline-image">--}%
%{--<img class="img-circle img-responsive" src="img/about/4.jpg" alt="">--}%
%{--</div>--}%
%{--<div class="timeline-panel">--}%
%{--<div class="timeline-heading">--}%
%{--<h4>July 2014</h4>--}%
%{--<h4 class="subheading">Phase Two Expansion</h4>--}%
%{--</div>--}%
%{--<div class="timeline-body">--}%
%{--<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>--}%
%{--</div>--}%
%{--</div>--}%
%{--</li>--}%
%{--<li class="timeline-inverted">--}%
%{--<div class="timeline-image">--}%
%{--<h4>Be Part--}%
%{--<br>Of Our--}%
%{--<br>Story!</h4>--}%
%{--</div>--}%
%{--</li>--}%
%{--</ul>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</section>--}%

<!-- Team Section -->
%{--<section id="team" class="bg-light-gray">--}%
%{--<div class="container">--}%
%{--<div class="row">--}%
%{--<div class="col-lg-12 text-center">--}%
%{--<h2 class="section-heading">Our Amazing Team</h2>--}%
%{--<h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>--}%
%{--</div>--}%
%{--</div>--}%
%{--<div class="row">--}%
%{--<div class="col-sm-4">--}%
%{--<div class="team-member">--}%
%{--<img src="img/team/1.jpg" class="img-responsive img-circle" alt="">--}%
%{--<h4>Kay Garland</h4>--}%
%{--<p class="text-muted">Lead Designer</p>--}%
%{--<ul class="list-inline social-buttons">--}%
%{--<li><a href="#"><i class="fa fa-twitter"></i></a>--}%
%{--</li>--}%
%{--<li><a href="#"><i class="fa fa-facebook"></i></a>--}%
%{--</li>--}%
%{--<li><a href="#"><i class="fa fa-linkedin"></i></a>--}%
%{--</li>--}%
%{--</ul>--}%
%{--</div>--}%
%{--</div>--}%
%{--<div class="col-sm-4">--}%
%{--<div class="team-member">--}%
%{--<img src="img/team/2.jpg" class="img-responsive img-circle" alt="">--}%
%{--<h4>Larry Parker</h4>--}%
%{--<p class="text-muted">Lead Marketer</p>--}%
%{--<ul class="list-inline social-buttons">--}%
%{--<li><a href="#"><i class="fa fa-twitter"></i></a>--}%
%{--</li>--}%
%{--<li><a href="#"><i class="fa fa-facebook"></i></a>--}%
%{--</li>--}%
%{--<li><a href="#"><i class="fa fa-linkedin"></i></a>--}%
%{--</li>--}%
%{--</ul>--}%
%{--</div>--}%
%{--</div>--}%
%{--<div class="col-sm-4">--}%
%{--<div class="team-member">--}%
%{--<img src="img/team/3.jpg" class="img-responsive img-circle" alt="">--}%
%{--<h4>Diana Pertersen</h4>--}%
%{--<p class="text-muted">Lead Developer</p>--}%
%{--<ul class="list-inline social-buttons">--}%
%{--<li><a href="#"><i class="fa fa-twitter"></i></a>--}%
%{--</li>--}%
%{--<li><a href="#"><i class="fa fa-facebook"></i></a>--}%
%{--</li>--}%
%{--<li><a href="#"><i class="fa fa-linkedin"></i></a>--}%
%{--</li>--}%
%{--</ul>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--<div class="row">--}%
%{--<div class="col-lg-8 col-lg-offset-2 text-center">--}%
%{--<p class="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</section>--}%

<!-- Clients Aside -->
%{--<aside class="clients">--}%
%{--<div class="container">--}%
%{--<div class="row">--}%
%{--<div class="col-md-3 col-sm-6">--}%
%{--<a href="#">--}%
%{--<img src="img/logos/envato.jpg" class="img-responsive img-centered" alt="">--}%
%{--</a>--}%
%{--</div>--}%
%{--<div class="col-md-3 col-sm-6">--}%
%{--<a href="#">--}%
%{--<img src="img/logos/designmodo.jpg" class="img-responsive img-centered" alt="">--}%
%{--</a>--}%
%{--</div>--}%
%{--<div class="col-md-3 col-sm-6">--}%
%{--<a href="#">--}%
%{--<img src="img/logos/themeforest.jpg" class="img-responsive img-centered" alt="">--}%
%{--</a>--}%
%{--</div>--}%
%{--<div class="col-md-3 col-sm-6">--}%
%{--<a href="#">--}%
%{--<img src="img/logos/creative-market.jpg" class="img-responsive img-centered" alt="">--}%
%{--</a>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</aside>--}%

<!-- Contact Section -->
<section id="contact">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="section-heading">Contáctenos</h2>

				<div class="col-lg-3"></div>
				<div class="col-lg-6 text-center">
					<div class="panel-group well">
						<div class="row" style="height: 80px">
							<label>Dirección:</label>
							<h3 class="section-subheading text-muted">Rio Coca y Avenida de los Shyris E8 - 138  Quito - Ecuador.</h3>
						</div>
						<div class="row" style="height: 80px">
							<label>Teléfonos:</label>
							<h3 class="section-subheading text-muted">022 924 427 - 084 916 620.</h3>
						</div>
						<div class="row" style="height: 80px">
							<label>E-mail:</label><h3 class="section-subheading text-muted">soporte@tedein.com.ec, informacion@tedein.com.ec </h3>
						</div>
					</div>
				</div>
				%{--<div class="clearfix"></div>--}%
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
					<div class="row">
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
			%{--<div class="col-md-4">--}%
			%{--<ul class="list-inline social-buttons">--}%
			%{--<li><a href="#"><i class="fa fa-twitter"></i></a>--}%
			%{--</li>--}%
			%{--<li><a href="#"><i class="fa fa-facebook"></i></a>--}%
			%{--</li>--}%
			%{--<li><a href="#"><i class="fa fa-linkedin"></i></a>--}%
			%{--</li>--}%
			%{--</ul>--}%
			%{--</div>--}%
			<div class="col-md-4">
				<ul class="list-inline quicklinks">
					<li><a href="#">Login</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</footer>

<div id="aqui"></div>



<!-- Portfolio Modals -->
<!-- Use the modals below to showcase details about your portfolio projects! -->

<!-- Portfolio Modal 1 -->
%{--<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">--}%
%{--<div class="modal-dialog">--}%
%{--<div class="modal-content">--}%
%{--<div class="close-modal" data-dismiss="modal">--}%
%{--<div class="lr">--}%
%{--<div class="rl">--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--<div class="container">--}%
%{--<div class="row">--}%
%{--<div class="col-lg-8 col-lg-offset-2">--}%
%{--<div class="modal-body">--}%
%{--<!-- Project Details Go Here -->--}%
%{--<h2>Project Name</h2>--}%
%{--<p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>--}%
%{--<img class="img-responsive img-centered" src="img/portfolio/roundicons-free.png" alt="">--}%
%{--<p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>--}%
%{--<p>--}%
%{--<strong>Want these icons in this portfolio item sample?</strong>You can download 60 of them for free, courtesy of <a href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">RoundIcons.com</a>, or you can purchase the 1500 icon set <a href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">here</a>.</p>--}%
%{--<ul class="list-inline">--}%
%{--<li>Date: July 2014</li>--}%
%{--<li>Client: Round Icons</li>--}%
%{--<li>Category: Graphic Design</li>--}%
%{--</ul>--}%
%{--<button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

<!-- Portfolio Modal 2 -->
%{--<div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">--}%
%{--<div class="modal-dialog">--}%
%{--<div class="modal-content">--}%
%{--<div class="close-modal" data-dismiss="modal">--}%
%{--<div class="lr">--}%
%{--<div class="rl">--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--<div class="container">--}%
%{--<div class="row">--}%
%{--<div class="col-lg-8 col-lg-offset-2">--}%
%{--<div class="modal-body">--}%
%{--<h2>Project Heading</h2>--}%
%{--<p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>--}%
%{--<img class="img-responsive img-centered" src="img/portfolio/startup-framework-preview.png" alt="">--}%
%{--<p><a href="http://designmodo.com/startup/?u=787">Startup Framework</a> is a website builder for professionals. Startup Framework contains components and complex blocks (PSD+HTML Bootstrap themes and templates) which can easily be integrated into almost any design. All of these components are made in the same style, and can easily be integrated into projects, allowing you to create hundreds of solutions for your future projects.</p>--}%
%{--<p>You can preview Startup Framework <a href="http://designmodo.com/startup/?u=787">here</a>.</p>--}%
%{--<button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

<!-- Portfolio Modal 3 -->
%{--<div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">--}%
%{--<div class="modal-dialog">--}%
%{--<div class="modal-content">--}%
%{--<div class="close-modal" data-dismiss="modal">--}%
%{--<div class="lr">--}%
%{--<div class="rl">--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--<div class="container">--}%
%{--<div class="row">--}%
%{--<div class="col-lg-8 col-lg-offset-2">--}%
%{--<div class="modal-body">--}%
%{--<!-- Project Details Go Here -->--}%
%{--<h2>Project Name</h2>--}%
%{--<p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>--}%
%{--<img class="img-responsive img-centered" src="img/portfolio/treehouse-preview.png" alt="">--}%
%{--<p>Treehouse is a free PSD web template built by <a href="https://www.behance.net/MathavanJaya">Mathavan Jaya</a>. This is bright and spacious design perfect for people or startup companies looking to showcase their apps or other projects.</p>--}%
%{--<p>You can download the PSD template in this portfolio sample item at <a href="http://freebiesxpress.com/gallery/treehouse-free-psd-web-template/">FreebiesXpress.com</a>.</p>--}%
%{--<button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

<!-- Portfolio Modal 4 -->
%{--<div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">--}%
%{--<div class="modal-dialog">--}%
%{--<div class="modal-content">--}%
%{--<div class="close-modal" data-dismiss="modal">--}%
%{--<div class="lr">--}%
%{--<div class="rl">--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--<div class="container">--}%
%{--<div class="row">--}%
%{--<div class="col-lg-8 col-lg-offset-2">--}%
%{--<div class="modal-body">--}%
%{--<!-- Project Details Go Here -->--}%
%{--<h2>Project Name</h2>--}%
%{--<p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>--}%
%{--<img class="img-responsive img-centered" src="img/portfolio/golden-preview.png" alt="">--}%
%{--<p>Start Bootstrap's Agency theme is based on Golden, a free PSD website template built by <a href="https://www.behance.net/MathavanJaya">Mathavan Jaya</a>. Golden is a modern and clean one page web template that was made exclusively for Best PSD Freebies. This template has a great portfolio, timeline, and meet your team sections that can be easily modified to fit your needs.</p>--}%
%{--<p>You can download the PSD template in this portfolio sample item at <a href="http://freebiesxpress.com/gallery/golden-free-one-page-web-template/">FreebiesXpress.com</a>.</p>--}%
%{--<button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

<!-- Portfolio Modal 5 -->
%{--<div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">--}%
%{--<div class="modal-dialog">--}%
%{--<div class="modal-content">--}%
%{--<div class="close-modal" data-dismiss="modal">--}%
%{--<div class="lr">--}%
%{--<div class="rl">--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--<div class="container">--}%
%{--<div class="row">--}%
%{--<div class="col-lg-8 col-lg-offset-2">--}%
%{--<div class="modal-body">--}%
%{--<!-- Project Details Go Here -->--}%
%{--<h2>Project Name</h2>--}%
%{--<p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>--}%
%{--<img class="img-responsive img-centered" src="img/portfolio/escape-preview.png" alt="">--}%
%{--<p>Escape is a free PSD web template built by <a href="https://www.behance.net/MathavanJaya">Mathavan Jaya</a>. Escape is a one page web template that was designed with agencies in mind. This template is ideal for those looking for a simple one page solution to describe your business and offer your services.</p>--}%
%{--<p>You can download the PSD template in this portfolio sample item at <a href="http://freebiesxpress.com/gallery/escape-one-page-psd-web-template/">FreebiesXpress.com</a>.</p>--}%
%{--<button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

<!-- Portfolio Modal 6 -->
%{--<div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">--}%
%{--<div class="modal-dialog">--}%
%{--<div class="modal-content">--}%
%{--<div class="close-modal" data-dismiss="modal">--}%
%{--<div class="lr">--}%
%{--<div class="rl">--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--<div class="container">--}%
%{--<div class="row">--}%
%{--<div class="col-lg-8 col-lg-offset-2">--}%
%{--<div class="modal-body">--}%
%{--<!-- Project Details Go Here -->--}%
%{--<h2>Project Name</h2>--}%
%{--<p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>--}%
%{--<img class="img-responsive img-centered" src="img/portfolio/dreams-preview.png" alt="">--}%
%{--<p>Dreams is a free PSD web template built by <a href="https://www.behance.net/MathavanJaya">Mathavan Jaya</a>. Dreams is a modern one page web template designed for almost any purpose. It’s a beautiful template that’s designed with the Bootstrap framework in mind.</p>--}%
%{--<p>You can download the PSD template in this portfolio sample item at <a href="http://freebiesxpress.com/gallery/dreams-free-one-page-web-template/">FreebiesXpress.com</a>.</p>--}%
%{--<button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

<script type="text/javascript">

	$("#btnEnviarMail").click(function () {

		var nombre= $("#name").val();
		var telefono= $("#phone").val();
		var correo = $("#email").val();
		var mensaje = $("#message").val();


		if(nombre != '' && telefono != '' && correo != '' && mensaje != ''){
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
					if(msg == 'ok'){
						alert("Mail enviado correctamente")
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