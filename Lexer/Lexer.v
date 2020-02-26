module Lexer

import SyntaxToken

struct Lexer {
pub:
	_text string
	current string
mut:
	_position int
}

fn (lex mut Lexer) next() {
	lex._position ++
}

pub fn (lex &Lexer) next_token() SyntaxToken.SyntaxToken {
	//  <greeting>
	//  hello

	//  if it is a proper greeting (either hello or Hello)
	//  then set the _text to be the total_length - current_length
	//  since this is just hellp, the length will always be 5
	//  can generalize by getting the length of the current
	if isProperGreeting(lex.current) {
		start := lex._current.len
		end := lex._text.len
		text := lex._text[start, end]
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