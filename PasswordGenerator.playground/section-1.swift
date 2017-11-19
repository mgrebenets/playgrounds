// Playground - noun: a place where people can play

import Foundation

struct PasswordGenerator: SequenceType {
    let length: Int
    let characters: Set<Character>

    func generate() -> AnyGenerator<Character> {
        var currentLength: Int = 0
        return AnyGenerator<Character> {
            let randomIndex = Int(arc4random_uniform(UInt32(count(self.characters))))
            let setIndex = advance(self.characters.startIndex, randomIndex)
            return (currentLength++ < self.length ? self.characters[setIndex] : nil)
        }
    }

    func password() -> String {
        return reduce(self) { (pwd: String, char: Character) -> String in
            "".join([pwd, String(char)])
        }
    }
}



class Json {
    var identifier: String = ""
    var name: String = ""
    var imageURL: String = ""

    init (identifier: String, name: String, imageURL: String) {
        self.identifier = identifier
        self.name = name
        self.imageURL = imageURL
    }

    convenience init?(json: [String: AnyObject]) {
        let identifier = json["id"] as? String
        let name = json["name"] as? String
        let imageURL = json["image_url"] as? String
        self.init(identifier: identifier ?? "", name: name ?? "", imageURL: imageURL ?? "")

        if (identifier == nil || name == nil || imageURL == nil) {
            return nil
        }
    }
}

let json1 = Json(json: ["wrong": "1"])  // nil
let json2 = Json(json: ["id": "1", "name": "myname", "image_url": "http"])  // works

let characters = Set(arrayLiteral: "АБВГДAAAAbCd1234567890-=!@#$%^&*()_+QWE˙ÎÓÔ◊ı´¨°•RTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>?ЭЮЯЖЩШ")

let passwordGenerator = PasswordGenerator(length: 10, characters: characters)

println(passwordGenerator.password())
println(passwordGenerator.password())
println(passwordGenerator.password())
println(passwordGenerator.password())


