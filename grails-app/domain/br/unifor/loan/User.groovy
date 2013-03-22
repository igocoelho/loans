package br.unifor.loan

class User {

	String name

	static hasMany = [games: Game]

    static constraints = {
    }

    String toString() {
    	name
    }
}
