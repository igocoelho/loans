package br.unifor.loan

import org.springframework.dao.DataIntegrityViolationException

class LoanController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [loanInstanceList: Loan.list(params), loanInstanceTotal: Loan.count()]
    }

    def create() {
        [loanInstance: new Loan(params)]
    }

    def save() {
        def loanInstance = new Loan(params)
        if (!loanInstance.save(flush: true)) {
            render(view: "create", model: [loanInstance: loanInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'loan.label', default: 'Loan'), loanInstance.id])
        redirect(action: "show", id: loanInstance.id)
    }

    def show(Long id) {
        def loanInstance = Loan.get(id)
        if (!loanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'loan.label', default: 'Loan'), id])
            redirect(action: "list")
            return
        }

        [loanInstance: loanInstance]
    }

    def edit(Long id) {
        def loanInstance = Loan.get(id)
        if (!loanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'loan.label', default: 'Loan'), id])
            redirect(action: "list")
            return
        }

        [loanInstance: loanInstance]
    }

    def update(Long id, Long version) {
        def loanInstance = Loan.get(id)
        if (!loanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'loan.label', default: 'Loan'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (loanInstance.version > version) {
                loanInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'loan.label', default: 'Loan')] as Object[],
                          "Another user has updated this Loan while you were editing")
                render(view: "edit", model: [loanInstance: loanInstance])
                return
            }
        }

        loanInstance.properties = params

        if (!loanInstance.save(flush: true)) {
            render(view: "edit", model: [loanInstance: loanInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'loan.label', default: 'Loan'), loanInstance.id])
        redirect(action: "show", id: loanInstance.id)
    }

    def delete(Long id) {
        def loanInstance = Loan.get(id)
        if (!loanInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'loan.label', default: 'Loan'), id])
            redirect(action: "list")
            return
        }

        try {
            loanInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'loan.label', default: 'Loan'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'loan.label', default: 'Loan'), id])
            redirect(action: "show", id: id)
        }
    }
}
