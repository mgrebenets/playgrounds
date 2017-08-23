import Foundation

enum Developers: String {
    case backend
    case native
    case lol
}

var test: [String: Developers] = ["1234": .lol, "3456": .native]

var zipped: [String: String] = [:]

test.forEach { (key, value) in
    zipped[key] = value.rawValue
}

var res: [String: Developers] = [:]

zipped.forEach { (key, value) in
    res[key] = Developers.init(rawValue: value)
}

test.map { (key, value) -> [String: String] in
    return [key: value.rawValue]
}

let r = test.map { (key, value) -> (String, String) in
    return (key: key, value: value.rawValue)
}
r
//r["1234"]

let r2 = test.map { entry -> (String, String) in
//    Dictionary<String, String>.Element
    return (key: entry.key, value: entry.value.rawValue)
//    return (entry.0, entry.1.rawValue)
}
r2
//r["1234"]

let r3 = test.reduce([:]) { (dic, entry) in
    var mutableDic = dic
    mutableDic[entry.key] = entry.value.rawValue
    return mutableDic
}
r3

//let r3 = test.reduce([:]) { (dic, entry) in
//    return dic.merge(with: [entry.key: entry.value.rawValue])
//}
