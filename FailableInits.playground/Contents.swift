//: Playground - noun: a place where people can play

import UIKit

class AccountCard: NSObject {
    let id: String
    let type: String
    let nickname: String
    let number: String
    let hashCode: String

    init(id: String, type: String, nickname: String, number: String, hashCode: String) {
        self.id = id
        self.type = type
        self.nickname = nickname
        self.number = number
        self.hashCode = hashCode

        super.init()
    }

    convenience init?(response: [String: AnyObject]) {
        guard let id = response["cardId"],
            nickname = response["cardNickName"] as? String,
            type = response["cardType"] as? String,
            number = response["cardNumber"] as? String,
            hashCode = response["cardNumberHash"] as? String else {
                return nil
        }

        self.init(id: String(id), type: type, nickname: nickname, number: number, hashCode: hashCode)
    }
}

let card = AccountCard(response: [:])
