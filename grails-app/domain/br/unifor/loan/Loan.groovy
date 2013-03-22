package br.unifor.loan

class Loan {

	Date loanDate 
	Date returnDate
	User sucker
	User fucker

	static hasMany = [games: Game]

    static constraints = {
    }
}
