package code

import groovy.io.FileType
import code.Usuario

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

import static java.awt.RenderingHints.KEY_INTERPOLATION
import static java.awt.RenderingHints.VALUE_INTERPOLATION_BICUBIC

class ArtcImagenesController {

    def index() {}

    def uploader() {
//        println params
        def usuario = Usuario.get(1)
        def path = servletContext.getRealPath("/") + "images/quanto/"
        new File(path).mkdirs()

        def f = request.getFile('upload')

        def okContents = ['image/png': "png", 'image/jpeg': "jpeg", 'image/jpg': "jpg", 'image/gif': "gif"]

        if (f && !f.empty) {
            def fileName = f.getOriginalFilename() //nombre original del archivo
            def ext
            def parts = fileName.split("\\.")
            fileName = ""
            parts.eachWithIndex { obj, i ->
                if (i < parts.size() - 1) {
                    fileName += obj
                } else {
                    ext = obj
                }
            }

            if (okContents.containsKey(f.getContentType())) {
                ext = okContents[f.getContentType()]
                fileName = fileName.size() < 40 ? fileName : fileName[0..39]
                fileName = fileName.tr(/áéíóúñÑÜüÁÉÍÓÚàèìòùÀÈÌÒÙÇç .!¡¿?&#°"'/, "aeiounNUuAEIOUaeiouAEIOUCc_")

                def nombre = fileName + "." + ext
                def pathFile = path + nombre
                def fn = fileName
                def src = new File(pathFile)

                def i = 1
                while (src.exists()) {
                    nombre = fn + "_" + i + "." + ext
                    pathFile = path + nombre
                    src = new File(pathFile)
                    i++
                }
                try {
                    f.transferTo(new File(pathFile)) // guarda el archivo subido al nuevo path
                    //println pathFile
                } catch (e) {
                    println "????????\n" + e + "\n???????????"
                }
                /* RESIZE */
                def img = ImageIO.read(new File(pathFile))

                def scale = 0.5

                def minW = 200
                def minH = 200

                def maxW = minW * 3
                def maxH = minH * 3

                def w = img.width
                def h = img.height

                if (w > maxW || h > maxH) {
                    int newW = w * scale
                    int newH = h * scale
                    int r = 1
                    if (w > h) {
                        r = w / maxW
                        newW = maxW
                        newH = h / r
                    } else {
                        r = h / maxH
                        newH = maxH
                        newW = w / r
                    }

                    new BufferedImage(newW, newH, img.type).with { j ->
                        createGraphics().with {
                            setRenderingHint(KEY_INTERPOLATION, VALUE_INTERPOLATION_BICUBIC)
                            drawImage(img, 0, 0, newW, newH, null)
                            dispose()
                        }
                        ImageIO.write(j, ext, new File(pathFile))
                    }
                }

                /* fin resize */
                def pathReturn = resource(dir: "images/quanto/", file: nombre)
                def output = '<html>' +
                        '<body>' +
                        '<script type="text/javascript">' +
                        'window.parent.CKEDITOR.tools.callFunction(' + params.CKEditorFuncNum + ', "' + pathReturn + '","' + "Archivo subido correctamente." + '");' +
                        '</script>' +
                        '</body>' +
                        '</html>';
                render output
            } //contenido ok (extension ok
            else {
                def ok = ""
                okContents.each {
                    if (ok != "") {
                        ok += ", "
                    }
                    ok += it.value
                }
                def output = '<html>' +
                        '<body>' +
                        '<script type="text/javascript">' +
                        'window.parent.CKEDITOR.tools.callFunction(' + params.CKEditorFuncNum + ', "","' + "Por favor utilice archivos de tipo ${ok}." + '");' +
                        '</script>' +
                        '</body>' +
                        '</html>';
                render output
            }
        }//f not empty
        else {
            def output = '<html>' +
                    '<body>' +
                    '<script type="text/javascript">' +
                    'window.parent.CKEDITOR.tools.callFunction(' + params.CKEditorFuncNum + ', "","' + "Por favor seleccione una imagen." + '");' +
                    '</script>' +
                    '</body>' +
                    '</html>';
            render output
        }
    }

    def browser() {
        def usuario = Usuario.get(1)
        def folderUsuario = "images/quanto/"
        def path = servletContext.getRealPath("/") + folderUsuario + "/"

        new File(path).mkdirs()

        def files = []

        def dir = new File(path)
        dir.eachFileRecurse(FileType.FILES) { file ->
            def img = ImageIO.read(file)
            if (img) {
                files.add([
                        dir : folderUsuario,
                        file: file.name,
                        w   : img?.getWidth(),
                        h   : img?.getHeight()
                ])
            }
        }
        return [files: files, funcNum: params.CKEditorFuncNum]
    }

    def delete_ajax() {
        def usuario = Usuario.get(1)
        def path = servletContext.getRealPath("/") + "images/quanto/"
        def file = params.file
        def fileDel = new File(path + file)
        fileDel.delete()
        render "OK_Archivo eliminado exitosamente"
    }
}