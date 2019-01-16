// Copyright (c) 2018 NUS CS3217. All rights reserved.

import XCTest
@testable import DataStructures

class DepthFirstOrderGeneratorTests: XCTestCase {

    func testCyclicGraph() {
        let graphFileName = "graph_cycle"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "A"),
            ["A", "B", "D", "C"],
            "The DFS for \(graphFileName) is wrong!")
    }

    func testLinkedListGraph() {
        let graphFileName = "graph_linkedlist"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "A"),
            ["A", "B", "C", "D", "E"],
            "The DFS for \(graphFileName) is wrong!")
    }
    
    func testDisjointGraph() {
        let graphFileName = "graph_disjoint"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "A"),
                       ["A", "B", "C"],
                       "The DFS for \(graphFileName) is wrong!")
    }

    func testExampleGraph() {
        let graphFileName = "graph_example"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "A"),
            ["A", "B", "D", "F", "E", "C", "G"],
            "The DFS for \(graphFileName) is wrong!")
    }
    
    func testExampleGraphInvalidStartNode() {
        let graphFileName = "graph_example"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "Z"),
                       [],
                       "The DFS for \(graphFileName) with an invalid start node is not empty!")
    }

    func testEmptyGraph() {
        let graphFileName = "graph_empty"
        XCTAssertEqual(getResultantNodesForGraph(graphFileName, startNode: "A"),
                       [],
                       "The DFS for \(graphFileName) is not empty!")
    }

    private func getResultantNodesForGraph(_ fileName: String, startNode: String) -> [String] {
        // You do not need to modify this function.
        guard let path = Bundle.main.path(forResource: fileName, ofType: "plist") else {
            XCTFail("Path should not be nil.")
            return []
        }
        guard let dictionary = NSDictionary(contentsOfFile: path), let graph = dictionary as? [String: [String]] else {
            XCTFail("Graph should not be nil.")
            return []
        }
        guard let dfsGenerator = DepthFirstOrderGenerator(graph: graph, start: startNode) else {
            return []
        }

        var nodes: [String] = []
        for node in dfsGenerator {
            nodes.append(node as String)
        }
        return nodes
    }
}
