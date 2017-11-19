//: Playground - noun: a place where people can play

import UIKit

/*:
Authentication Module

- Implements `ServiceProvider` protocol and registers services
- Implements factory methods to initiate concrete instances for each server type
*/

/// Authentication Manager
///
/// Authentication Manager defines the API to be used by client apps
/// Each group of APIs is defined in it's own extension
public class AuthenticationManager: ServiceProvider {

    // MARK: - ServiceProvider protocol implementation

    public let serverType: ServerType

    required public init(serverType: ServerType = .Helix) {
        self.serverType = serverType
        self.registrationService = self.dynamicType.registrationService(forType: serverType)
        self.loginService = self.dynamicType.loginService(forType: serverType)
    }

    public var services: [Service] {
        return [registrationService, loginService]
    }

    // MARK: - Services

    let loginService: LoginService
    let registrationService: RegistrationService

    /// Registration service factory method
    private static func registrationService(forType serverType: ServerType) -> RegistrationService {
        switch serverType {
        case .Helix: return HelixRegistrationService()
        case .DigitalPlatform: return DigitalPlatformRegistrationService()
        }
    }

    /// Login service factory method
    private static func loginService(forType serverType: ServerType) -> LoginService {
        switch serverType {
        case .Helix: return HelixLoginService()
        case .DigitalPlatform: return DigitalPlatformLoginService()
        }
    }
}

/// Login API
extension AuthenticationManager {
    func login(pin: String, completion: ServiceCompletion) {
        loginService.login("username", password: "pwd") { result in

        }
    }

    func logout(completion: ServiceCompletion) {
        loginService.logout { result in

        }
    }
}

/// Helixt Base Interface ID for all Authentication APIs
extension HelixService {
    struct Authentication {
        static let interfaceIDPrefix = "ESD.NetBank.Authentication.RollingKey"
    }
}

/// Helix Authentication Service
///
/// Defines common base interface ID for all Helix authentication services
class HelixAuthenticationService: HelixService {
    override class var baseInterfaceID: String {
        return HelixService.Authentication.interfaceIDPrefix
    }
}

/// Registration Service protocol
///
/// Defines API for registration service
protocol RegistrationService: Service {
    func register(netbankID: String, password: String, deviceID: String, completion: ServiceResponse)
}

/// Registration Service implementation for Helix backend
class HelixRegistrationService: HelixAuthenticationService, RegistrationService {
    func register(netbankID: String, password: String, deviceID: String, completion: ServiceResponse) {

    }
}

/// Registration Service implementation for Digital Platform backend
class DigitalPlatformRegistrationService: RegistrationService {
    func register(netbankID: String, password: String, deviceID: String, completion: ServiceResponse) {

    }
}

/// Login Service protocol
///
/// Defines API for login service
protocol LoginService: Service {
    func login(username: String, password: String, completion: ServiceResponse)
    func login(pin: String, magicID: String, authData: String, appName: String, completion: ServiceResponse)
    func logout(completion: ServiceResponse)
    func loginDeviceOnly(completion: ServiceResponse)
    func loginBiometric(tokenCipher: String, queryStrings: [String: AnyObject], completion: ServiceResponse)
}

/// Login Service implementation for Helix backend
class HelixLoginService: HelixAuthenticationService, LoginService {
    /// Interface IDs
    private struct InterfaceID {
        static let loginUsernamePassword = baseInterfaceID + ".LoginUsernamePassword"
        static let loginPassword = baseInterfaceID + ".LoginPassword"
        static let loginPin = baseInterfaceID + ".LoginPin"
        static let loginDevice = baseInterfaceID + ".LoginDeviceOnly"
        static let logOff = baseInterfaceID + ".Logoff"
    }

    func login(username: String, password: String, completion: ServiceResponse) {

    }

    func login(pin: String, magicID: String, authData: String, appName: String, completion: ServiceResponse) {

    }

    func logout(completion: ServiceResponse) {

    }

    func loginDeviceOnly(completion: ServiceResponse) {

    }

    func loginBiometric(tokenCipher: String, queryStrings: [String: AnyObject], completion: ServiceResponse) {

    }
}

/// Login Service implementation for Digital Platform backend
class DigitalPlatformLoginService: LoginService {
    func login(username: String, password: String, completion: ServiceResponse) {

    }

    func login(pin: String, magicID: String, authData: String, appName: String, completion: ServiceResponse) {

    }

