public extension MultiDimentionalArray {
	
	var count: Int {
		switch self {
		case .val(_):
			return 1
		case .ary(let a):
			return a.count
		}
	}
	
	var flatCount: Int {
		switch self {
		case .val(_):
			return 1
		case .ary(let a):
			return a.map(\.flatCount).reduce(0, +)
		}
	}
	
	var depth: Int {
		switch self {
		case .val(_):
			return 0
		case .ary(let a):
			return (a.map(\.depth).max() ?? 0) + 1
		}
	}
	
	var flatten: Self {
		flatMap(Self.val)
	}
	
	var flattenArray: [T] {
		flatten.map { [$0] }.reduce([], +)
	}
}
