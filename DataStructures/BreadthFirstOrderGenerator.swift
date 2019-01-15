// Copyright (c) 2018 NUS CS3217. All rights reserved.

/**
 A generator that returns the nodes in the graph in breadth-first search order,
 starting at the given node.

 - Authors: CS3217
 - Date: 2018
 */
struct BreadthFirstOrderGenerator<Key: Hashable, Value: Collection>: IteratorProtocol,
    Sequence where Value.Iterator.Element == Key {
    
    var unvisitedGraph: [Key: Value]
    var queue: Queue<Key>

    /// Constructs a `BreadthFirstOrderGenerator` with the given graph and start
    /// node.
    /// - Parameters:
    ///   - graph: A dictionary of node to adjacency list pairs.
    ///   - start: The start node.
    init?(graph unvisitedGraph: [Key: Value], start: Key) {
        if unvisitedGraph[start] == nil {
            return nil
        }
        
        self.unvisitedGraph = unvisitedGraph

        queue = Queue<Key>()
        queue.enqueue(start)
    }

    func makeIterator() -> BreadthFirstOrderGenerator<Key, Value> {
        return self
    }

    mutating func next() -> Key? {
        while let element = queue.dequeue() {
            guard let neighbors = unvisitedGraph[element] else {
                continue
            }
            
            for neighbor in neighbors {
                queue.enqueue(neighbor)
            }
            
            unvisitedGraph.removeValue(forKey: element)
            
            return element
        }
        
        return nil
    }
}
