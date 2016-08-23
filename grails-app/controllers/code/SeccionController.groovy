package code

import groovy.json.JsonBuilder
import org.springframework.dao.DataIntegrityViolationException

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

import static java.awt.RenderingHints.KEY_INTERPOLATION
import static java.awt.RenderingHints.VALUE_INTERPOLATION_BICUBIC


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
//        println("save seccion  " + params)
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


    def cargarImagen_ajax () {
        println("params cargar imagen " + params)

        def seccion = Seccion.get(params.id)
        return [seccion: seccion]
    }


    def uploadFile() {
        println("params upload " + params)
        def path = servletContext.getRealPath("/") + "images/"
        new File(path).mkdirs()
//        def dia = new Date().format("dd-MM-yyyy_HH_mm_ss").toString()
        def nombre
        def seccion = Seccion.get(params.id)
//        def consultora = Consultora.get(params.id)

        def f = request.getFile('file')  //archivo = name del input type file

        def okContents = ['image/png': "png", 'image/jpeg': "jpeg", 'image/jpg': "jpg"]

        if (f && !f.empty) {
            def fileName = f.getOriginalFilename() //nombre original del archivo
            def ext

            if (okContents.containsKey(f.getContentType())) {
                ext = okContents[f.getContentType()]
//                fileName = fileName + "." + ext
                fileName = fileName
                def pathFile = path + fileName
                nombre = fileName
                println("nombre " + nombre)
                try {
                    f.transferTo(new File(pathFile)) // guarda el archivo subido al nuevo path
                } catch (e) {
                    println "????????\n" + e + "\n???????????"
                }

                if (!seccion.imagen || seccion.imagen != nombre) {
                    def fotoOld = seccion.imagen
                    if (fotoOld) {
                        def file = new File(path + fotoOld)
                        file.delete()
                    }
                    seccion.imagen = nombre
                    if (seccion.save(flush: true)) {
                        def data = [
                                files: [
                                        [
                                                name: nombre,
                                                url : resource(dir: 'images/', file: nombre),
                                                size: f.getSize(),
                                                url : pathFile
                                        ]
                                ]
                        ]
                        def json = new JsonBuilder(data)
                        render json
                        return
                    } else {
                        def data = [
                                files: [
                                        [
                                                name : nombre,
                                                size : f.getSize(),
                                                error: "Ha ocurrido un error al guardar"
                                        ]
                                ]
                        ]
                        def json = new JsonBuilder(data)
                        render json
                        return
                    }
                } else {
                    def data = [
                            files: [
                                    [
                                            name: nombre,
                                            url : resource(dir: 'images/', file: nombre),
                                            size: f.getSize(),
                                            url : pathFile
                                    ]
                            ]
                    ]
                    def json = new JsonBuilder(data)
                    render json
                    return
                }
            } else {
                def data = [
                        files: [
                                [
//                                        name : fileName + "." + ext,
                                        name : fileName,
                                        size : f.getSize(),
                                        error: "Extensión no permitida"
                                ]
                        ]
                ]

                def json = new JsonBuilder(data)
                render json
                return
            }
        }
        render "OK_${nombre}"
    }


    def seccionImagen_ajax () {
        def seccion = Seccion.get(params.id)

        def path = servletContext.getRealPath("/") + "images/" //web-app/archivos
        def img
        def w
        def h
        if (seccion?.imagen) {
            if(ImageIO?.read(new File(path + seccion.imagen))){
                img = ImageIO?.read(new File(path + seccion.imagen));
                w = img.getWidth();
                h = img.getHeight();
            }
        } else {
            w = 0
            h = 0
        }
        return [seccion: seccion, w: w, h: h]
    }





}
