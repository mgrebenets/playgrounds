//: Playground - noun: a place where people can play

import UIKit

//: ObservableValue


struct Subscription<Element> {
    typealias Closure = (Element, Element) -> Void
    // Subscription closure
    private var closure: Closure

    // Unique identifier
    private let identifier = NSUUID().UUIDString

    // Notify
    func notify(oldValue: Element, newValue: Element) {
        closure(oldValue, newValue)
    }
}

extension Subscription: Equatable { }

func ==<T> (lhs: Subscription<T>, rhs: Subscription<T>) -> Bool {
    return lhs.identifier == rhs.identifier
}


enum SubscriptionError: ErrorType {
    case NoSuchSubscriber
}

struct Observable<Element> {

    // Hold the value
    var value: Element {
        didSet(oldValue) {
            subscribers.forEach { subscriber in
                subscriber.notify(oldValue, newValue: value)
            }
        }
    }

    // Hold the subscribers
    private var subscribers: [Subscription<Element>] = []

    // Init
    init(value: Element) {
        self.value = value
    }

    // TODO: alternatively could return not the subscriber, but a unique identifier
    // and then use it to remove subscriber tMember

    // Subscribe
    mutating func subscribe(closure: Subscription<Element>.Closure) -> Subscription<Element> {
        let subscription = Subscription(closure: closure)
        subscribers.append(subscription)
        return subscription
    }

    // Unsubscribe
    mutating func unsubscribe(subscription: Subscription<Element>) throws {
        guard let index = subscribers.indexOf(subscription) else {
            throw SubscriptionError.NoSuchSubscriber
        }

        subscribers.removeAtIndex(index)
    }
}

enum PropertyState {
    case idle, loading, error(ErrorType)
}

struct StatefulProperty<Element> {
    typealias State = Observable<PropertyState>
    typealias Property = Observable<Element>

    var state: State = State(value: .idle)
    var property: Property
    init(property: Property) {
        self.property = property
    }
}

struct Account {
    let identifier: String
}

struct Transaction {
    let identifier: String
}

let p = StatefulProperty(property: Observable(value: [Account]()))

class AccountsManager {
    var accounts = StatefulProperty(property: Observable<[Account]>(value: []))
//    var accounts = Observable<[Account]>(value: [])
//    var transactions = Observable<[Transaction]>(value: [])
    var transactions = StatefulProperty(property: Observable<[Transaction]>(value: []))
}


let manager = AccountsManager()
let accountsPropertySubscriber = manager.accounts.property.subscribe { old, new in
    print("accountsPropertySubscriber: old: \(old), new: \(new)")
}
let s2 = accountsPropertySubscriber
s2.identifier
try? manager.accounts.property.unsubscribe(s2)

let accountsStateSubscriber = manager.accounts.state.subscribe { old, new in
    print("accountsStateSubscriber: old: \(old), new: \(new)")
}


let transactionsSubscriber = manager.transactions.property.subscribe { old, new in
    print("transactionsSubscriber: old: \(old), new: \(new)")
}

manager.accounts.property.value = [Account(identifier: "xxx")]
manager.accounts.state.value = .loading


//do {
//    try person.age.unsubscribe(subscriber1)
//} catch {
//
//}


let d = ["a": "b"]
let c = d.map { k, v in
    (v, k)
}

let array = ["a", "b", "c"]
for (index, element) in array.enumerate() {
    print(index)
}

print("x")
