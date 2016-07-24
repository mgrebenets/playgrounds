//: Playground - noun: a place where people can play

import UIKit


public class AccountsManager {

    let accountsService: AccountsService = AccountsService()
    init() {

    }

    public enum State {
        case idle, loading, error(ErrorType)
    }

    public internal(set) var state = State.idle
    public internal(set) var accounts = [Account]()

    public func retrieveAccounts() {
        if case .loading = state { return }
        state = .loading

        accountsService.retrieveAccounts { result in
            switch result {
            case .error(let error):
                self.state = .error(error)
            case .success((let accounts, _)):
                self.accounts = accounts
                self.state = .idle
            }
        }
    }

    //    public func retrieveAccounts() {
    //        if state == .loading { return }
    //        state = .loading
    //
    //        accountsService.retrieveAccounts { result in
    //            switch result {
    //            case .error(let error):
    //                self.state = .error(error)
    //            case .success((let accounts, _)):
    //                self.accounts = accounts
    //                self.state = .idle
    //            }
    //        }
    //    }
}

public struct Account {

}

public struct BalanceSummary {

}


class AccountsService {
    func retrieveAccounts(completion: Result<([Account], BalanceSummary)> -> Void) {

    }
}

public enum Result<T> {
    case success(T)
    case error(ErrorType)
}

typealias VoidResult = Result<Void>

public class AuthenticationManager {
    public enum State {
        case idle, loading, error(ErrorType)
    }

    public enum AuthenticationStatus {
        case LoggedIn, LoggedOff
    }

    public internal(set) var authStatus = AuthenticationStatus.LoggedOff
    public internal(set) var state = State.idle

    public func login(username username: String,
                               password: String,
                               completion: Result<Void> -> Void) {

    }
}

public class ArithmeticsManager {
    public func sum(a a: Int,
                      b: Int,
                      completion: Result<Int> -> Void) {

    }
}

extension AccountsManager {
    static let parentAccountsManager = AccountsManager()
    static let childAccountsManager = AccountsManager()
}
