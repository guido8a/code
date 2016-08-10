package code

import org.springframework.dao.DataIntegrityViolationException


/**
 * Controlador que muestra las pantallas de manejo de Seccion
 */
class SeccionController extends code.Shield {

    static allowedMethods = [save_ajax: "POST", delete_ajax: "POST"]

    /**
     * Acción que redirecciona a la lista (acción "list")
     */
    def index() {
        redirect(action: "list", params: params)
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
        if (all) {
            params.remove("max")
            params.remove("offset")
        }
        def list
        if (params.search) {
            def c = Seccion.createCriteria()
            list = c.list(params) {
                or {
                    /* TODO: cambiar aqui segun sea necesario */

                    ilike("estado", "%" + params.search + "%")
                    ilike("imagen", "%" + params.search + "%")
                    ilike("menu", "%" + params.search + "%")
                    ilike("subtitulo", "%" + params.search + "%")
                    ilike("titulo", "%" + params.search + "%")
                }
            }
        } else {
            list = Seccion.list(params)
        }
        if (!all && params.offset.toInteger() > 0 && list.size() == 0) {
            params.offset = params.offset.toInteger() - 1
            list = getList(params, all)
        }
        return list
    }

    /**
     * Acción que muestra la lista de elementos
     * @return seccionInstanceList: la lista de elementos filtrados, seccionInstanceCount: la cantidad total de elementos (sin máximo)
     */
    def list() {
        def seccionInstanceList = getList(params, false)
        def seccionInstanceCount = getList(params, true).size()
        return [seccionInstanceList: seccionInstanceList, seccionInstanceCount: seccionInstanceCount]
    }

    /**
     * Acción llamada con ajax que muestra la información de un elemento particular
     * @return seccionInstance el objeto a mostrar cuando se encontró el elemento
     * @render ERROR*[mensaje] cuando no se encontró el elemento
     */
    def show_ajax() {
        if (params.id) {
            def seccionInstance = Seccion.get(params.id)
            if (!seccionInstance) {
                render "ERROR*No se encontró Seccion."
                return
            }
            return [seccionInstance: seccionInstance]
        } else {
            render "ERROR*No se encontró Seccion."
        }
    } //show para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que muestra un formaulario para crear o modificar un elemento
     * @return seccionInstance el objeto a modificar cuando se encontró el elemento
     * @render ERROR*[mensaje] cuando no se encontró el elemento
     */
    def form_ajax() {
        def seccionInstance = new Seccion()
        if (params.id) {
            seccionInstance = Seccion.get(params.id)
            if (!seccionInstance) {
                render "ERROR*No se encontró Seccion."
                return
            }
        }
        seccionInstance.properties = params
        return [seccionInstance: seccionInstance]
    } //form para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que guarda la información de un elemento
     * @render ERROR*[mensaje] cuando no se pudo grabar correctamente, SUCCESS*[mensaje] cuando se grabó correctamente
     */
    def save_ajax() {
        def seccionInstance = new Seccion()
        if (params.id) {
            seccionInstance = Seccion.get(params.id)
            if (!seccionInstance) {
                render "ERROR*No se encontró Seccion."
                return
            }
        }
        seccionInstance.properties = params
        if (!seccionInstance.save(flush: true)) {
            render "ERROR*Ha ocurrido un error al guardar Seccion: " + renderErrors(bean: seccionInstance)
            return
        }
        render "SUCCESS*${params.id ? 'Actualización' : 'Creación'} de Seccion exitosa."
        return
    } //save para grabar desde ajax

    /**
     * Acción llamada con ajax que permite eliminar un elemento
     * @render ERROR*[mensaje] cuando no se pudo eliminar correctamente, SUCCESS*[mensaje] cuando se eliminó correctamente
     */
    def delete_ajax() {
        if (params.id) {
            def seccionInstance = Seccion.get(params.id)
            if (!seccionInstance) {
                render "ERROR*No se encontró Seccion."
                return
            }
            try {
                seccionInstance.delete(flush: true)
                render "SUCCESS*Eliminación de Seccion exitosa."
                return
            } catch (DataIntegrityViolationException e) {
                render "ERROR*Ha ocurrido un error al eliminar Seccion"
                return
            }
        } else {
            render "ERROR*No se encontró Seccion."
            return
        }
    } //delete para eliminar via ajax

}
