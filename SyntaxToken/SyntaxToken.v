module SyntaxToken

pub interface SyntaxNodeInter {
	get_children() []SyntaxNodeInter
}

pub struct SyntaxToken {
pub:
	kind SyntaxKind
	position int
	text string
	value string
}

pub enum SyntaxKind {
	zero
	one
	two
	three
	greeting_token
	NumberToken
	WhitespaceToken
	EndSentenceToken
	BadToken
}

pub fn (st SyntaxToken) get_children() []SyntaxNodeInter {
	return []
}

fn (st SyntaxToken) get_kind() SyntaxKind {
	return st.kind
}

//  toString function for syntax kind
pub fn (sk SyntaxKind) str() string {
	return match sk {
		.zero {
			'zero'
		}
		.one {
			'one'
		}
		.two {
			'two'
		}
		.three {
			'three'
		}
		.greeting_token {
			'greeting token'
		}
		.NumberToken {
			'NumberToken'
		}
		.WhitespaceToken {
			'white space'
		}
		.EndSentenceToken {
			'end of sentence'
		}
		.BadToken {
			'bad token'
		}
		else{
			'unknown'
		}
	}
}

pub fn (st SyntaxToken) str() string {
	kind := st.kind.str()

	mut ret_str := 'SyntaxToken { '
	ret_str += kind
	ret_str = ret_str + ' ' + st.position.str() + ' ' + st.text + ' }'
	return ret_str
}

pub fn (st SyntaxToken) is_bad_token() bool {
	return st.kind == .BadToken
}

