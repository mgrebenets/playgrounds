//: [Previous](@previous)

import Foundation

// YYYY-MM-DD, YYYYMMDD, YYYY-MM,

let dateStrings = [
    "2017-02-18",
    "20170218",
    "201702",
    "--02-18",
    "2017-49"
]

extension DateComponents {

    init(dateString: String) {
        let formatter = ISO8601DateFormatter()
        let allOptions: [ISO8601DateFormatter.Options] = [.withFullDate, [.withYear, .withMonth], [.withMonth, .withDay], [.withYear, .withDay]]
        var finalDate: Date?
        print("parsing \(dateString)")
        for options in allOptions {
            print("using options \(options)")
            let optionsWithSeparator = [options, [options, .withDashSeparatorInDate]]
            for moreOptions in optionsWithSeparator {
                formatter.formatOptions = options
                if let date = formatter.date(from: dateString) {
                    print("done: \(date)")
                    print("---")
                    finalDate = date
                    break
                }
            }

        }
        self.init()
    }
}

let calendar = Calendar(identifier: .gregorian)
let date = DateComponents(calendar: calendar, year: 2017, month: 2, day: 18)

dateStrings.forEach { dateString in
    let date = DateComponents(dateString: dateString)
//    print(date.year)
//    print(date.month)
//    print(date.day)
}


//: [Next](@next)
