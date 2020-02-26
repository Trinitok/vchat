module Lexer

import SyntaxToken

struct Lexer {
	_text string
	current string
mut:
	_position int
}

fn (lex mut Lexer) next() {
	lex._position ++
}

pub fn (lex Lexer) next_token() SyntaxToken.SyntaxToken {
	//  <greeting>
	//  hello

	if isProperGreeting(lex.current) {

	}
	

	return SyntaxToken.SyntaxToken{
		kind : SyntaxToken.SyntaxKind.zero
		position: 0
		text: 'random text' 
	}
}

fn isProperGreeting(currentToken string) bool{
	return match currentToken {
		'hello' {
			true
		}
		'Hello' {
			true
		}
		else {
			false
		}
	}
}

fn isDigit(currentToken string) bool{
	return match currentToken {
		'0' {
			true
		}
		'1' {
			true
		}
		'2' {
			true
		}
		'3' {
			true
		}
		'4' {
			true
		}
		'5' {
			true
		}
		'6' {
			true
		}
		'7' {
			true
		}
		'8' {
			true
		}
		'9' {
			true
		}
		else {
			false
		}
	}
}