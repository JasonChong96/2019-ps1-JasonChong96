CS3217 Problem Set 1
==

**Name:** Jason Chong Yi Sheng

**Matric No:** A0164721J

**Tutor:** Leong Wai Kay

## Instructions for Students

1. Clone this repository to begin working.
2. Do not modify the `AppDelegate.swift`, `LaunchScreen.xib`, `Main.storyboard`, `Images.xcassets` files (you do not have to).
3. Write your answers to non-coding questions in this file (`README.md`).

## Tips

1. CS3217's Gitbook is at https://www.gitbook.com/book/cs3217/problem-sets/details. Do visit the Gitbook often, as it contains all things relevant to CS3217. You can also ask questions related to CS3217 there.
2. Take a look at `.gitignore`. It contains rules that ignores the changes in certain files when committing an Xcode project to revision control. (This is taken from https://github.com/github/gitignore/blob/master/Swift.gitignore).
3. A Swiftlint configuration file is provided for you. It is recommended for you to use Swiftlint and follow this configuration. Keep in mind that, ultimately, this tool is only a guideline; some exceptions may be made as long as code quality is not compromised.
4. Do not burn out. Have fun!

## Problem 1: Swift Collections

If a key does not implement the  `Hashable` protocol, the `Dictionary` would not be able to compute a hash value for keys. Since a `Dictionary` works by finding an associated value based on the hash of the key, not being able to compute a hash value for a given key would prevent `Dictionary` look up from working correctly. In the first place, if a key cannot be hashed, then the `Dictionary` would not know where to store its associated value.

By ensuring that the keys implement the `Hashable`  protocol, `Dictionary` will be able to get the hash value of any key using the methods exposed by the `Hashable` protocol.

## Problem 3: Graph Traversal

## Problem 3.3

Your answer here
