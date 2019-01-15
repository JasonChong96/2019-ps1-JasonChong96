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
    init?(graph unvisitedGraph: [Key: Value], start: Key) {
        if unvisitedGraph[start] == nil {
            return nil
        }
        
        self.unvisitedGraph = unvisitedGraph
        
        stack = Stack<Key>()
        stack.push(start)
    }

    func makeIterator() -> DepthFirstOrderGenerator<Key, Value> {
        return self
    }

    mutating func next() -> Key? {
        while let element = stack.pop() {
            guard let neighbors = unvisitedGraph[element] else {
                continue
            }
            
            for neighbor in neighbors.reversed() {
                stack.push(neighbor)
            }
            
            unvisitedGraph.removeValue(forKey: element)
            
            return element
        }
        
        return nil
    }
}
