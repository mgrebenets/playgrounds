//: [Main](1-main)

import UIKit

/*:
 ## Non-mutating Mutating Functions
 
 An exotic approach that converts mutating functions to non-mutating version via the magic of currying.

 ## Cons

 Not really a solution, just provided here for additional info. It has all the cons of the [Mutating Functions](3-mutating-functions) approach, with cognitive overhead of generic `nonMutating` function.

 */

func nonMutating <T,U> (f: (inout T) -> U -> Void, _ t: T, _ u: U) -> T {
    var copy = t
    f(&copy)(u)
    return copy
}

let s = "xxx"
let g = nonMutating(String.appendContentsOf, s, "abc")
