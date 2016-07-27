package code



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ArticuloController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Articulo.list(params), model:[articuloInstanceCount: Articulo.count()]
    }

    def show(Articulo articuloInstance) {
        respond articuloInstance
    }

    def create() {
        respond new Articulo(params)
    }

    @Transactional
    def save(Articulo articuloInstance) {
        if (articuloInstance == null) {
            notFound()
            return
        }

        if (articuloInstance.hasErrors()) {
            respond articuloInstance.errors, view:'create'
            return
        }

        articuloInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'articulo.label', default: 'Articulo'), articuloInstance.id])
                redirect articuloInstance
            }
            '*' { respond articuloInstance, [status: CREATED] }
        }
    }

    def edit(Articulo articuloInstance) {
        respond articuloInstance
    }

    @Transactional
    def update(Articulo articuloInstance) {
        if (articuloInstance == null) {
            notFound()
            return
        }

        if (articuloInstance.hasErrors()) {
            respond articuloInstance.errors, view:'edit'
            return
        }

        articuloInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Articulo.label', default: 'Articulo'), articuloInstance.id])
                redirect articuloInstance
            }
            '*'{ respond articuloInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Articulo articuloInstance) {

        if (articuloInstance == null) {
            notFound()
            return
        }

        articuloInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Articulo.label', default: 'Articulo'), articuloInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'articulo.label', default: 'Articulo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
