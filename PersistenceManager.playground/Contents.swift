//: Playground - noun: a place where people can play

import UIKit

public typealias JSON = [String: AnyObject]

/// Protocol that defines conversion of (model) objects to and from JSON (aka dictionary) for futher serialization/deserialization
public protocol JSONConvertible {
    /// Initializer from JSON
    init(json: JSON) throws
    /// JSON value
    var jsonValue: JSON { get }
}

struct Account {
    let identifier: String
}

enum ParsingError: ErrorType {
    case error
}

extension Account: JSONConvertible {
    init(json: JSON) throws {
        guard let identifier = json["identifier"] as? String else {
            throw ParsingError.error
        }

        self.init(identifier: identifier)
    }

    var jsonValue: JSON {
        return ["identifier": identifier]
    }
}

class AccountsManager {
    var accounts = [Account]()
    var persistenceManager: PersistenceManager?
}

/// Persistence Manager
///
/// Provides functionality to save and load JSON values and objects conforming to `JSONConvertible` protocol
public struct PersistenceManager {

    // MARK: - Properties and Initialization

    /// Unique identifier
    ///
    /// Used to create unique directory to store manager's data
    private let identifier: String

    /// Optional encryption key
    ///
    /// Encryption is not supported yet
    private let encryptionKey: String?

    /// Check if encryption is enabled
    private var encryptionEnabled: Bool { return encryptionKey != nil }

    /// Initialize with unique identifier and optional encryption key
    ///
    /// If encryption key is not `nil` the encryption is enabled for this manager
    public init(identifier: String, encryptionKey: String? = nil) throws {
        self.identifier = identifier
        self.encryptionKey = encryptionKey

        // Create manager's directory
        try createManagerDir()
    }

    // MARK: - Error Type

    /// Persistence errors
    public enum Error: ErrorType {
        case jsonExpected
        case jsonArrayExpected
        case fileSystemError
        case fileReadError
    }

    // MARK: - Save and Load JSON

    /// Save JSON value to the path
    public func save(json: JSON, path: String) throws {
        let data = try NSJSONSerialization.dataWithJSONObject(json, options: NSJSONWritingOptions())
        try write(data, path: path)
    }

    /// Load JSON value from the path
    public func load(path: String) throws -> JSON {
        let data = try read(path)
        guard let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? JSON else {
            throw Error.jsonExpected
        }
        return json
    }

    // MARK: - Delete Data

    /// Delete saved data at path
    public func delete(path: String) throws {
        try fileManager.removeItemAtURL(url(forPath: path))
    }

    /// Delete all saved data
    public func deleteAll() throws {
        try fileManager.removeItemAtURL(managerDir())

        // Create empty manager's directory again
        try createManagerDir()
    }

    // MARK: - Read and Write to File System

    private func write(data: NSData, path: String) throws {
        try encrypt(data).writeToURL(url(forPath: path), atomically: false)
    }

    private func read(path: String) throws -> NSData {
        guard let data = try NSData(contentsOfURL: url(forPath: path)) else { throw Error.fileReadError }
        return decrypt(data)
    }

    private var fileManager: NSFileManager {
        return NSFileManager.defaultManager()
    }

    private func managerDir() throws -> NSURL {
        return try url(forPath: nil)
    }

    private func createManagerDir() throws {
        try fileManager.createDirectoryAtURL(managerDir(), withIntermediateDirectories: true, attributes: nil)
    }

    private func url(forPath path: String?) throws -> NSURL {
        // Get user's directory to save manager's data to
        let url = fileManager.URLsForDirectory(NSSearchPathDirectory.ApplicationSupportDirectory,
                                                                  inDomains: NSSearchPathDomainMask.UserDomainMask).first
        guard let userDir = url else { throw Error.fileSystemError }
        // Get the manager's unique root directory
        let managerDir = userDir.URLByAppendingPathComponent(identifier)
        // Actual path inside manager's directory
        return managerDir.URLByAppendingPathComponent(path ?? "")
    }

    // MARK: - Encryption

    /// Encrypt data using encryption key
    private func encrypt(data: NSData) -> NSData {
        // Encryption is not yet supported
        if encryptionEnabled { fatalError("PersistenceManager: data encryption not implemented yet") }

        // TODO: Implement encryption using encryptionKey
        return data
    }

    /// Decrypt data using encryption key
    private func decrypt(data: NSData) -> NSData {
        // Decryption is not yet supported
        if encryptionEnabled { fatalError("PersistenceManager: data encryption not implemented yet") }

        // TODO: Implement decryption using encryptionKey
        return data
    }

    // MARK: - Arrays Support

    /// Internal keys
    private enum Keys {
        /// Special key to save array of JSON objects as JSON
        static let array = "array"
    }

    /// Save JSON array to the path
    public func save(jsonArray: [JSON], path: String) throws {
        try save([Keys.array: jsonArray], path: path)
    }

    /// Load JSON array from the path
    public func load(path: String) throws -> [JSON] {
        let json: JSON = try load(path)
        guard let array = json[Keys.array] as? [JSON] else { throw Error.jsonArrayExpected }
        return array
    }

    // MARK: - JSONConvertible Support

    /// Save object conformting to `JSONConvertible` to the path
    public func save<T: JSONConvertible>(object: T, path: String) throws {
        try save(object.jsonValue, path: path)
    }

    /// Save array of objects conformting to `JSONConvertible` to the path
    public func save<T: JSONConvertible>(array: [T], path: String) throws {
        let jsonArray = array.map { $0.jsonValue }
        try save(jsonArray, path: path)
    }

    /// Load object conforming to `JSONConvertible` from the path
    public func load<T: JSONConvertible>(path: String) throws -> T {
        return try T(json: load(path))
    }

    /// Load array of objects conforming to `JSONConvertible` from the path
    public func load<T: JSONConvertible>(path: String) throws -> [T] {
        let jsonArray: [JSON] = try load(path)
        return try jsonArray.map { try T(json: $0) }
    }
}

// Demo (and to unit tests to be)

let pm = try PersistenceManager(identifier: "Accounts", encryptionKey: nil)


// Save and load JSONConvertible object

let account = Account(identifier: "123")

let path = "Account123"
try pm.save(account, path: path)

let anotherAccount: Account = try pm.load(path)
print(anotherAccount)

// Save and load array of JSONConvertible objects
let accounts = [Account(identifier: "abc"), Account(identifier: "xyz")]

let accountsPath = "accounts"
try pm.save(accounts, path: accountsPath)

let loadedAccounts: [Account] = try pm.load(accountsPath)
print(loadedAccounts)
