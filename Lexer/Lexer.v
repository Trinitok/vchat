module Lexer

import SyntaxToken

pub struct Lexer {
pub:
	_text string
mut:
	_position int
}

fn (lex mut Lexer) next() {
	lex._position ++
}

fn (lex mut Lexer) get_current() string {
	if lex._position >= lex._text.len {
		return '.'
	}
	return lex._text[lex._position].str()
}

pub fn (lex mut Lexer.Lexer) next_token() SyntaxToken.SyntaxToken {
	//  <greeting>
	//  hello

	//  if it is a proper greeting (either hello or Hello)
	//  then set the _text to be the total_length - current_length
	//  since this is just hellp, the length will always be 5
	//  can generalize by getting the length of the current
	if is_proper_greeting(mut lex) {
		start := lex._position
		end := lex._text.len
		text := lex._text[start..end]
		return SyntaxToken.SyntaxToken{
			kind: .greeting_token 
			position: start
			text: text
			value: 'value'
		}
	}

	if lex.get_current().bytes()[0].is_space() {
		start := lex._position
		end := lex._text.len
		text := lex._text[start..end]
		lex.next()
		return SyntaxToken.SyntaxToken{
			kind: .WhitespaceToken 
			position: start 
			text: text
			value: ' '
		}
	}
	
	if is_end_sentence(mut lex) {
		start := lex._position
		end := lex._text.len
		text := lex._text[start..end]
		return SyntaxToken.SyntaxToken{
			kind: .EndSentenceToken 
			position: start 
			text: 'eos'
		}
	}

	return SyntaxToken.SyntaxToken{
		kind : .BadToken
		position: lex._position ++
	}
}

//todo put this in an array for optimization
fn is_proper_greeting(lex mut Lexer) bool{
	greeting_arr := ['hello']
	greeting_end_pos := lex._position + 5
	if greeting_end_pos > lex._text.len {
		return false
	}
	current_greeting := lex._text[lex._position..greeting_end_pos]
	// if lex.get_current().to_lower().contains('h') {
	// 	lex.next()
	// }
	// if lex.get_current().to_lower().contains('e') {
	// 	lex.next()
	// }
	// if lex.get_current().to_lower().contains('l') {
	// 	lex.next()
	// }
	// if lex.get_current().to_lower().contains('l') {
	// 	lex.next()
	// }
	// if lex.get_current().to_lower().contains('o') {
	// 	lex.next()
	// 	return true
	// }
	if current_greeting in greeting_arr {
		lex._position += 5
		return true
	}
	return false
}

//todo put this in an array for optimization
fn is_end_sentence(lex mut &Lexer) bool{
	lex.next()
	end_sentence_chars := ['.', '!', '?']
	current_token := lex.get_current()
	return current_token in end_sentence_chars
	
}