public extension MultiDimentionalArray {
	
	func map<U>(_ transform: (T) throws -> U) rethrows -> MultiDimentionalArray<U> {
		switch self {
		case .val(let v):
			return try .val(transform(v))
		case .ary(let a):
			return try .ary(a.map { try $0.map(transform) })
		}
	}
	
	func flatMap<U>(_ transform: (T) throws -> MultiDimentionalArray<U>) rethrows -> MultiDimentionalArray<U> {
		switch self {
		case .val(let v):
			return try transform(v)
		case .ary(let a):
			return try a
				.map { try $0.flatMap(transform) }
				.reduce(.empty, +)
		}
	}
	
	func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, T) throws -> Result) rethrows -> Result {
		switch self {
		case .val(let v):
			return try nextPartialResult(initialResult, v)
		case .ary(let a):
			return try a.reduce(initialResult) { accum, next in
				try next.reduce(accum, nextPartialResult)
			}
		}
	}
	
	func filter(_ predicate: (T) throws -> Bool) rethrows -> Self {
		switch self {
		case .val(_):
			return self
		case .ary(let a):
			return try a.reduce(.empty) { accum, next in
				switch next {
				case .val(let v):
					return try predicate(v) ? accum + .from(elements: next) : accum
				case .ary(_):
					return try accum + MultiDimentionalArray<T>.ary([next.filter(predicate)])
				}
			}
		}
	}
}
