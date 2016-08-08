package code

class ElementosTagLib {
//    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    static namespace = "elm"

    /**
     * crea el div para el flash message
     */
    def message = { attrs, body ->
        def contenido = body()

        def close = true
        if (attrs.close && (attrs.close == "false" || attrs.close == "0" || attrs.close == false || attrs.close == 0 || attrs.close.toLowerCase() == "n" || attrs.close.toLowerCase() == "no")) {
            close = false
        }

        if (!contenido) {
            if (attrs.contenido) {
                contenido = attrs.contenido
            }
        }

        if (contenido) {
            def finHtml = "</p></div>"

            def icono = ""
            def clase = attrs.clase ?: ""

            if (attrs.icon) {
                icono = attrs.icon
            } else {
                switch (attrs.tipo?.toLowerCase()) {
                    case "error":
                        icono = "fa fa-times"
                        clase += " alert-danger"
                        break;
                    case "success":
                        icono = "fa fa-check"
                        clase += " alert-success"
                        break;
                    case "notfound":
                        icono = "icon-ghost"
                        clase += " alert-info"
                        break;
                    case "warning":
                        icono = "fa fa-warning"
                        clase += " alert-warning"
                        break;
                    case "info":
                        icono = "fa fa-info-circle"
                        clase += " alert-info"
                        break;
                    case "bug":
                        icono = "fa fa-bug"
                        clase += " alert-warning"
                        break;
                    default:
                        clase += " alert-info"
                }
            }
            def html = "<div class=\"alert alert-dismissable ${clase}\">"
            if (close) {
                html += "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>"
            }
            html += "<p style='margin-bottom:15px;'>"
            html += "<i class=\"${icono} fa-2x pull-left iconMargin text-shadow\"></i> "
            out << html << contenido << finHtml
        } else {
            out << ""
        }
    }

    /**
     * crea el div para el flash message
     */
    def flashMessage = { attrs, body ->
        def contenido = body()
        if (!contenido) {
            if (attrs.contenido) {
                contenido = attrs.contenido
            }
        }

        if (contenido) {
            def finHtml = "</p></div>"

            def html = "<div class=\"alert ${attrs.tipo?.toLowerCase() == 'error' ? 'alert-danger' : attrs.tipo?.toLowerCase() == 'success' ? 'alert-success' : 'alert-info'} ${attrs.clase}\">"
            if (!attrs.dismissable || attrs.dismissable == true || attrs.dismissable.toString() == "1") {
                html += "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>"
            }

            if (attrs.icon) {
                html += "<i class=\"${attrs.icon} fa-2x pull-left iconMargin\"></i> "
            } else {
                if (attrs.tipo?.toLowerCase() == 'error') {
                    html += "<i class=\"fa fa-warning fa-2x pull-left iconMargin\"></i> "
                } else if (attrs.tipo?.toLowerCase() == 'success') {
                    html += "<i class=\"fa fa-check-square fa-2x pull-left iconMargin\"></i> "
                } else if (attrs.tipo?.toLowerCase() == 'notfound') {
                    html += "<i class=\"icon-ghost fa-2x pull-left iconMargin\"></i> "
                }
            }
            html += "<p>"
            out << html << contenido << finHtml
        } else {
            out << ""
        }
    }

