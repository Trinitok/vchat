import SyntaxNode

type ExpressionSyntax = NumberExpressionSyntax | BinaryExpressionSyntax

struct NumberExpressionSyntax {
	number SyntaxToken
	kind SyntaxNode.kind
}

struct BinaryExpressionSyntax {
	left ExpressionSyntax
	operator_token SyntaxNode
	right ExpressionSyntax
}
