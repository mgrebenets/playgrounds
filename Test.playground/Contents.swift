//: Playground - noun: a place where people can play

import UIKit

print("x")

enum DeviceInternalName: String, StringLiteralConvertible {
    typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    typealias UnicodeScalarLiteralType = StringLiteralType

    init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self = DeviceInternalName(rawValue: "\(value)")!
//        self.rawValue = "\(value)"
    }

    init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self = DeviceInternalName(rawValue: value)!
//        self.rawValue = value
    }

    init(stringLiteral value: StringLiteralType) {
        self = DeviceInternalName(rawValue: value)!
//        self.rawValue = value
    }

    // Three models of iPhone 4: iPhone3,1, iPhone3,2, and iPhone3,3
    case Iphone31 = "iPhone3,1"
    case Iphone32 = "iPhone3,2"
    case Iphone33 = "iPhone3,3"
    // iPhone 4s
    case Iphone41 = "iPhone4,1"
}

let deviceInternalName = "iPhone3,1"

switch deviceInternalName {
case let name = DeviceInternalName(rawValue: deviceInternalName):
        print("41")
    default:
    print("default")
}


//var date: NSDate = nil

let dataSource = [5, 6, 7]
var indexPaths = dataSource.map { user in }

let view: UIView? = nil
if view == nil {
    print("equals nil")
}

struct Constants {
    static var x = 0
}

func observe(context: UnsafeMutablePointer<Void>) {
    if context == &Constants.x {
        print("equal")
    } else {
        print("not equal")
    }
}

observe(nil)
observe(&Constants.x)
print("come on")

//UnsafeMutablePointer

//var str = "Hello, playground"
//
//
//var amount: String?
//
//(amount ?? "" as NSString).doubleValue
//
//amount = "10"
//
//(amount ?? "" as NSString).doubleValue
//
//class Fee {
//
//    var amount: Double
//    var accountName: String
//    var accountNumber: String
//
//    init(amount: Double, accountName: String, accountNumber: String) {
//        self.amount = amount
//        self.accountName = accountName
//        self.accountNumber = accountNumber
//    }
//
//    convenience init(socialBankingPayload: [String: AnyObject]) {
//        let amount = payload["amount"] as? Double ?? 0
//        let accountName = payload["accountName"] as? String ?? ""
//        let accountNumber = payload["accountNumber"] as? String ?? ""
//
//        self.init(amount: amount, accountName: accountName, accountNumber: accountNumber)
//    }
//
////    convenience init(helixPayload: [String: AnyObject]) {
////
////    }
//
//}
//
//let payload = ["amount": 2]
//let fee = Fee(socialBankingPayload: payload)
//fee
//
//let colorCode: String = "100"
//(colorCode as NSString).floatValue
//Float(colorCode)
//
//
//protocol CustomProtocol {
//    func some()
//}
//
//class Foo: UIView, CustomProtocol {
//    func some() {
//        print("dd")
//    }
//}
//
//let view = UIView()
//
//if let foo = view as? UIView, let foo2 = foo as? CustomProtocol {
//    foo2.some()
//}
//
//class WithDefaults: NSObject {
//    let userDefaults: NSUserDefaults
//
//    init(userDefaults: NSUserDefaults = .standardUserDefaults()) {
//        self.userDefaults = userDefaults
//    }
//}
//
//
//func isValidRegex(text: String?) -> Bool {
//    return true
//}
//
//func isValid(text: String?) -> Bool {
//    guard let text = text, let amount = Double(text)
//        where isValidRegex(text) && amount > 0 else {
//        return false
//    }
//    return true
//}


print("wtf")


class User {
    let guid: String
    let firstName: String

    init(guid: String, firstName: String) {
        self.guid = guid
        self.firstName = firstName
    }

    convenience init(guid: String, firstName: String? = "") {
        self.init(guid: guid, firstName: firstName)
    }

    var pinEnabled = false

//    static var lastLoggedInUser: User? {
//        return nil
//    }
//
//    static var registeredUsers: [User] {
//        return []
//    }
}



let user = User(guid: "aaa")
user.pinEnabled
//user.isPinEnabled
//let lastUser = User.lastLoggedInUser
//print(lastUser)
//let users = User.registeredUsers
//print(users)
//print(users.first)

print("x")
