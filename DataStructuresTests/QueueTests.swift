// Copyright (c) 2018 NUS CS3217. All rights reserved.

import XCTest
@testable import DataStructures

class QueueTests: XCTestCase {

    func testEnqueue() {
        var queue = Queue<String>()
        queue.enqueue("1")

        XCTAssertEqual(queue.toArray(), ["1"], "The item is not enqueued correctly!")
    }

    func testDequeue() {
        // TODO: Fill in your test code here.
    }

    func testPeek() {
        // TODO: Fill in your test code here.
    }

    func testCount() {
        var queue = Queue<String>()
        queue.enqueue("1")
        queue.enqueue("2")
        queue.enqueue("3")
        XCTAssertEqual(queue.count, 3, "The queue's length is not correct!");
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
