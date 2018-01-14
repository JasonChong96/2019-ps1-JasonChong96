// Copyright (c) 2018 NUS CS3217. All rights reserved.

/**
 A generator that returns the nodes in the graph in breadth-first search order,
 starting at the given node.

 - Authors: CS3217
 - Date: 2018
 */
struct BreadthFirstOrderGenerator<Key: Hashable, Value: Collection>: IteratorProtocol,
    Sequence where Value.Iterator.Element == Key {

    /// Constructs a `BreadthFirstOrderGenerator` with the given graph and start
    /// node.
    /// - Parameters:
    ///   - graph: A dictionary of node to adjacency list pairs.
    ///   - start: The start node.
    init?(graph: [Key: Value], start: Key) {
    }

    func makeIterator() -> BreadthFirstOrderGenerator<Key, Value> {
        return self
    }

    mutating func next() -> Key? {
        // TODO: Replace/remove the following line in your implementation.
        return nil
    }
}
