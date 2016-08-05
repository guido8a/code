import code.Articulo
import code.Seccion

class LayoutTagLib {

    static namespace = "elm"



    def plantilla = { attrs ->

//        println("attrs " + attrs)

        def seccion = Seccion.get(attrs.seccion)
        def articulos

        def html = ""

            switch (seccion.layout.codigo) {

                case "PA01":
                    articulos = Articulo.findBySeccion(seccion, [sort:'orden', order: 'asc'])
                    html +=     '<div class="row">'
                    html +=     '<div class="col-lg-12">'
                    html +=     '<div class="row">'
                    html +=     '<div class="col-md-3">'
                    html +=     "<img src='${resource(dir: 'images', file: articulos.imagen)}' style='height: 150px'>"
                    html +=     '</div>'
                    html +=     '<div class="col-md-9">'
                    html +=     '<div class="form-group">'
                    html +=      "<p class='' style='text-align: justify'>${articulos?.texto}</p>"
//                    html +=     "<p class='' style='text-align: justify'> Tedein S.A. es una empresa comprometida con el buen uso y la utilización adecuada de la tecnología para la solución de problemas de las empresas."
//                    html +=     '</br>Usualmente la tecnología llega a ser el mal necesario que las empresas deben sufrir. Tedein, busca hacer de la tecnología el principal aliado en el éxito empresarial.'
//                    html +=     '</br>Su ámbito de acción es el desarrollo de grandes sistemas de información, los mismos que permiten aplicar los beneficios de la tecnología al quehacer cotidiano de la empresa. En este campo hemos desarrollado sistemas financieros, de control de producción, de construcción y presupuesto de obras civiles, de evaluación, etc.</p>'
                    html +=     '</div>'
                    html +=     '</div>'
                    html +=     '</div>'
                    html +=     '</div>'
                    html +=     '</div>'
                    break;
                case "LN01":
                    articulos = Articulo.findAllBySeccion(seccion, [sort:'orden', order: 'asc'])

//                        html += '<div class="row text-center">'
                    articulos.each {
                        html += '<div class="col-md-4 col-sm-6">'
                        html += '<span class="fa-stack fa-4x">'
                        html += "<a href='#${it.id}' class='portfolio-link btnArt' data-toggle='modal' at_id='${it.id}'>"
                        html += '<i class="fa fa-circle fa-stack-2x text-primary"></i>'
                        html += "<i class='fa fa-${it?.imagen} fa-stack-1x fa-inverse'></i>"
                        html += '</a>'
                        html += '</span>'
                        html += "<h4 class='service-heading'>${it?.titulo}</h4>"
                        html += "<p class='text-muted'>${it?.descripcion}</p>"
                        html += '</div>'

                    }
//                    html += '</div>'
                    break;
                case "MT01":
                    articulos = Articulo.findAllBySeccion(seccion, [sort:'orden', order: 'asc'])
                    if(articulos.size() > 1){
                        articulos.each {
                            html += "<div class='col-md-4 col-sm-6 portfolio-item' style='height: 300px'>"
                            html += "<a href='#${it.id}' class='portfolio-link btnArt' data-toggle='modal' at_id='${it.id}'>"
                            html += '<div class="portfolio-hover">'
                            html += '<div class="portfolio-hover-content">'
                            html += '<i class="fa fa-plus fa-3x"></i>'
                            html += '</div>'
                            html += '</div>'
                            html += "<img src='${resource(dir: 'images', file: it.imagen)}' class='img-responsive' alt='${it.descripcion}' style='height: 150px'>"
                            html += '</a>'
                            html += '<div class="portfolio-caption">'
                            html += "<h4>${it.titulo}</h4>"
                            html += "<p class='text-muted'>${it.subtitulo}</p>"
                            html += '</div>'
                            html += '</div>'

                        }
                    }else{
                        articulos.each {
                            html += "<div class='col-md-12 col-sm-6 portfolio-item' style='height: 300px'>"
                            html += "<a href='#${it.id}' class='portfolio-link btnArt' data-toggle='modal' at_id='${it.id}'>"
                            html += '<div class="portfolio-hover">'
                            html += '<div class="portfolio-hover-content">'
                            html += '<i class="fa fa-plus fa-3x"></i>'
                            html += '</div>'
                            html += '</div>'
                            html += "<img src='${resource(dir: 'images', file: it.imagen)}' class='img-responsive' alt='${it.descripcion}' style='height: 150px'>"
                            html += '</a>'
                            html += '<div class="portfolio-caption">'
                            html += "<h4>${it.titulo}</h4>"
                            html += "<p class='text-muted'>${it.subtitulo}</p>"
                            html += '</div>'
                            html += '</div>'

                        }
                    }


//                    html += '<script>'
//                    html += '$(".btnArt").click(function () {'
//                    html += 'var id = $(this).attr("at_id");'
//                    html += '$.ajax({'
//                    html += 'type:\'POST\','
//                    html += "url:'${createLink(controller: 'principal', action: 'dialogos_ajax')}',"
//                    html += 'data: {'
//                    html += 'id: id'
//                    html += '},'
//                    html += 'success: function (msg) {'
//                    html += '$("#aqui").html(msg);'
//                    html += '}'
//                    html += '});'
//                    html += '});'
//                    html += '</script>'

                    break;
                case "MX01":
                    articulos = Articulo.findAllBySeccion(seccion)
                    articulos.each {
                        html += '<div class="col-lg-12">'
                        html += '<ul class="timeline">'
                        html += '<li>'
                        html += '<div class="timeline-image">'
                        html += '<span class="fa-stack fa-4x">'
//                        html += '<img class="img-circle img-responsive" src="img/about/1.jpg" alt="">'
                        html += '<i class="fa fa-circle fa-stack-2x text-primary"></i>'
                        html += "<i class='fa fa-${it?.imagen} fa-stack-2x fa-inverse'></i>"
                        html += '</span>'
                        html += '</div>'
                        html += '<div class="timeline-panel">'
                        html += '<div class="timeline-heading">'
                        html += "<h4>$it.titulo</h4>"
                        html += "<h4 class='subheading'>$it.subtitulo</h4>"
                        html += '</div>'
                        html += '<div class="timeline-body">'
                        html += "<p class='text-muted'>$it.texto</p>"
                        html += '</div>'
                        html += '</div>'
                        html += '</li>'
                        html +=   '</ul>'
                        html +=   '</div>'
                    }

                    break;
                default: html += ''

            }




//                '\t\t\t\t\t<li class="timeline-inverted">\n' +
//                '\t\t\t\t\t\t<div class="timeline-image">\n' +
//                '\t\t\t\t\t\t\t<img class="img-circle img-responsive" src="img/about/2.jpg" alt="">\n' +
//                '\t\t\t\t\t\t</div>\n' +
//                '\t\t\t\t\t\t<div class="timeline-panel">\n' +
//                '\t\t\t\t\t\t\t<div class="timeline-heading">\n' +
//                '\t\t\t\t\t\t\t\t<h4>March 2011</h4>\n' +
//                '\t\t\t\t\t\t\t\t<h4 class="subheading">An Agency is Born</h4>\n' +
//                '\t\t\t\t\t\t\t</div>\n' +
//                '\t\t\t\t\t\t\t<div class="timeline-body">\n' +
//                '\t\t\t\t\t\t\t\t<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n' +
//                '\t\t\t\t\t\t\t</div>\n' +
//                '\t\t\t\t\t\t</div>\n' +
//                '\t\t\t\t\t</li>\n' +
//                '\t\t\t\t\t<li>\n' +
//                '\t\t\t\t\t\t<div class="timeline-image">\n' +
//                '\t\t\t\t\t\t\t<img class="img-circle img-responsive" src="img/about/3.jpg" alt="">\n' +
//                '\t\t\t\t\t\t</div>\n' +
//                '\t\t\t\t\t\t<div class="timeline-panel">\n' +
//                '\t\t\t\t\t\t\t<div class="timeline-heading">\n' +
//                '\t\t\t\t\t\t\t\t<h4>December 2012</h4>\n' +
//                '\t\t\t\t\t\t\t\t<h4 class="subheading">Transition to Full Service</h4>\n' +
//                '\t\t\t\t\t\t\t</div>\n' +
//                '\t\t\t\t\t\t\t<div class="timeline-body">\n' +
//                '\t\t\t\t\t\t\t\t<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n' +
//                '\t\t\t\t\t\t\t</div>\n' +
//                '\t\t\t\t\t\t</div>\n' +
//                '\t\t\t\t\t</li>\n' +
//                '\t\t\t\t\t<li class="timeline-inverted">\n' +
//                '\t\t\t\t\t\t<div class="timeline-image">\n' +
//                '\t\t\t\t\t\t\t<img class="img-circle img-responsive" src="img/about/4.jpg" alt="">\n' +
//                '\t\t\t\t\t\t</div>\n' +
//                '\t\t\t\t\t\t<div class="timeline-panel">\n' +
//                '\t\t\t\t\t\t\t<div class="timeline-heading">\n' +
//                '\t\t\t\t\t\t\t\t<h4>July 2014</h4>\n' +
//                '\t\t\t\t\t\t\t\t<h4 class="subheading">Phase Two Expansion</h4>\n' +
//                '\t\t\t\t\t\t\t</div>\n' +
//                '\t\t\t\t\t\t\t<div class="timeline-body">\n' +
//                '\t\t\t\t\t\t\t\t<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>\n' +
//                '\t\t\t\t\t\t\t</div>\n' +
//                '\t\t\t\t\t\t</div>\n' +
//                '\t\t\t\t\t</li>\n' +
//                '\t\t\t\t\t<li class="timeline-inverted">\n' +
//                '\t\t\t\t\t\t<div class="timeline-image">\n' +
//                '\t\t\t\t\t\t\t<h4>Be Part\n' +
//                '\t\t\t\t\t\t\t\t<br>Of Our\n' +
//                '\t\t\t\t\t\t\t\t<br>Story!</h4>\n' +
//                '\t\t\t\t\t\t</div>\n' +
//                '\t\t\t\t\t</li>\n' +


        out << html
    }


}