    func logout(completion: ServiceResponse) {

    }

    func loginDeviceOnly(completion: ServiceResponse) {

    }

    func loginBiometric(tokenCipher: String, queryStrings: [String: AnyObject], completion: ServiceResponse) {
        
    }
}

/*:
    CBAUtil
*/
public enum Result<T> {
    case Success(T)
    case Error(ErrorType)
}

/*: 
    Services Module
*/

public typealias JSON = [String: AnyObject]
public typealias ServiceCompletion = Result<Void> -> Void
public typealias ServiceResponse = Result<JSON> -> Void

public enum Environment {
    case Prod, Test // ...
}

/// Server Type
///
/// We have to have a way to tell factory methods which instances to create
public enum ServerType {
    case Helix, DigitalPlatform
}

/// Services Manager
///
/// Performs configuration tasks
public class ServicesManager {
    /// Current environment
    static var environment = Environment.Prod

    /// Configure service providers and environment
    public static func configure(environment: Environment, providers: [ServiceProvider], plistConfig: String? = nil) {
        providers.forEach { provider in
            provider.registerServices()
        }
    }
}

/// Service Provider protocol
public protocol ServiceProvider {
    var serverType: ServerType { get }
    init(serverType: ServerType)
    var services: [Service] { get }
    func registerServices()
}

public extension ServiceProvider {
    func registerServices() {
        services.forEach { $0.dynamicType.register() }
    }
}

/// Service protocol
public protocol Service {
    /// Base interface identifier
    static var baseInterfaceID: String { get }
    /// Register service
    static func register()
}

/// Default implementations
public extension Service {
    static var baseInterfaceID: String { return "" }
    static func register() {}
}

class HelixService: Service {
    // Must do this to override in subclasses
    // Otherwise protocol's default implementation will be called for subclasses
    class var baseInterfaceID: String { return "" }

    static func register() {
        print("HelixService: register interface ID: \(baseInterfaceID)")
        // It is safe to register same base interface ID to Helix as long as the class is same too
        // Interface ID is only used for lookup, so if entries are same, lookup will be stable
        let interfaceID = baseInterfaceID + ".*"    // Append .* to the prefix
        HelixService.container.classRegistry.registerServiceClientClass(HLXHelixServiceApplicationServiceClient.self, forInterfaceID: interfaceID)
    }

    /// The one and only Helix container
    private static let container = HelixService.helixContainer(forEnvironment: ServicesManager.environment)

    /// Helix container factory method
    static func helixContainer(forEnvironment environment: Environment) -> HLXContainer {
        switch environment {
        case .Prod: return UniversalProdContainer()
        default: return UniversalTestContainer()
        }
    }
}

class UniversalProdContainer: HLXContainer {
    // Nothing so far
}

class UniversalTestContainer: HLXContainer {
    // TODO: Code from Youth UniversalContainer
}

/*:
HelixKit Stubs
*/

class HLXContainer {
    let classRegistry = HLXContainerClassRegistry()
}

class HLXContainerClassRegistry {
    func registerServiceClientClass(aClass: AnyClass!, forInterfaceID interfaceID: String!) {

    }
}

class HLXHelixServiceApplicationServiceClient {

}

/*:
    Usage Example
*/

/// The apps can choose to have singleont instances
extension AuthenticationManager {
    static let sharedHelixInstance = AuthenticationManager()
    static let sharedDPInstance = AuthenticationManager(serverType: .DigitalPlatform)
}

// In Youth app
func youthExample() {
    let authenticationManager = AuthenticationManager.sharedHelixInstance
    let providers: [ServiceProvider] = [authenticationManager]
    ServicesManager.configure(.Prod, providers: providers, plistConfig: "HelixConfiguration.plist")
}

// In some other future app where DP backend is used for Authentication
func dpExample() {
    let authenticationManager = AuthenticationManager.sharedDPInstance
    let providers = [authenticationManager]
    ServicesManager.configure(.Prod, providers: providers)
}

// Careful, run only one example at a time

print("Youth")
youthExample()

//print("Other")
//dpExample()

/*:
Converting Closures

- public typealias JSON = [String: AnyObject]
- public typealias ServiceCompletion = Result<Void> -> Void
- public typealias ServiceResponse = Result<JSON> -> Void
*/

// ServiceResponse -> ServiceCompletion

func serviceCompletion(response: ServiceResponse) -> ServiceCompletion {
    return { result in
        
    }
}

print("Done")
