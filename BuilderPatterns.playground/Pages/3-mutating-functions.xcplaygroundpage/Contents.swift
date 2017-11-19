//: [Main](1-main)

import UIKit

/*:
 ## Mutating Functions
 
 Use mutating functions to update model values.

 ```
 mutating func update(name: String) throws {
    guard !name.characters.isEmpty else { throw Error.invalidName }
    self.name = name
 }
 ```

 ## Pros
 
 Nothing that [Using `var`](2-var) approach doesn't offer already, except for the fact that we can validate the input and throw errors.
 
 ## Cons
 
 To be able to mutate a property, e.g. `name`, it has to be declared as `var` anyway.
 
 ```
 var name: String
 ```

 So mutating function which mutates just the single property doesn't make any sense at all, it's basically a custom version of setter.
 
 All the cons of the pure `var` approach still apply. See [Using `var`](2-var) for details.
 */
