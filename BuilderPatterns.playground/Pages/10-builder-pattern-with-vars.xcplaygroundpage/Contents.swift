//: [Main](1-main)

import UIKit

/*:
 ## Builder Pattern with `var`s
 
 This is the same approach as the basic Builder Pattern.
 
 However, in this case, the builder exposes all of its properties as public `var`s, which removes the need for custom setters.

 ```
 public class Builder {
     public var name: String
     public var amount: Double
     public var picture: UIImage?
 }

 ```
 
 Pretty much it's a direct mirror of the original model.
 
 It is similar to [Payload Objects](6-payload-objects) approach, though the payload object is nothing but an original modle class with different name and all properties declared as `var`s.

 ## Pros

 Less code, since there's no need to create setters any more.

 ## Cons
 
 Non-fluent interface, so chaining is not possible.
 
 A non-idiomatic way to implement Builder pattern. As noted earlier, Builder is not about one-to-one match between properties and building blocks, it's more flexible than that. One building block can set multiple properties and perform additional tasks, e.g. parsing the input.

 */

let goalBuilder = GoalWithVarBuilder.Builder()

// View controller 1
goalBuilder.name = "XBOX"

// Try to create incomplete model
do {
    let goal = try goalBuilder.build()
    print(goal)
} catch let error {
    // As expected the error is thrown
    print(error)
}

// View controller 2
goalBuilder.amount = 100
goalBuilder.picture = UIImage()

// View controller 2 get builder from view controller 1

// Now try to create complete model
do {
    let goal = try goalBuilder.build()
    print(goal)
} catch let error {
    print(error)
}
