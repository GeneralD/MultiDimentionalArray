# MultiDimentionalArray

Swift Package Manager library implementing a recursively nested array type:
`enum MultiDimentionalArray<T> { case val(T); case ary([Self]) }` — a tree-like
container of arbitrary depth with functional extensions.

## Stack

- Swift 5.3 (swift-tools-version 5.3), pure SPM library, no dependencies
- Uses the pre-Swift-5.4 `@_functionBuilder` attribute (DSL builders
  `fromValues` / `fromElements`) — modern toolchains expect `@resultBuilder`

## Status

Legacy personal experiment (last commit Nov 2020). Not published to any registry.
No LICENSE file.

## Layout

- `Sources/MultiDimentionalArray/MultiDimentionalArray.swift` — core enum
- `Sources/MultiDimentionalArray/Extensions/` — Functional (map/flatMap),
  Monoid, Collection conformance, subscript access, function builders, init helpers
- `Tests/MultiDimentionalArrayTests/` — XCTest suite

## Build / Test

- `swift build` / `swift test` (may warn or fail on `@_functionBuilder`
  with recent Swift toolchains; works on Swift 5.3-era tools)
