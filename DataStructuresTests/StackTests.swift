// Copyright (c) 2018 NUS CS3217. All rights reserved.

import XCTest
@testable import DataStructures

class StackTests: XCTestCase {

    let testElement1 = 1
    let testElement2 = 2

    func testPush() {
        var stack = Stack<Int>()
        stack.push(1)

        XCTAssertEqual(stack.toArray(), [1], "The item is not pushed correctly!")
    }

    func testPushNil() {
        var queue = Queue<Int?>()
        queue.enqueue(nil)

        XCTAssertEqual(queue.toArray(), [nil], "The element nil is not pushed correctly!")
    }

    func testPop() {
        var stack = Stack<Int>()
        XCTAssertNil(stack.pop(), "An item has been popped from an empty stack!")
        stack.push(testElement1)
        stack.push(testElement2)
        XCTAssertEqual(testElement2, stack.pop(), "The incorrect item is popped!")
        XCTAssertEqual(testElement1, stack.pop(), "The incorrect item is popped!")
        XCTAssertNil(stack.pop(), "An item is not popped correctly!")
    }

    func testPopNil() {
        var queue = Queue<Int?>()
        queue.enqueue(nil)

        XCTAssertEqual(queue.dequeue(), Optional(nil), "The element nil is not popped correctly!")
    }

    func testPeek() {
        var stack = Stack<Int>()
        XCTAssertNil(stack.pop(), "An item was returned by peek on an empty stack!")
        stack.push(testElement1)
        XCTAssertEqual(testElement1, stack.peek(),
                       "An incorrect item was returned by peek on a stack with one element!")
        stack.push(testElement2)
        XCTAssertEqual(testElement2, stack.peek(),
                       "An incorrect item was returned by peek on a stack with two elements!")
        stack.pop()
        XCTAssertEqual(testElement1, stack.peek(), "An incorrect item was returned by peek after pop!")    }

    func testCount() {
        var stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.push(3)
        XCTAssertEqual(stack.count, 3, "The stack's length is not correct!")
    }

    func testIsEmpty() {
        var stack = Stack<Int>()
        XCTAssertTrue(stack.isEmpty, "isEmpty is false for an empty stack!")
        stack.push(testElement1)
        XCTAssertFalse(stack.isEmpty, "isEmpty is true for a stack with one item!")
        stack.pop()
        XCTAssertTrue(stack.isEmpty, "isEmpty is false for an empty stack after pop!")
    }

    func testRemoveAll() {
        var stack = Stack<Int>()
        stack.push(testElement1)
        stack.push(testElement2)
        stack.removeAll()
        XCTAssertTrue(stack.isEmpty, "The items in the stack have not been removed correctly!")
    }

    func testToArray() {
        var stack = Stack<Int>()
        XCTAssertEqual(stack.toArray(), [], "toArray result is not empty for an empty stack!")
        stack.push(testElement1)
        stack.push(testElement2)
        XCTAssertEqual(stack.toArray(), [testElement2, testElement1],
                       "toArray does not return the correct elements in order!")
    }
}
