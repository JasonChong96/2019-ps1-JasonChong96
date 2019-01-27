// Copyright (c) 2018 NUS CS3217. All rights reserved.

/**
 A generic `Stack` class whose elements are last-in, first-out.

 - Authors: CS3217
 - Date: 2018
 */
public struct Stack<T> {

    private var items: [T] = []

    /// Adds an element to the top of the stack.
    /// - Parameter item: The element to be added to the stack
    public mutating func push(_ item: T) {
        items.append(item)
    }

    /// Removes the element at the top of the stack and return it.
    /// - Returns: element at the top of the stack
    public mutating func pop() -> T? {
        if isEmpty {
            return nil
        }

        return items.removeLast()
    }

    /// Returns, but does not remove, the element at the top of the stack.
    /// - Returns: element at the top of the stack
    public func peek() -> T? {
        return items.last
    }

    /// The number of elements currently in the stack.
    public var count: Int {
        return items.count
    }

    /// Whether the stack is empty.
    public var isEmpty: Bool {
        return items.isEmpty
    }

    /// Removes all elements in the stack.
    public mutating func removeAll() {
        items = []
    }

    /// Returns an array of the elements in their respective pop order, i.e.
    /// first element in the array is the first element to be popped.
    /// - Returns: array of elements in their respective pop order
    public func toArray() -> [T] {
        return items.reversed()
    }
}
