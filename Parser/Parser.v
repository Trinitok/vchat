import Lexer
import SyntaxToken
import ExpressionSyntax

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

fn (par Parser) next_token() SyntaxToken {

}

pub fn (par Parser) parse() ExpressionSyntax {
	left := prase_primary_expression()
	ok_tokens := [SyntaxKind.greeting_token, SyntaxKind.WhitespaceToken]
	while current.kind in ok_tokens {
		operator_token := par.next_token()
		right := prase_primary_expression()
		left = ExpressionSyntax.BinaryExpressionSyntax {
			left: left
			operator_token: operator_token
			right: right
		}
	}

	return left
}

fn (par Parser) match(kind SyntaxToken.SyntaxKind) SyntaxToken.SyntaxToken {
	if par.current == kind {
		return par.next_token()
	}

	return SyntaxToken.SyntaxToken {
		kind: kind
		position: par.current.position
		text: none
		value: none
	}
}

fn (par Parser) prase_primary_expression() ExpressionSyntax {
	number_token := par.match(SyntaxToken.SyntaxKind.NumberToken)

	return ExpressionSyntax.NumberExpressionSyntax {
		number: number_token
		kind: number_token.kind
	}
}