//: Playground - noun: a place where people can play

import Foundation

let kHostnamePattern = "(static|www\\d?)\\.my\\.(dev|test)\\d?\\.finest\\.online\\.cba|wwwt[0245]k.mytestanywhere.org|home-buying.dp.test.finest.online.cba"

func shouldAllowInvalidCertificate(hostname: String) -> Bool {

    guard let regex = try? NSRegularExpression(pattern: kHostnamePattern, options: .CaseInsensitive) else {
        return false
    }

    let range = regex.rangeOfFirstMatchInString(hostname, options: .ReportProgress, range: NSRange(location: 0, length: hostname.characters.count))

    return range.location != NSNotFound
}


shouldAllowInvalidCertificate("wwwt0k.mytestanywhere.org")

shouldAllowInvalidCertificate("home-buying.dp.test.finest.online.cba")