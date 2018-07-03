import code.Articulo
import code.Seccion

class LayoutTagLib {

    static namespace = "elm"



    def plantilla = { attrs ->

        println "plantilla: attrs: $attrs"

        def seccion = Seccion.get(attrs.seccion)
        def articulos

        def html = ""

            switch (seccion.layout.codigo) {

                case "PA01":
                    articulos = Articulo.findBySeccion(seccion, [sort:'orden', order: 'asc'])
                    html +=     '<div class="row">'
                    html +=     '<div class="col-lg-12">'
                    html +=     '<div class="row">'
                    html +=     '<div class="col-md-4">'
                    html +=     "<img src='${resource(dir: 'images', file: articulos?.imagen)}' style='width: 100%'>"
                    html +=     '</div>'
                    html +=     '<div class="col-md-8">'
                    html +=     '<div class="form-group">'
                    if(articulos?.texto){
                        html +=      "<p class='' style='text-align: justify'>${articulos?.texto}</p>"
                    }else{
                        html +=      "<p class='' style='text-align: justify'>No se ha ingresado ningún texto!</p>"
                    }
                    html +=     '</div>'
                    html +=     '</div>'
                    html +=     '</div>'
                    html +=     '</div>'
                    html +=     '</div>'
                    break;
                case "LN01":
                    articulos = Articulo.findAllBySeccion(seccion, [sort:'orden', order: 'asc'])
                    articulos.each {
                        html += '<div class="col-md-4 col-sm-6 client" style="text-align: center">'
                        html += '<span class="fa-stack fa-4x servicio logo">'
                        html += "<a href='#${it.id}' class='portfolio-link btnArt' data-toggle='modal' at_id='${it.id}'>"
                        html += '<i class="fa fa-circle fa-stack-2x text-primary"></i>'
                        html += "<i class='fa fa-${it?.imagen} fa-stack-1x fa-inverse'></i>"
                        html += '</a>'
                        html += '</span>'
                        html += "<h4 class='service-heading'>${it?.titulo}</h4>"
//                        html += "<p class='text-muted' id='descripcionServicio'>${it?.descripcion}</p>"
                        html += "<p class='text-muted' id='descripcionServicio' style='font-size: 10px; font-weight: bold;'>${it?.subtitulo}</p>"
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
                            html += '<div class="">'
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
                            html += '<div class="col-md-4"></div>'
                            html += '<div class="col-md-4">'
                            html += "<h4>${it.titulo}</h4>"
                            html += "<p class='text-muted'>${it.subtitulo}</p>"
                            html += '</div>'
                            html += '</div>'
                        }
                    }

                    break;
                case "MX01":
                    articulos = Articulo.findAllBySeccion(seccion)
                    articulos.each {
                        html += '<div class="col-lg-12">'
                        html += '<ul class="timeline">'
                        html += '<li>'
                        html += '<div class="timeline-image">'
                        html += '<span class="fa-stack fa-4x">'
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

        out << html
    }


}
