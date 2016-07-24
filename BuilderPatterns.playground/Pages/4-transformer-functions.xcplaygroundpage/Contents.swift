//: [Main](1-main)

import UIKit

/*:
 ## Transformer Functions
 
 Instead of [Mutating Functions](3-mutating-functions) we use non-mutating functions that return a new version of the model.
 
 ```
 func update(name: String) -> Goal {
    return Goal(name: name, amount: self.amount, image: self.image)
 }
 ```
 
 ## Pros
 
 The model properties are all declared as `let` and the model is purely immutable.
 
 ## Cons
 
 This approach doesn't really solve the original problem. We have to create some initial version of the model, which we can then transform.
 
 So all the same cons for incomplete and invalid model due to default values apply in this case too. See [Using `var`](2-var) for more details.
 
 Additionally we have to create tranformer function for each single property we need to mutate.
 
 See [this link](https://www.andrewcbancroft.com/2015/01/06/immutable-types-changing-state-swift/) for the original concept.
 */