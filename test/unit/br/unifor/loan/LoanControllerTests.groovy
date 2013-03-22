package br.unifor.loan



import org.junit.*
import grails.test.mixin.*

@TestFor(LoanController)
@Mock(Loan)
class LoanControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/loan/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.loanInstanceList.size() == 0
        assert model.loanInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.loanInstance != null
    }

    void testSave() {
        controller.save()

        assert model.loanInstance != null
        assert view == '/loan/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/loan/show/1'
        assert controller.flash.message != null
        assert Loan.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/loan/list'

        populateValidParams(params)
        def loan = new Loan(params)

        assert loan.save() != null

        params.id = loan.id

        def model = controller.show()

        assert model.loanInstance == loan
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/loan/list'

        populateValidParams(params)
        def loan = new Loan(params)

        assert loan.save() != null

        params.id = loan.id

        def model = controller.edit()

        assert model.loanInstance == loan
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/loan/list'

        response.reset()

        populateValidParams(params)
        def loan = new Loan(params)

        assert loan.save() != null

        // test invalid parameters in update
        params.id = loan.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/loan/edit"
        assert model.loanInstance != null

        loan.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/loan/show/$loan.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        loan.clearErrors()

        populateValidParams(params)
        params.id = loan.id
        params.version = -1
        controller.update()

        assert view == "/loan/edit"
        assert model.loanInstance != null
        assert model.loanInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/loan/list'

        response.reset()

        populateValidParams(params)
        def loan = new Loan(params)

        assert loan.save() != null
        assert Loan.count() == 1

        params.id = loan.id

        controller.delete()

        assert Loan.count() == 0
        assert Loan.get(loan.id) == null
        assert response.redirectedUrl == '/loan/list'
    }
}
