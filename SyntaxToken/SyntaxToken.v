module SyntaxToken

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
	NumberToken
	WhitespaceToken
	EndSentenceToken
}

fn get_kind() SyntaxKind {
	return .one
}

pub fn (st SyntaxToken) str() string {
	kind := match st.kind {
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
		else{
			'unknown'
		}
	}

	mut ret_str := 'SyntaxToken { '
	ret_str += kind
	ret_str = ret_str + ' ' + st.position.str() + ' ' + st.text + ' }'
	return ret_str
}