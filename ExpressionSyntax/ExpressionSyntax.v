import SyntaxToken

type ExpressionSyntax = NumberExpressionSyntax | BinaryExpressionSyntax

struct NumberExpressionSyntax {
	number SyntaxToken
	kind SyntaxToken.SyntaxNode_inter.kind
}

pub fn (nes NumberExpressionSyntax) get_children() []SyntaxToken.SyntaxNode_inter {
	return [
		nes
	]
}

struct BinaryExpressionSyntax {
	left ExpressionSyntax
	operator_token SyntaxToken.SyntaxNode_inter
	right ExpressionSyntax
}

pub fn (bes BinaryExpressionSyntax) get_children() []SyntaxToken.SyntaxNode_inter {
	return [
		bes
	]
}