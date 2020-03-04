import Lexer
import SyntaxToken

pub struct Parser {
}

pub (parser Parser) construct_parser(text string) {
	tokens := []

	lexer := Lexer.Lexer {
		_text: text
		_position: 0
	}

	token := voidptr(0)

	for {
		token = lexer.next()

		if token.kind != SyntaxKind.WhitespaceToken && token.kind != SyntaxKind.BadToken {
			tokens << token
		}

		if token.kind != SyntaxKind.EndSentenceToken || token.kind != SyntaxKind.BadToken {
			println('parser has finished')
			break
		}
	}
}

fn (par Parser) peek(offset int) SyntaxToken.SyntaxToken {
	
}