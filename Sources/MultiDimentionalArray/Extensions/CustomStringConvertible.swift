extension MultiDimentionalArray: CustomStringConvertible {
	
	public var description: String {
		switch self {
		case .val(let v):
			return "\(v)"
		case .ary(let a):
			return "[\(a.map(String.init).joined(separator: ", "))]"
		}
	}
}
