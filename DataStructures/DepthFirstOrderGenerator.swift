// Copyright (c) 2018 NUS CS3217. All rights reserved.

/**
 A generator that returns the nodes in the graph in depth-first search order,
 starting at the given node.

 - Authors: CS3217
 - Date: 2018
 */
struct DepthFirstOrderGenerator<Key: Hashable, Value: Collection>: IteratorProtocol,
    Sequence where Value.Iterator.Element == Key {

    var unvisitedGraph: [Key: Value]
    var stack: Stack<Key>
    
    /// Constructs a `DepthFirstOrderGenerator` with the given graph and start
    /// node.
    /// - Parameters:
    ///   - graph: A dictionary of node to adjacency list pairs.
    ///   - start: The start node.
    init?(graph: [Key: Value], start: Key) {
        if graph[start] == nil {
            return nil
        }
        
        if !GraphUtil.isValid(graph: graph) {
            return nil
        }
        
        self.unvisitedGraph = graph
        
        stack = Stack<Key>()
        stack.push(start)
    }

    func makeIterator() -> DepthFirstOrderGenerator<Key, Value> {
        return self
    }

    mutating func next() -> Key? {
        while let element = stack.pop() {
            /// If the element does not exist in unvisitedGraph, then skip it
            /// as it has already been visited.
            guard let neighbours = unvisitedGraph[element] else {
                continue
            }
            
            /// The neighboring nodes are pushed into the stack in reverse
            /// order to ensure that the neighboring nodes are visited in
            /// the order in which they appear. This is done to conform
            /// with the requirements.
            for neighbour in neighbours.reversed() {
                stack.push(neighbour)
            }
            
            unvisitedGraph.removeValue(forKey: element)
            
            return element
        }
        
        return nil
    }
}