    /**
     * hace la paginacion para una lista
     *  attrs:
     *          total       la cantidad total que tiene la tabla (el total de todas las páginas)
     *          maxPag      la cantidad máxima de páginas a mostrar. default: 10:       1 2 3 4 5 6 7 8 9 10 11 ... 20
     *          controller  controller para los links (si es diferente al actual)
     *          action      action para los links (si es diferente al actual)
     *          params      los parametros del link
     *                          max         cantidad máxima de registros por página
     *                          offset      el offset
     *                          sort        el ordenamiento
     *                          order       el sentido del ordenamiento
     *
     */
    def pagination = { attrs ->
//        println attrs

        if (attrs.total == null) {
            throwTagError("Tag [paginate] is missing required attribute [total]")
        }

        def maxPag = params.maxPag ?: 10

        def params = attrs.params

        def total = attrs.total
        def max = params.max ? params.max.toInteger() : 10
        def offset = params.offset ? params.offset.toInteger() : 0

        def curPag = (offset / max) + 1

        def paginas = Math.ceil(total / max).toInteger()

        def action = (attrs.action ? attrs.action : (params.action ? params.action : "list"))

        def linkParams = [:]
        if (attrs.params) {
            linkParams.putAll(attrs.params)
        }
//        linkParams.offset = offset - max
        linkParams.max = max
        if (params.sort) {
            linkParams.sort = params.sort
        }
        if (params.order) {
            linkParams.order = params.order
        }

        def linkTagAttrs = [action: action]
        if (attrs.controller) {
            linkTagAttrs.controller = attrs.controller
        }
        if (attrs.id != null) {
            linkTagAttrs.id = attrs.id
        }
        if (attrs.fragment != null) {
            linkTagAttrs.fragment = attrs.fragment
        }
        linkTagAttrs.params = linkParams

        def html = "<div class='row text-center'><ul class='pagination'>"

//        println "total: " + total + " max: " + max + " paginas: " + paginas + " curPag: " + curPag

        def firstPag, lastPag, link

        if (paginas > maxPag + 2) {
            firstPag = (curPag - Math.ceil(maxPag / 2)).toInteger()
            if (firstPag < 2) {
                firstPag = 2
            }
            lastPag = (curPag + Math.ceil(maxPag / 2)).toInteger()
            if (lastPag > paginas - 1) {
                lastPag = paginas - 1
            }
            def t = lastPag - firstPag
            if (t <= maxPag) {
                def extra = maxPag - t - 1
                lastPag += extra
                if (lastPag > paginas - 1) {
                    lastPag = paginas - 1
                }
            }
        } else {
            firstPag = 2
            lastPag = paginas - 1
        }

        def clase = curPag == 1 ? "active" : ""

        if (clase == "") {
//            params.offset = offset - max
//            link = createLink(action: action, params: params)

            linkParams.offset = offset - max
            link = createLink(linkTagAttrs.clone())

            html += "<li><a href='${link}'>&laquo;</a></li>"
        }

        html += "<li class='${clase}'>"
//        params.offset = 0
//        link = createLink(action: action, params: params)
        linkParams.offset = 0
        link = createLink(linkTagAttrs.clone())
        html += clase == 'active' ? "<span>1</span>" : "<a href='${link}'>1</a>"
        html += "</li>"

        if (firstPag > 2) {
            html += "<li class='disabled'><span>...</span></li>"
        }

        for (def i = firstPag; i <= lastPag; i++) {
//            params.offset = (i - 1) * max
//            link = createLink(action: action, params: params)
            linkParams.offset = (i - 1) * max
            link = createLink(linkTagAttrs.clone())
            clase = curPag == i ? "active" : ""
            html += "<li class='${clase}'>"
            html += clase == 'active' ? "<span>${i}</span>" : "<a href='${link}'>${i}</a>"
            html += "</li>"
        }

        if (lastPag < paginas - 1) {
            html += "<li class='disabled'><span>...</span></li>"
        }

        if (paginas > 1) {
            clase = curPag == paginas ? "active" : ""
//            params.offset = (paginas - 1) * max
//            link = createLink(action: action, params: params)
            linkParams.offset = (paginas - 1) * max
            link = createLink(linkTagAttrs.clone())
            html += "<li class='${clase}'>"
            html += clase == 'active' ? "<span>${paginas}</span>" : "<a href='${link}'>${paginas}</a>"
            html += "</li>"
            if (clase == "") {
//                params.offset = offset + max
//                link = createLink(action: action, params: params)
                linkParams.offset = offset + max
                link = createLink(linkTagAttrs.clone())
                html += "<li><a href='${link}'>&raquo;</a></li>"
            }
        }

        html += "</ul></div>"

        out << html
    }

    /**
     * pone el favicon
     */
    def favicon = { attrs ->
        def html = "<link rel=\"shortcut icon\" href=\"${assetPath(src: 'favicon.ico')}\" type=\"image/x-icon\">"
        html += "<link rel=\"apple-touch-icon\" href=\"${assetPath(src: 'apple-touch-icon.png')}\">"
        html += "<link rel=\"apple-touch-icon\" sizes=\"114x114\" href=\"${assetPath(src: 'apple-touch-icon-retina.png')}\">"
        out << html
    }

    def bootstrapCss = { attrs ->
//        def html = "<link href=\"${resource(dir: 'bootstrap-3.1.1/css', file: 'bootstrap.min.css')}\" rel=\"stylesheet\">"
        def html = "<link href=\"${resource(dir: 'bootstrap-3.1.1/css', file: 'bootstrap.css')}\" rel=\"stylesheet\">"
        html += "<link href=\"${resource(dir: 'bootstrap-3.1.1/css', file: 'bootstrap-theme.min.css')}\" rel=\"stylesheet\">"
        out << html
    }

    def bootstrapJs = { attrs ->
        def html = "<script src=\"${resource(dir: 'bootstrap-3.1.1/js', file: 'bootstrap.min.js')}\"></script>"
        out << html
    }


}
