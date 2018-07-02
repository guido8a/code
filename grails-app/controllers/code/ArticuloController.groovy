package code

import org.springframework.dao.DataIntegrityViolationException
//import code.seguridad.Shield


/**
 * Controlador que muestra las pantallas de manejo de Articulo
 */
class ArticuloController extends code.Shield {

    static allowedMethods = [save_ajax: "POST", delete_ajax: "POST"]

    /**
     * Acción que redirecciona a la lista (acción "list")
     */
    def index() {
        redirect(action:"list", params: params)
    }

    /**
     * Función que saca la lista de elementos según los parámetros recibidos
     * @param params objeto que contiene los parámetros para la búsqueda:: max: el máximo de respuestas, offset: índice del primer elemento (para la paginación), search: para efectuar búsquedas
     * @param all boolean que indica si saca todos los resultados, ignorando el parámetro max (true) o no (false)
     * @return lista de los elementos encontrados
     */
    def getList(params, all) {
        params = params.clone()
        params.max = params.max ? Math.min(params.max.toInteger(), 100) : 10
        params.offset = params.offset ?: 0
        if(all) {
            params.remove("max")
            params.remove("offset")
        }
        def list
        if(params.search) {
            def c = Articulo.createCriteria()
            list = c.list(params) {
                or {
                    /* TODO: cambiar aqui segun sea necesario */
                    
                    ilike("descripcion", "%" + params.search + "%")  
                    ilike("estado", "%" + params.search + "%")  
                    ilike("imagen", "%" + params.search + "%")  
                    ilike("metaDescripcion", "%" + params.search + "%")  
                    ilike("subtitulo", "%" + params.search + "%")  
                    ilike("texto", "%" + params.search + "%")  
                    ilike("titulo", "%" + params.search + "%")  
                }
            }
        } else {
            list = Articulo.list(params)
        }
        if (!all && params.offset.toInteger() > 0 && list.size() == 0) {
            params.offset = params.offset.toInteger() - 1
            list = getList(params, all)
        }
        return list
    }

    /**
     * Acción que muestra la lista de elementos
     * @return articuloInstanceList: la lista de elementos filtrados, articuloInstanceCount: la cantidad total de elementos (sin máximo)
     */
    def list() {

//        println("params lista"  + params)

        def seccion = Seccion.get(params.id)
        def articuloInstanceList = Articulo.findAllBySeccion(seccion)
        def articuloInstanceCount = articuloInstanceList.size()
//        def articuloInstanceList = getList(params, false)
//        def articuloInstanceCount = getList(params, true).size()
        return [articuloInstanceList: articuloInstanceList, articuloInstanceCount: articuloInstanceCount]
    }

    /**
     * Acción llamada con ajax que muestra la información de un elemento particular
     * @return articuloInstance el objeto a mostrar cuando se encontró el elemento
     * @render ERROR*[mensaje] cuando no se encontró el elemento
     */
    def show_ajax() {
        if(params.id) {
            def articuloInstance = Articulo.get(params.id)
            if(!articuloInstance) {
                render "ERROR*No se encontró Articulo."
                return
            }
            return [articuloInstance: articuloInstance]
        } else {
            render "ERROR*No se encontró Articulo."
        }
    } //show para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que muestra un formaulario para crear o modificar un elemento
     * @return articuloInstance el objeto a modificar cuando se encontró el elemento
     * @render ERROR*[mensaje] cuando no se encontró el elemento
     */
    def form_ajax() {
        def articuloInstance = new Articulo()
        if(params.id) {
            articuloInstance = Articulo.get(params.id)
            if(!articuloInstance) {
                render "ERROR*No se encontró Articulo."
                return
            }
        }
        articuloInstance.properties = params
        return [articuloInstance: articuloInstance]
    } //form para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que guarda la información de un elemento
     * @render ERROR*[mensaje] cuando no se pudo grabar correctamente, SUCCESS*[mensaje] cuando se grabó correctamente
     */
    def save_ajax() {
        println "params: $params"
        def articuloInstance = new Articulo()
        if(params.id) {
            articuloInstance = Articulo.get(params.id)
            if(!articuloInstance) {
                render "ERROR*No se encontró Articulo."
                return
            }
        }
        articuloInstance.properties = params
        if(!articuloInstance.save(flush: true)) {
            render "ERROR*Ha ocurrido un error al guardar Articulo: " + renderErrors(bean: articuloInstance)
            return
        }
        render "SUCCESS*${params.id ? 'Actualización' : 'Creación'} de Articulo exitosa."
        return
    } //save para grabar desde ajax

    /**
     * Acción llamada con ajax que permite eliminar un elemento
     * @render ERROR*[mensaje] cuando no se pudo eliminar correctamente, SUCCESS*[mensaje] cuando se eliminó correctamente
     */
    def delete_ajax() {
        if(params.id) {
            def articuloInstance = Articulo.get(params.id)
            if (!articuloInstance) {
                render "ERROR*No se encontró Articulo."
                return
            }
            try {
                articuloInstance.delete(flush: true)
                render "SUCCESS*Eliminación de Articulo exitosa."
                return
            } catch (DataIntegrityViolationException e) {
                render "ERROR*Ha ocurrido un error al eliminar Articulo"
                return
            }
        } else {
            render "ERROR*No se encontró Articulo."
            return
        }
    } //delete para eliminar via ajax

    def articulo () {
        def artc = Articulo.get(params.id)
        return [artc: artc]
    }

    def guardarArtc_ajax () {
//        println("---------- " + params)
//        println "guardarArtc params.seccion: ${params.seccion}, id: ${params.id}, dscr: ${params.descripcion}"
//        println "session: $session"

        def articuloInstance
        def seccion = Seccion.get(params.seccion)

        if(params.id){
            articuloInstance = Articulo.get(params.id)
        } else {
            articuloInstance = new Articulo()
            articuloInstance.fecha = new Date()
        }
        articuloInstance.properties = params
//        articuloInstance.estado = 'A'
        articuloInstance.seccion = seccion
//        println "seccion: $seccion, ${articuloInstance.seccion}"

        try{
//            println "...1, >>> ${articuloInstance.descripcion}"
            articuloInstance.save(flush: true)
//            articuloInstance.save()
//            println "guardado ----- "
            articuloInstance.refresh()
//            println "....id: ${articuloInstance.id}, ${articuloInstance.seccion}"
            render "ok_${articuloInstance.id}"

        } catch (e) {
            println("error al guardar el problema " + articuloInstance.errors)
            render "no"
        }

    }

    def validarTitulo_ajax () {
//        println "params: $params"
        def titulo = params.titulo

        if(titulo.size() < 3){
            render false
            return
        }else{
            render true
            return
        }
    }

    def validarEstado_ajax () {
        def estado = params.estado

        if(estado in ['A', 'N']) {
            render true
            return
        }else{
            render false
            return
        }
    }

    def validarMeta_ajax () {
//        println "validarMeta_ajax .... $params"
        def meta = params.meta

        if(meta.size() > 0) {
            render true
            return
        }else{
            render false
            return
        }
    }

    def lista () {

    }



}
