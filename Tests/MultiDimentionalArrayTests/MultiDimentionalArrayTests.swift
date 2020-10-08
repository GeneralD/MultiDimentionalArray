import XCTest
@testable import MultiDimentionalArray

final class MultiDimentionalArrayTests: XCTestCase {
	
	let a: MultiDimentionalArray<Int> = .ary([.val(1), .val(2), .ary([.val(3), .val(4), .ary([.val(5), .val(6), .ary([]), .val(7)])]), .val(8)])
	let b: MultiDimentionalArray<String> = .from(elements: .from(values: "apple", "banana"), .from(elements: .from(values: "gorilla", "ziraph")), .val("gorilla-gorilla-gorilla"))
	let c: MultiDimentionalArray<String> = .val("zebra")
	
	func testInit() {
		let base: MultiDimentionalArray<Int> = .ary([.val(1), .val(2), .val(3)])
		XCTAssertEqual(base, .from(array: [1, 2, 3]))
		XCTAssertEqual(base, .from(elements: .val(1), .val(2), .val(3)))
		XCTAssertEqual(base, .from(values: 1, 2, 3))
	}
	
	func testDescription() {
		XCTAssertEqual(a.description, "[1, 2, [3, 4, [5, 6, [], 7]], 8]")
	}
	
	func testMap() {
		XCTAssertEqual(a.map { $0 * 2 }, .ary([.val(2), .val(4), .ary([.val(6), .val(8), .ary([.val(10), .val(12), .ary([]), .val(14)])]), .val(16)]))
	}
	
	func testFlatMap() {
		XCTAssertEqual(a.flatMap { .from(elements: .val($0), .val($0 * 2)) }, .from(values: 1, 2, 2, 4, 3, 6, 4, 8, 5, 10, 6, 12, 7, 14, 8, 16))
		XCTAssertEqual(a.flatMap { .ary([.ary([.val($0), .val($0 * 2)])]) }, .from(elements: .from(values: 1, 2), .from(values: 2, 4), .from(values: 3, 6), .from(values: 4, 8), .from(values: 5, 10), .from(values: 6, 12), .from(values: 7, 14), .from(values: 8, 16)))
	}
	
	func testFlatten() {
		XCTAssertEqual(a.flatten, .from(values: 1, 2, 3, 4, 5, 6, 7, 8))
	}
	
	func testReduce() {
		XCTAssertEqual(MultiDimentionalArray.val(10).reduce(5, +), 15)
		XCTAssertEqual(a.reduce(0, +), 36)
	}
	
	func testFilter() {
		XCTAssertEqual(a.filter { $0 % 2 == 1 }, .from(elements: .val(1), .from(elements: .val(3), .from(elements: .val(5), .empty, .val(7)))))
		XCTAssertEqual(b.filter { $0.contains("a") }, b)
		XCTAssertEqual(b.filter { $0.count > 5 }, .from(elements: .from(values: "banana"), .from(elements: .from(values: "gorilla", "ziraph")), .val("gorilla-gorilla-gorilla")))
	}
	
	func testCount() {
		XCTAssertEqual(a.count, 4)
	}
	
	func testFlatCount() {
		XCTAssertEqual(a.flatCount, 8)
	}
	
	func testDepth() {
		XCTAssertEqual(a.depth, 4)
		XCTAssertEqual(MultiDimentionalArray<Int>.ary([.ary([])]).depth, 2)
	}
	
	func testIndexAccess() {
		XCTAssertEqual(b[1, 0, 1], .val("ziraph"))
		XCTAssertEqual(b[safe: 1, 0, 1], .some(.val("ziraph")))
		XCTAssertEqual(b[[1, 0, 1]], .val("ziraph"))
		XCTAssertEqual(b[safe: [1, 0, 1]], .some(.val("ziraph")))
		XCTAssertEqual(b[1][0][1], .val("ziraph"))
		XCTAssertEqual(b[safe: 1]?[safe: 0]?[safe: 1], .some(.val("ziraph")))
	}
	
	func testEquatable() {
		XCTAssertTrue(a == a)
		XCTAssertFalse(b == (b + b))
	}
}
