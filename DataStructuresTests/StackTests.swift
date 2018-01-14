// Copyright (c) 2018 NUS CS3217. All rights reserved.

import XCTest
@testable import DataStructures

class StackTests: XCTestCase {

    func testPush() {
        var stack = Stack<Int>()
        stack.push(1)

        XCTAssertEqual(stack.toArray(), [1], "The item is not pushed correctly!")
    }

    func testPop() {
        // TODO: Fill in your test code here.
    }

    func testPeek() {
        // TODO: Fill in your test code here.
    }

    func testCount() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        XCTAssertEqual(stack.count, 3, "The stack's length is not correct!");
    }

    func testIsEmpty() {
        // TODO: Fill in your test code here.
    }

    func testRemoveAll() {
        // TODO: Fill in your test code here.
    }

    func testToArray() {
        // TODO: Fill in your test code here.
    }
}
