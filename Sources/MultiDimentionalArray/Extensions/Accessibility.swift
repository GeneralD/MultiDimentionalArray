public extension MultiDimentionalArray {
	
	subscript(_ index: Int) -> Self {
		self[safe: index]!
	}

	subscript(_ indices: [Int]) -> Self {
		self[safe: indices]!
	}

	subscript(safe index: Int) -> Self? {
		self[safe: [index]]
	}

	subscript(safe indices: [Int]) -> Self? {
		switch (self, indices.splitted) {
		case (.ary(let a), .some(let t)):
			return a[t.head][safe: t.tail]
		case (_, .none):
			return self
		default:
			return .none
		}
	}

	subscript(_ indices: Int...) -> Self {
		self[indices]
	}

	subscript(safe indices: Int...) -> Self? {
		self[safe: indices]
	}
}

extension MultiDimentionalArray: RandomAccessCollection {}
