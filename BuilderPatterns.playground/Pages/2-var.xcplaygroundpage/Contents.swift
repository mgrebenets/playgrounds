//: [Main](1-main)

import UIKit

/*:
 ## Using `var`s


 The model is modelling some real world object or abstraction. If the object is supposed to be mutated over time, then the model just mimics this behavior with help of variables.

 For example, if the _Goal_ can be edited, e.g. renamed or assigned a new picture, then the `Goal` structure reflects this behavior by using `var`.



 ```
 var name: String
 var amount: Double
 var picture: UIImage?
 ```

 ## Pros

 We still get the immutability behavior. An instance of `Goal` mutated in one view controller will not change another instance owned by other view controller or manager. That's because `Goal` is a value type (`struct`).

 It's easy to pass incomplete model between view controllers and let them populate it by just setting new value to a variable.

 ```
 // View controller 1
 if let name = nameLabel.text where !name.characters.isEmpty {
    goal.name = name
 }

 // View controller 2
 if let amountText = amountLabel.text,
 amount = Double(amountText) where amount > 0 {
    goal.amount = Double(amount)
 }
 ```

 _Note how view controllers are doing extensive validation_

 ## Cons

 *Incomplete and Invalid model*

 We have to provide default values for all properties of the models, which often make no sense.

 - The goal with no name makes no sense, it should not exist.
 - The goal with `0` or negative amount makes no sense and should not be created.

 We create the possibility for the whole class of bugs where incomplete and thus invalid models are created and have to be validated at some point in multiple places.

 - The view controllers may have to validate user input as shown in example above. This means each app using the model has to handle the validity of input in each view controller. Something that could be solved in the model layer in the first place.

 - The managers, if they exist, have to validate the model when it's added or updated.

 - The model could provide validation methods, but there's no way to force the client apps to call those methods.

 When the model is immutable by design, all the values provided to initializer can be validated at the moment of initialization, preventing whole class of bugs.

 */

struct Goal {
    enum GoalError: Error {
        case invalidName
        case invalidAmount
    }

    var name: String {
        didSet {
            if name.characters.isEmpty {
                // Can't throw an error here any more
            }
        }
    }

    var amount: Double {
        didSet {
            if amount < 0 {
                // Can't throw an error here any more
            }
        }
    }

    var picture: UIImage?

    init(name: String = "", amount: Double = 0, picture: UIImage? = nil) {
        // Can't validate the model here any more

        self.name = name
        self.amount = amount
        self.picture = picture
    }
}

var goal = Goal()
print(goal.name)    // It's empty
goal.amount = -100  // This doesn't make any sense
print(goal.amount)

