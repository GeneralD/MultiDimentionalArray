public extension MultiDimentionalArray {
	
	static func fromValues(@MultiDimentionalArrayBuilderFromValues<T> _ block: () -> Self) -> Self {
		block()
	}
	
	static func fromElements(@MultiDimentionalArrayBuilderFromElements<T> _ block: () -> Self) -> Self {
		block()
	}
}

@_functionBuilder
public struct MultiDimentionalArrayBuilderFromValues<T> {
	
	public static func buildBlock(_ values: T...) -> MultiDimentionalArray<T> {
		.ary(values.map(MultiDimentionalArray.val))
	}
}

@_functionBuilder
public struct MultiDimentionalArrayBuilderFromElements<T> {
	
	public static func buildBlock(_ elements: MultiDimentionalArray<T>...) -> MultiDimentionalArray<T> {
		.ary(elements)
	}
}
