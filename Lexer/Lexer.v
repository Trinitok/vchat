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

pub fn next_token() SyntaxToken.SyntaxToken {
	//  <greeting>
	//  hello

	// if 

	return SyntaxToken.SyntaxToken{
		kind : SyntaxToken.SyntaxKind.zero
		position: 0
		text: 'penis' 
	}
}