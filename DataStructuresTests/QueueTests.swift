// Copyright (c) 2018 NUS CS3217. All rights reserved.

import XCTest
@testable import DataStructures

class QueueTests: XCTestCase {

    let testElement1 = "1"
    let testElement2 = "2"

    func testEnqueue() {
        var queue = Queue<String>()
        queue.enqueue("1")

        XCTAssertEqual(queue.toArray(), ["1"], "The item is not enqueued correctly!")
    }

    func testEnqueueNil() {
        var queue = Queue<String?>()
        queue.enqueue(nil)

        XCTAssertEqual(queue.toArray(), [nil], "The element nil is not enqueued correctly!")
    }

    func testDequeue() {
        var queue = Queue<String>()
        XCTAssertNil(queue.dequeue(), "An item is dequeued from an empty queue!")
        queue.enqueue(testElement1)
        queue.enqueue(testElement2)
        XCTAssertEqual(testElement1, queue.dequeue(), "The incorrect item has been dequeued!")
        XCTAssertEqual(testElement2, queue.dequeue(), "The incorrect item has been dequeued!")
        XCTAssertNil(queue.dequeue(), "An item is not dequeued correctly!")
    }

    func testDequeueNil() {
        var queue = Queue<String?>()
        queue.enqueue(nil)

        XCTAssertEqual(queue.dequeue(), Optional(nil), "The element nil is not dequeued correctly!")
    }

    func testPeek() {
        var queue = Queue<String>()
        XCTAssertNil(queue.peek(), "An item was returned by peek on an empty queue!")
        queue.enqueue(testElement1)
        XCTAssertEqual(testElement1, queue.peek(),
                       "An incorrect item was returned by peek on a queue with one element!")
        queue.enqueue(testElement2)
        XCTAssertEqual(testElement1, queue.peek(),
                       "An incorrect item was returned by peek on a queue with two elements!")
        queue.dequeue()
        XCTAssertEqual(testElement2, queue.peek(), "An incorrect item was returned by peek after dequeue!")
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
        queue.enqueue(testElement1)
        XCTAssertFalse(queue.isEmpty, "isEmpty is true for a queue with one item!")
        queue.dequeue()
        XCTAssertTrue(queue.isEmpty, "isEmpty is false for an empty queue after dequeue!")
    }

    func testRemoveAll() {
        var queue = Queue<String>()
        queue.enqueue(testElement1)
        queue.enqueue(testElement2)
        queue.removeAll()
        XCTAssertTrue(queue.isEmpty, "The items in the queue have not been removed correctly!")
    }

    func testToArray() {
        var queue = Queue<String>()
        XCTAssertEqual(queue.toArray(), [], "toArray result is not empty for an empty queue!")
        queue.enqueue(testElement1)
        queue.enqueue(testElement2)
        XCTAssertEqual(queue.toArray(), [testElement1, testElement2],
                       "toArray does not return the correct elements in order!")
    }
}
