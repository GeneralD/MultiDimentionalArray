extension MultiDimentionalArray: Collection {
	
	public func index(after i: Int) -> Int {
		i + 1
	}
	
	public var startIndex: Int {
		0
	}
	
	public var endIndex: Int {
		count
	}
}
