module main

import os
import Lexer
import SyntaxToken

fn main() {
	print('>>>')
	test := os.get_line()
	match test {
		'1 + 2 + 3' {
			println('7')
		}
		else {
			println('Error: invalid expression')
		}
	}

	token := SyntaxToken.SyntaxToken{
		kind: SyntaxToken.SyntaxKind.one
		position: 0
		text: 'my token'
	}
	println(token.kind)
	println(token.position)
	println(token.text)

	println(token.str())
}

fn next_token() {

}