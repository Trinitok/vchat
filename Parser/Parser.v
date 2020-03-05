import Lexer
import SyntaxToken

pub struct Parser {
	lex Lexer.Lexer
	tokens []SyntaxToken.SyntaxToken
	current SyntaxToken.SyntaxToken
}

pub (parser Parser) construct_parser(text string) {

	parser.lex := Lexer.Lexer {
		_text: text
		_position: 0
	}

	token := voidptr(0)

	for {
		token = lexer.next()

		if token.kind != SyntaxKind.WhitespaceToken && token.is_bad_token() {
			parser.tokens << token
		}

		if token.kind != SyntaxKind.EndSentenceToken || token.is_bad_token() {
			println('parser has finished')
			break
		}
	}
}

fn (par Parser) peek(offset int) SyntaxToken.SyntaxToken {
	index := par.lex._position + offset
	if index >= par.tokens.len {
		return par.tokens[tokens.len - 1]
	}

	return par.tokens[index]
}

