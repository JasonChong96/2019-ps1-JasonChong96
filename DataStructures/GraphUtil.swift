//
//  GraphUtil.swift
//  DataStructures
//
//  Created by Jason Chong on 16/1/19.
//  Copyright © 2019 NUS CS3217. All rights reserved.
//

/**
 A class containing utility methods for graph processing.
 
 - Authors: Jason Chong
 - Date: 2019
 */
class GraphUtil<Key: Hashable, Value: Collection> where Value.Iterator.Element == Key {
    
    /// Checks if a given graph is valid. i.e does not have non-existant nodes in any
    /// adjacency lists.
    /// - Parameters:
    ///   - graph: A dictionary of node to adjacency list pairs.
    static func isValid(graph: [Key: Value]) -> Bool {
        for (_, neighbours) in graph {
            for neighbour in neighbours {
                /// If a node has a neighbour that does not exist in the graph,
                /// then the graph is invalid.
                if graph[neighbour] == nil {
                    return false
                }
            }
        }
        return true
    }
}
