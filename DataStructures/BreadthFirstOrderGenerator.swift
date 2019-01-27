// Copyright (c) 2018 NUS CS3217. All rights reserved.

/**
 A generator that returns the nodes in the graph in breadth-first search order,
 starting at the given node.

 - Authors: CS3217
 - Date: 2018
 */
public struct BreadthFirstOrderGenerator<Key: Hashable, Value: Collection>: IteratorProtocol,
    Sequence where Value.Iterator.Element == Key {

    var unvisitedGraph: [Key: Value]
    var queue: Queue<Key>

    /// Constructs a `BreadthFirstOrderGenerator` with the given graph and start
    /// node.
    /// - Parameters:
    ///   - graph: A dictionary of node to adjacency list pairs.
    ///   - start: The start node.
    public init?(graph: [Key: Value], start: Key) {
        if graph[start] == nil {
            return nil
        }

        if !GraphUtil.isValid(graph: graph) {
            return nil
        }

        self.unvisitedGraph = graph

        queue = Queue<Key>()
        queue.enqueue(start)
    }

    public func makeIterator() -> BreadthFirstOrderGenerator<Key, Value> {
        return self
    }

    public mutating func next() -> Key? {
        while let element = queue.dequeue() {
            /// If the element does not exist in unvisitedGraph, then skip it
            /// as it has already been visited.
            guard let neighbours = unvisitedGraph[element] else {
                continue
            }

            for neighbour in neighbours {
                queue.enqueue(neighbour)
            }

            unvisitedGraph.removeValue(forKey: element)

            return element
        }

        return nil
    }
}
