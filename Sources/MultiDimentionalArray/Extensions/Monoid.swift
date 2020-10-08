public extension MultiDimentionalArray {
	
	static func + (lhs: Self, rhs: Self) -> Self {
		switch (lhs, rhs) {
		case (.ary(let a), .ary(let b)):
			return .ary(a + b)
		case (_, .val(_)):
			return lhs + .ary([rhs])
		case (.val(_), _):
			return .ary([lhs]) + rhs
		}
	}
	
	static var empty: Self {
		.ary([])
	}
}
