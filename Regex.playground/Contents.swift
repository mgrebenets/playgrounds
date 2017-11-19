//: Playground - noun: a place where people can play

import Foundation

//let kHostnamePattern = "(static|www\\d?)\\.my\\.(dev|test)\\d?\\.finest\\.online\\.cba|wwwt[0245]k.mytestanywhere.org|home-buying.dp.test.finest.online.cba"
//
//func shouldAllowInvalidCertificate(hostname: String) -> Bool {
//
//    guard let regex = try? NSRegularExpression(pattern: kHostnamePattern, options: .CaseInsensitive) else {
//        return false
//    }
//
//    let range = regex.rangeOfFirstMatchInString(hostname, options: .ReportProgress, range: NSRange(location: 0, length: hostname.characters.count))
//
//    return range.location != NSNotFound
//}
//
//
//shouldAllowInvalidCertificate("wwwt0k.mytestanywhere.org")
//
//shouldAllowInvalidCertificate("home-buying.dp.test.finest.online.cba")

let regex = "^[a-zA-Z][a-zA-Z'\\-]{0,29}$"

extension String {
    /// Whether there is at least one match in this string for the given regular expressions.
    public func matchesRegex(_ regex: String) -> Bool {
        return matchesRegex(regex, isCaseInsensitive: false)
    }

    /// Whether there is at least one match in this string for the given regular expressions.
    public func matchesRegex(_ regex: String, isCaseInsensitive: Bool) -> Bool {
        let options: NSString.CompareOptions
        if isCaseInsensitive {
            options = [.regularExpression, .caseInsensitive]
        } else {
            options = .regularExpression
        }
        return range(of: regex, options: options) != nil
    }
}

"abc".matchesRegex(regex)
"123".matchesRegex(regex)
"a.c".matchesRegex(regex)
"a-c".matchesRegex(regex)
"a5c".matchesRegex(regex)

let versionRegex = "\\d+\\.\\d+(\\.\\d+)?"

"abcx".matchesRegex(".*")

"".matchesRegex(versionRegex)
"10.3.1".matchesRegex(versionRegex)
"10x3x1".matchesRegex(versionRegex)
"10.3".matchesRegex(versionRegex)
"10x3".matchesRegex(versionRegex)
"a.b.c".matchesRegex(versionRegex)


let value: Int? = 5
String(describing: value)
let value2: Int? = nil
String(describing: value2)