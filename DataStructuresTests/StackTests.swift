// Copyright (c) 2018 NUS CS3217. All rights reserved.

import XCTest
@testable import DataStructures

class StackTests: XCTestCase {
    
    let one = 1
    let two = 2

    func testPush() {
        var stack = Stack<Int>()
        stack.push(1)

        XCTAssertEqual(stack.toArray(), [1], "The item is not pushed correctly!")
    }

    func testPop() {
        var stack = Stack<Int>()
        XCTAssertNil(stack.pop(), "An item has been popped from an empty stack!")
        stack.push(one)
        stack.push(two)
        XCTAssertEqual(two, stack.pop(), "The incorrect item is popped!")
        XCTAssertEqual(one, stack.pop(), "The incorrect item is popped!")
        XCTAssertNil(stack.pop(), "An item is not popped correctly!")
    }

    func testPeek() {
        var stack = Stack<Int>()
        XCTAssertNil(stack.pop(), "An item was returned by peek on an empty stack!")
        stack.push(one)
        XCTAssertEqual(one, stack.peek(), "An incorrect item was returned by peek on a stack with one element!")
        stack.push(two)
        XCTAssertEqual(two, stack.peek(), "An incorrect item was returned by peek on a stack with two elements!")
        stack.pop()
        XCTAssertEqual(one, stack.peek(), "An incorrect item was returned by peek after pop!")    }

    func testCount() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        XCTAssertEqual(stack.count, 3, "The stack's length is not correct!");
    }

    func testIsEmpty() {
        var stack = Stack<Int>()
        XCTAssertTrue(stack.isEmpty, "isEmpty is false for an empty stack!")
        stack.push(one)
        XCTAssertFalse(stack.isEmpty, "isEmpty is true for a stack with one item!")
        stack.pop()
        XCTAssertTrue(stack.isEmpty, "isEmpty is false for an empty stack after pop!")
    }

    func testRemoveAll() {
        var stack = Stack<Int>()
        stack.push(one)
        stack.push(two)
        stack.removeAll()
        XCTAssertTrue(stack.isEmpty, "The items in the stack have not been removed correctly!")
    }

    func testToArray() {
        var stack = Stack<Int>()
        XCTAssertEqual(stack.toArray(), [], "toArray result is not empty for an empty stack!")
        stack.push(one)
        stack.push(two)
        XCTAssertEqual(stack.toArray(), [two, one], "toArray does not return the correct elements in order!")
    }
}
