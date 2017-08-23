//: Playground - noun: a place where people can play

import UIKit
import Contacts
import Intents
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let contactsKeysToFetch: [CNKeyDescriptor] = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactMiddleNameKey, CNContactPhoneNumbersKey, CNContactImageDataKey, CNContactIdentifierKey].map { $0 as CNKeyDescriptor }

let p = contactsKeysToFetch[0]
print(contactsKeysToFetch[0])
p

var matchedContacts: [INPerson] = []

var result: [CNContact] = []
let predicate = CNContact.predicateForContacts(matchingName: "MyName")

let result = (try? result = CNContactStore().unifiedContacts(matching: predicate, keysToFetch: contactsKeysToFetch)) ?? []

let matchedContacts: [INPerson]
if let contact = result.first where result.count == 1 {
    matchedContacts = contact.phoneNumbers.map { INPerson($0) }
} else {
    matchedContacts = result.map { INPerson($0) }
}

//do {
//
//}
//catch _ {
//
//    //TODO: Handle contacts not found at all
//}

//Multiple person found
if result.count == 1, let contact = result.first {
//    matchedContacts.appendContentsOf(createContactPhoneNumbers(contact))
} else {
    //One person found, with possibly multiple phone numbers
    for contact in result {
//        matchedContacts.append(createContact(contact))
    }
}

private extension INPerson {
    convenience init(phoneNumber: CNLabeledValue<CNPhoneNumber>) {
        // Move all the init logic in here
    }
}

private func createContactPhoneNumbers(contact: CNContact) -> [INPerson] {
    return contact.phoneNumbers.map { number in
        INPerson(phoneNumber: number)
    }
}

let i: Int = 0

let y = {
    switch i {
    case 1: return 1
    default: return 100
    }
}()

private extension INPerson {

    convenience init(contact: CNContact, phoneNumber: CNPhoneNumber?) {
        var fullName = [contact.givenName, contact.familyName].joined(separator: " ")
        let handle: INPersonHandle
        if let number = phoneNumber?.stringValue {
            fullName = [fullName, number].joined(separator: " ")
            handle = INPersonHandle(value: number, type: .phoneNumber)
        } else {
            handle = INPersonHandle(value: fullName, type: .phoneNumber)
        }

        let image: INImage
        if let imageData = contact.imageData {
            image = INImage(imageData: imageData)
        } else {
            image = INImage()
        }

        self.init(personHandle: handle, nameComponents: nil, displayName: fullName, image: image, contactIdentifier: contact.identifier, customIdentifier: contact.identifier)
    }

    convenience init(contact: CNContact) {
        self.init(contact: contact, phoneNumber: contact.phoneNumbers.first?.value)
    }
}
