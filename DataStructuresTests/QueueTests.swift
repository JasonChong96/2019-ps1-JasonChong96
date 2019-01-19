// Copyright (c) 2018 NUS CS3217. All rights reserved.

import XCTest
@testable import DataStructures

class QueueTests: XCTestCase {

    let one = "1"
    let two = "2"

    func testEnqueue() {
        var queue = Queue<String>()
        queue.enqueue("1")

        XCTAssertEqual(queue.toArray(), ["1"], "The item is not enqueued correctly!")
    }

    func testDequeue() {
        var queue = Queue<String>()
        XCTAssertNil(queue.dequeue(), "An item is dequeued from an empty queue!")
        queue.enqueue(one)
        queue.enqueue(two)
        XCTAssertEqual(one, queue.dequeue(), "The incorrect item has been dequeued!")
        XCTAssertEqual(two, queue.dequeue(), "The incorrect item has been dequeued!")
        XCTAssertNil(queue.dequeue(), "An item is not dequeued correctly!")
    }

    func testPeek() {
        var queue = Queue<String>()
        XCTAssertNil(queue.peek(), "An item was returned by peek on an empty queue!")
        queue.enqueue(one)
        XCTAssertEqual(one, queue.peek(), "An incorrect item was returned by peek on a queue with one element!")
        queue.enqueue(two)
        XCTAssertEqual(one, queue.peek(), "An incorrect item was returned by peek on a queue with two elements!")
        queue.dequeue()
        XCTAssertEqual(two, queue.peek(), "An incorrect item was returned by peek after dequeue!")
    }

    func testCount() {
        var queue = Queue<String>()
        queue.enqueue("1")
        queue.enqueue("2")
        queue.enqueue("3")
        XCTAssertEqual(queue.count, 3, "The queue's length is not correct!")
    }

    func testIsEmpty() {
        var queue = Queue<String>()
        XCTAssertTrue(queue.isEmpty, "isEmpty is false for an empty queue!")
        queue.enqueue(one)
        XCTAssertFalse(queue.isEmpty, "isEmpty is true for a queue with one item!")
        queue.dequeue()
        XCTAssertTrue(queue.isEmpty, "isEmpty is false for an empty queue after dequeue!")
    }

    func testRemoveAll() {
        var queue = Queue<String>()
        queue.enqueue(one)
        queue.enqueue(two)
        queue.removeAll()
        XCTAssertTrue(queue.isEmpty, "The items in the queue have not been removed correctly!")
    }

    func testToArray() {
        var queue = Queue<String>()
        XCTAssertEqual(queue.toArray(), [], "toArray result is not empty for an empty queue!")
        queue.enqueue(one)
        queue.enqueue(two)
        XCTAssertEqual(queue.toArray(), [one, two], "toArray does not return the correct elements in order!")
    }
}
