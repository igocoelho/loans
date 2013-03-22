package br.unifor.loan

class Game {

	String name

	static belongsTo = [console: Console, user: User]

    static constraints = {
    }

    String toString() {
    	name
    }
}
