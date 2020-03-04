module main

import os
import Lexer
import SyntaxToken

fn main() {
	// print('>>>')
	// test := os.get_line()
	// match test {
	// 	'1 + 2 + 3' {
	// 		println('7')
	// 	}
	// 	else {
	// 		println('Error: invalid expression')
	// 	}
	// }

	// token := SyntaxToken.SyntaxToken{
	// 	kind: SyntaxToken.SyntaxKind.one
	// 	position: 0
	// 	text: 'my token'
	// }
	// println(token.kind)
	// println(token.position)
	// println(token.text)

	// println(token.str())

	for {
		print('>>>')
		line := os.get_line()
		if line.bytes()[0].is_space() {
			panic('line needs to be more than a space')
		}
		if line.len == 0 {
			panic('input needs to be more than enter')
			continue
		}
		mut test_repl := Lexer.Lexer{
			_text: line
			_position: 0
		}
		for {
			current_token := test_repl.next_token()
			println(current_token)
			if current_token.kind == .BadToken {
				break
			}
			if current_token.kind == .EndSentenceToken {
				println('the sentence has ended')
			}
		}		
	}
}
