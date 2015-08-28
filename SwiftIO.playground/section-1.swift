//

import Foundation

/// Reads a line from standard input
///
///:param: max specifies the number of bytes to read
///:returns: the string, or nil if an error was encountered trying to read Stdin
public func getLine(max: Int = Int.max) -> String {
    assert(max > 0, "max must be between 1 and Int.max")

    var buf = String()
    var c = getchar()
    // 10 is ascii code for newline
    while c != EOF && c != 10 && countElements(buf) < max {
        buf.append(UnicodeScalar(UInt32(CChar(c))))
        c = getchar()
    }
    return buf
}

public func readLine<T>(max: Int = Int.max) -> T? {
    var result: T?
    if (T.self as? Int.Type != nil) {
        println("this is an int")
        return Optional<T>.Some(<#T#>)
    } else if (T.self as? String.Type != nil) {
        println("this is a string")
    } else if (T.self as? Array<Int>.Type != nil) {
        println("This is a [Int]")
    } else {
        println("this is default")
    }

    return result
}

let l: String = readLine()!

// Read line and convert to integer
public func readLn(max: Int = Int.max) -> Int {
    return getLine(max: max).toInt()!
}

// Read line and convert to array of strings (words)
public func readLn(max: Int = Int.max) -> [String] {
    return getLine(max: max).componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
}

// Read line and convert to array of integers
public func readLn(max: Int = Int.max) -> [Int] {
    let words: [String] = readLn(max: max)
    return words.map { $0.toInt()! }
}

public func replicateM(times: Int) -> [Int] {
    var result: [Int] = []
    for _ in 0..<times {
        let line: Int = readLn()
        result.append(line)
    }
    return result
}

public func replicateM(times: Int) -> [[Int]] {
    var result: [[Int]] = []
    for _ in 0..<times {
        let line: [Int] = readLn()
        result.append(line)
    }
    return result
}



//let sum = Int(arr[0]) + Int(arr[1])
//println(sum)
