import UIKit

/*:
 ## The Ladder of Callback Closures
 
 This playground describes situation with chained callback closures as we face it now.
 
 It the demonstrates how reactive programming can make it more simple to code, reason about and understand. 
 */

//: Classic `Result` type with associated value and `ErrorType` for error
enum Result<T> {
    case success(T)
    case error(ErrorType)
}

/// Test error type
enum TestError: ErrorType {
    case createCustomerError, retrieveAccountsError, retrieveCardsError
}

/*:
 A slightly customized, or put it another way, _weird_ response type we get from Helix

 - Has an actual value of `ValueType`
 - Has an optinal warning of `WarningType`
 */
struct ServiceResponse<ValueType> {
    let value: ValueType
    let warning: WarningType?
}

//: The warning type
protocol WarningType {
    var messages: [String] { get }
}

//: Models
struct Customer {}
struct Card {}
struct Account {}

/*:
 Simplified versions of _supposedly_ async methods that request things and return result via callback closure.
 
 The boolean flags should be used to simulate different flows.
 */

let failCreateCutomer = false
let failRetreiveCards = false
let failRetrieveAccounts = false

//: Create customer
typealias CustomerResponse = ServiceResponse<Customer>

func createCustomer(id: String, completion: Result<CustomerResponse> -> Void) {
    let result: Result<CustomerResponse> = failCreateCutomer ?
        .error(TestError.createCustomerError) :
        .success(ServiceResponse(value: Customer(), warning: nil))

    completion(result)
}

//: Retrieve cards
typealias CardsResponse = ServiceResponse<[Card]>

func retrieveCards(completion: Result<CardsResponse> -> Void) {
    let result: Result<CardsResponse> = failRetreiveCards ?
        .error(TestError.retrieveCardsError) :
        .success(ServiceResponse(value: [], warning: nil))

    completion(result)
}

//: Retrieve accounts
typealias AccountsResponse = ServiceResponse<[Account]>

func retrieveAccounts(completion: Result<AccountsResponse> -> Void) {
    let result: Result<AccountsResponse> = failRetreiveCards ?
        .error(TestError.retrieveAccountsError) :
        .success(ServiceResponse(value: [], warning: nil))

    completion(result)
}

//: Show error message
func showError(error: ErrorType) {
    print(error)
}

/*:
 ## The Chain of Requests

 * Create customer
 * Request cards
 * Request accounts

 Handle error similar way each time

 */

/*:
 ```
 Create customer
 ```
 */
createCustomer("id") { result in
    switch result {
    case .success(let response):
        print("created customer")

        /*:
         Retreive cards
         */
        retrieveCards { result in
            switch result {
            case .success(let response):
                print("got cards")

                /*:
                 Retreive accounts
                 */
                retrieveAccounts { result in
                    switch result {
                    case .success(let response):
                        print("got accounts")

                    case .error(let error):
                        showError(error)
                    }
                }

            case .error(let error):
                showError(error)
            }
        }

    case .error(let error):
        showError(error)

    }
}

/*:
 With some annotation, this is how the flow looks.

 ![The flow of closures handling](ClosuresFlow.png)

 It becomes obvious that we have some repeating patterns there.

 First of all the error handling code is the same in all places: we get the error and display it.

 Secondly, each block switches on `Result<T>` type and handles 2 cases: success and error.

 _What if we could find a way to reduce the size of code required and improve readability too?_

 In terms of "railway oriented programming", what if we could make our code to behave like this:

 ![Combined Error Flow](CombinedErrorFlow.png)

 Or, if presnted using tracks metaphor:

 ![Tracks Metaphor](TracksMetaphor.png)

 If you can't wait to find out more, read [this article about Railway Oriented Programming](http://fsharpforfunandprofit.com/posts/recipe-part2/). Then [this article with examples in Swift](http://ulrikdamm.logdown.com/posts/247219).
 */

//: [Next: Mix with Reactive](@next)

func bind<T, U>(lhs : Result<T>, rhs : T -> Result<U>) -> Result<U> {
    switch lhs {
    case .success(let value):
        return rhs(value)
    case .error(let error):
        return .error(error)
    }
}
