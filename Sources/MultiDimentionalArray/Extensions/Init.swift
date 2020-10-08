public extension MultiDimentionalArray {
	
	static func from(array: [T]) -> Self {
		.ary(array.map(Self.val))
	}
	
	static func from(values: T...) -> Self {
		.ary(values.map(Self.val))
	}
	
	static func from(elements: Self...) -> Self {
		.ary(elements)
	}
}
