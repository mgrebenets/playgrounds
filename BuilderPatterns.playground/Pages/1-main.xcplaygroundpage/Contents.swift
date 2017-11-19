
import UIKit

/*:
 ## The Problem
 
 How to we create an instance of the immutable model when properties are provided from more than source at different moments of time?
 
 For example:
 
 Goal has 3 properties:
 
 - Name (mandatory)
 - Amount (mandatory)
 - Picture (optional)
 
 ```
 struct Goal {
    let name: String
    let amount: Double
    let picture: UIImage?
 }
 ```
 
 - View controller 1 provides the name
 - View controller 2 provides the amount
 - View controller 3 provides the picture
 
 ![The Problem](Problem.jpg)
 
 _How do we pass incomplete model object between view controllers?_
 
 This is a classic problem. We've had numerous discussions in pull requests during early Swift adoption period.
 
 The prevalent approach is to have all model properties to be mutable and call such an object a _Transient Object_, because it is passed along in incomplete state.
 
 ```
 Persistent means that the object has been saved to the database whereas transient means that it hasn't been saved yet. So for example when you get an entity from a repository, that entity is persistent. When you create a new entity, it is transient until persisted.
 ```
 
 We are trying to challenge this practice and come up with better solution. The main goal is to eleminate the whole class of bugs inherent to mutable models.
 */

struct Goal {
    enum GoalError: Error {
        case invalidName
        case invalidAmount
    }

    let name: String
    let amount: Double
    let picture: UIImage?

    init(name: String, amount: Double, picture: UIImage? = nil) throws {
        guard !name.isEmpty else { throw GoalError.invalidName }
        guard amount > 0 else { throw GoalError.invalidAmount }

        self.name = name
        self.amount = amount
        self.picture = picture
    }
}

/*:
 ## Possible Solutions
 
 - [1 - Using var](2-var)
 - [2 - Mutating Functions](3-mutating-functions)
 - [3 - Transformer Functions](4-transformer-functions)
 - [4 - Copy Constructors](5-copy-constructors)
 - [5 - Payload Objects](6-payload-objects)
 - [6 - Delegating to Client App](7-delegating-to-client-app)
 - [7 - Non-mutating Mutating Functions](8-non-mutating-mutating-functions)
 - [8 - Builder Pattern](9-builder-pattern)
 - [9 - Builder Pattern with `var`s](9-builder-pattern-with-vars)
 - [10 - Builder Pattern with Closures](9-builder-pattern-with-closures)
 */
