public enum MultiDimentionalArray<T> {
	case val(T)
	case ary([Self])
}

extension MultiDimentionalArray: Equatable where T: Equatable {}
