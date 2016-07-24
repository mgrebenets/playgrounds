import UIKit

public struct GoalWithClosureBuilder {
    enum Error: ErrorType {
        case invalidName
        case invalidAmount
    }

    let name: String
    let amount: Double
    let picture: UIImage?

    // The pure builder pattern recomments to make designated initalizer as private
    // Basically there's no way to create a model other than using builder
    private init(name: String, amount: Double, picture: UIImage? = nil) throws {
        guard !name.characters.isEmpty else { throw Error.invalidName }
        guard amount > 0 else { throw Error.invalidAmount }

        self.name = name
        self.amount = amount
        self.picture = picture
    }

    // Convenience method to get builder based on current version of the model
    // to be able to modify it and create a new version
    public var builder: Builder {
        return Builder(name: name, amount: amount, picture: picture)
    }

    // In pure Builder pattern implementation there's only one initiaizer that takes the builder in
    // We may choose to make it a convenience initializer and delegate to designated initializer in the end
    private init(builder: Builder) throws {
        try self.init(name: builder.name, amount: builder.amount, picture: builder.picture)
    }

    // Note that GoalBuilder is a class
    // This is required to implement fluent interfaces, which return Self
    // to enable chained calls like this: `builder.name("XBOX").amount(100)`
    // With struct this is not possible because function calls return immutable values
    // even if a function is marked as mutating

    public class Builder {
        public var name: String
        public var amount: Double
        public var picture: UIImage?

        typealias BuilderClosure = (Builder) -> ()

        // Designated initializer that creates incomplete model with default values
        public init(name: String = "", amount: Double = 0, picture: UIImage? = nil) {
            // Note that this initializer doesn't throw an error and has invalid defaults
            self.name = name
            self.amount = amount
            self.picture = picture
        }

        // TODO: Incomplete example

        // The model is not created until the moment we call `build`
        public func build() throws -> GoalWithClosureBuilder {
            // Note that we get proper model validation at this point
            return try GoalWithClosureBuilder(builder: self)
        }
    }
}