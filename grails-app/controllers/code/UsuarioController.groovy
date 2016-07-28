package code

import org.springframework.dao.DataIntegrityViolationException


/**
 * Controlador que muestra las pantallas de manejo de Usuario
 */
class UsuarioController {

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
            def c = Usuario.createCriteria()
            list = c.list(params) {
                or {
                    /* TODO: cambiar aqui segun sea necesario */

                    ilike("activo", "%" + params.search + "%")
                    ilike("apellido", "%" + params.search + "%")
                    ilike("login", "%" + params.search + "%")
                    ilike("mail", "%" + params.search + "%")
                    ilike("nombre", "%" + params.search + "%")
                    ilike("sexo", "%" + params.search + "%")
                    ilike("telefono", "%" + params.search + "%")
                    ilike("titulo", "%" + params.search + "%")
                }
            }
        } else {
            list = Usuario.list(params)
        }
        if (!all && params.offset.toInteger() > 0 && list.size() == 0) {
            params.offset = params.offset.toInteger() - 1
            list = getList(params, all)
        }
        return list
    }

    /**
     * Acción que muestra la lista de elementos
     * @return usuarioInstanceList: la lista de elementos filtrados, usuarioInstanceCount: la cantidad total de elementos (sin máximo)
     */
    def list() {
        def usuarioInstanceList = getList(params, false)
        def usuarioInstanceCount = getList(params, true).size()
        return [usuarioInstanceList: usuarioInstanceList, usuarioInstanceCount: usuarioInstanceCount]
    }

    /**
     * Acción llamada con ajax que muestra la información de un elemento particular
     * @return usuarioInstance el objeto a mostrar cuando se encontró el elemento
     * @render ERROR*[mensaje] cuando no se encontró el elemento
     */
    def show_ajax() {
        if (params.id) {
            def usuarioInstance = Usuario.get(params.id)
            if (!usuarioInstance) {
                render "ERROR*No se encontró Usuario."
                return
            }
            return [usuarioInstance: usuarioInstance]
        } else {
            render "ERROR*No se encontró Usuario."
        }
    } //show para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que muestra un formaulario para crear o modificar un elemento
     * @return usuarioInstance el objeto a modificar cuando se encontró el elemento
     * @render ERROR*[mensaje] cuando no se encontró el elemento
     */
    def form_ajax() {
        def usuarioInstance = new Usuario()
        if (params.id) {
            usuarioInstance = Usuario.get(params.id)
            if (!usuarioInstance) {
                render "ERROR*No se encontró Usuario."
                return
            }
        }
        usuarioInstance.properties = params
        return [usuarioInstance: usuarioInstance]
    } //form para cargar con ajax en un dialog

    /**
     * Acción llamada con ajax que guarda la información de un elemento
     * @render ERROR*[mensaje] cuando no se pudo grabar correctamente, SUCCESS*[mensaje] cuando se grabó correctamente
     */
    def save_ajax() {
        def usuarioInstance = new Usuario()
        if (params.id) {
            usuarioInstance = Usuario.get(params.id)
            if (!usuarioInstance) {
                render "ERROR*No se encontró Usuario."
                return
            }
        }
        usuarioInstance.properties = params
        if (!usuarioInstance.save(flush: true)) {
            render "ERROR*Ha ocurrido un error al guardar Usuario: " + renderErrors(bean: usuarioInstance)
            return
        }
        render "SUCCESS*${params.id ? 'Actualización' : 'Creación'} de Usuario exitosa."
        return
    } //save para grabar desde ajax

    /**
     * Acción llamada con ajax que permite eliminar un elemento
     * @render ERROR*[mensaje] cuando no se pudo eliminar correctamente, SUCCESS*[mensaje] cuando se eliminó correctamente
     */
    def delete_ajax() {
        if (params.id) {
            def usuarioInstance = Usuario.get(params.id)
            if (!usuarioInstance) {
                render "ERROR*No se encontró Usuario."
                return
            }
            try {
                usuarioInstance.delete(flush: true)
                render "SUCCESS*Eliminación de Usuario exitosa."
                return
            } catch (DataIntegrityViolationException e) {
                render "ERROR*Ha ocurrido un error al eliminar Usuario"
                return
            }
        } else {
            render "ERROR*No se encontró Usuario."
            return
        }
    } //delete para eliminar via ajax

    /**
     * Acción llamada con ajax que valida que no se duplique la propiedad login
     * @render boolean que indica si se puede o no utilizar el valor recibido
     */
    def validar_unique_login_ajax() {
        params.login = params.login.toString().trim()
        if (params.id) {
            def obj = Usuario.get(params.id)
            if (obj.login.toLowerCase() == params.login.toLowerCase()) {
                render true
                return
            } else {
                render Usuario.countByLoginIlike(params.login) == 0
                return
            }
        } else {
            render Usuario.countByLoginIlike(params.login) == 0
            return
        }
    }

    /**
     * Acción llamada con ajax que valida que no se duplique la propiedad mail
     * @render boolean que indica si se puede o no utilizar el valor recibido
     */
    def validar_unique_mail_ajax() {
        params.mail = params.mail.toString().trim()
        if (params.id) {
            def obj = Usuario.get(params.id)
            if (obj.mail.toLowerCase() == params.mail.toLowerCase()) {
                render true
                return
            } else {
                render Usuario.countByMailIlike(params.mail) == 0
                return
            }
        } else {
            render Usuario.countByMailIlike(params.mail) == 0
            return
        }
    }

}
