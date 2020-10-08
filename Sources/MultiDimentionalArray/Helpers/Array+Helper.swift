internal extension Array {
	
	var splitted: (head: Element, tail: [Element])? {
		guard let f = first else { return .none }
		return (f, dropFirst().map { $0 })
	}
}
