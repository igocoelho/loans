package br.unifor.loan

import org.springframework.dao.DataIntegrityViolationException

class ConsoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [consoleInstanceList: Console.list(params), consoleInstanceTotal: Console.count()]
    }

    def create() {
        [consoleInstance: new Console(params)]
    }

    def save() {
        def consoleInstance = new Console(params)
        if (!consoleInstance.save(flush: true)) {
            render(view: "create", model: [consoleInstance: consoleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'console.label', default: 'Console'), consoleInstance.id])
        redirect(action: "create")
    }

    def edit(Long id) {
        def consoleInstance = Console.get(id)
        if (!consoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'console.label', default: 'Console'), id])
            redirect(action: "list")
            return
        }

        [consoleInstance: consoleInstance]
    }

    def update(Long id, Long version) {
        def consoleInstance = Console.get(id)
        if (!consoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'console.label', default: 'Console'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (consoleInstance.version > version) {
                consoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'console.label', default: 'Console')] as Object[],
                          "Another user has updated this Console while you were editing")
                render(view: "edit", model: [consoleInstance: consoleInstance])
                return
            }
        }

        consoleInstance.properties = params

        if (!consoleInstance.save(flush: true)) {
            render(view: "edit", model: [consoleInstance: consoleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'console.label', default: 'Console'), consoleInstance.id])
        redirect(action: "list")
    }

    def delete(Long id) {
        def consoleInstance = Console.get(id)
        def resultado = [:]

        if (!consoleInstance) {
            resultado.message = message(code: 'default.not.found.message', args: [message(code: 'console.label', default: 'Console'), id])
            resultado.status = 'error'

        } else {
            try {
                consoleInstance.delete(flush: true)
                resultado.message = message(code: 'default.deleted.message', args: [message(code: 'console.label', default: 'Console'), id])
                resultado.status = 'ok'
            }
            catch (DataIntegrityViolationException e) {
                resultado.message = message(code: 'default.not.deleted.message', args: [message(code: 'console.label', default: 'Console'), id])
                resultado.status = 'ok'
            }
        }

        render(contentType:"text/json") {
            resultado
        }
    }
}
