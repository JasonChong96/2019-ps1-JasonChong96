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

## Additional Considerations

A graph with an invalid edge (i.e connected to a node that is not in the graph) is considered invalid and the BFS/DFS 
generators will not be initialized. This behaviour was chosen as passing in as doing this is considered as passing in
an invalid input to the failable initializer which should result in `nil`. This conforms to the behaviour of the
failable initializers as stated in the question for Problem 3.3.

> PS1 Problem 3 Question 3
> > In this problem, failable initializers are implemented for the generators.  `nil` is returned when the input is invalid,


## Problem 3.3

Exceptions are prefered over non-compound special return values such as `nil` when the special values are not
obvious, not consistent or when all return values are legal. Special return values also can't contain information
without having a special return type to store it, which `nil` does not allow. When additional information is not needed 
and `nil` is not a legal return value, `nil` is preferred as exceptions incur additional overhead as compared to just 
using `nil`.

This can be illustrated using the use of `nil` in this problem set.

`nil` can be used in the failable initializer as it is obvious as `nil` is not a legal generator. 

For methods such as `peek()` and `pop()`  which return the element in the `Stack`/`Queue` wrapped in an optional, 
even if the element is `nil` itself, the methods will return it wrapped in an optional instead of just returning `nil` on its 
own. For such methods, the only possible user error is using them on an empty `Queue`/`Stack`, so additional 
information to distinguish between user errors is also not required. Hence, `nil` is not a legal return value in this 
sense and can be used as a special return value here.
