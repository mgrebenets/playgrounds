//: Playground - noun: a place where people can play

import UIKit

class CBAAccount {}

protocol AccountSettingsSection: Equatable {
    var title: String? { get set }
    var headerIsHidden: Bool { get set }
    var cells: [UITableViewCell] { get set }
    var account: CBAAccount? { get set }
    var eligible: Bool { get }

    func clearAllCells()
}

extension AccountSettingsSection {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return false
    }
}

protocol DynamicSectionReloadDelegate: class {
//    func reloadSettingsSection(_ fromSection: AccountSettingsSection)
    func reloadSettingsSection<T: AccountSettingsSection>(_ fromSection: T)
}

let sections: [AccountSettingsSection] = []

class Section: AccountSettingsSection {
    var title: String? = "x"
    var headerIsHidden = false
    var cells: [UITableViewCell] = []
    var account: CBAAccount? = nil
    var eligible = false

    func clearAllCells() {

    }
}

