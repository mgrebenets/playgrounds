//: [Main](1-main)

import UIKit

/*:
 ## Copy Constructors

 This approach is basically and advanced version of [Transformer Functions](4-transformer-functions).
 
 Instead of creating a transformer function for each property, a so called _Copy Constructor_ (in Swift terms a _conveninece initializer_) is declared. It takes the current version of the model and the list of arguments to be changed.
 
 Each argument is defaulted to `nil` and thanks to Swift syntax we can specify partial list of arguments.
 
 ```
 init(goal: Goal,
     name: String? = nil,
     amount: Double? = nil,
     picture: UIImage?? = nil) {

         self.init(name: name ?? goal.name,
         amount: amount ?? goal.amount,
         picture: picture ?? goal.picture)
 }
 ```

 ## Pros

 The model properties are all declared as `let` and the model is purely immutable.
 
 Compared to [Transformer Functions](4-transformer-functions) we only have one convenience initializer (aka Copy Constructor) that allows us to update multiple properties at the same time.
 
 We delegate to designated initializer in the end.

 ## Cons
 
 We have to use optional-optional types when the orinal propery is already optional.

 Again, just like [Transformer Functions](4-transformer-functions) this approach doesn't solve the problem of incomplete and invalid models, we still have to create an initial version of the model before populating all the values.
 
 We are basically doing something that [Using `var`](2-var) approach already provides, with some extra code that behaves the same way.
 
 See [Using `var`](2-var) for full list of cons.
 
 See [this gist](https://gist.github.com/jarsen/41de7401d49cd2348e5f) for original example.
 */

struct Goal {
    let name: String
    let amount: Double
    let picture: UIImage?

    init(name: String = "", amount: Double = 0, picture: UIImage? = nil) {
        // Can't throw an error here, because we have to create some incomplete version of the model first
        self.name = name
        self.amount = amount
        self.picture = picture
    }

    init(goal: Goal,
         name: String? = nil,
         amount: Double? = nil,
         picture: UIImage?? = nil) {

        self.init(name: name ?? goal.name,
                  amount: amount ?? goal.amount,
                  picture: picture ?? goal.picture)
    }
}

// First incomplete version of the goal
let incompleteGoal = Goal()
print(incompleteGoal)

// Set the name now, still incomplete
let goalWithName = Goal(goal: incompleteGoal, name: "New name")
print(goalWithName)

// Add the picture
// Note how we can skip the amount since all parameters have default values
// The model is incomplete anyways, it has meaningless 0 amount
let goalWithNameAndPicture = Goal(goal: goalWithName, picture: UIImage())
print(goalWithNameAndPicture)

// Final complete and valid version of the goal
let finalGoal = Goal(goal: goalWithNameAndPicture, amount: 100)
print(finalGoal)
