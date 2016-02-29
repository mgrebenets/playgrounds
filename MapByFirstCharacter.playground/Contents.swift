//: Playground - noun: a place where people can play

import Foundation

typealias StringsDictionary = [String: String]

let testDataDic1: StringsDictionary = ["alpha": "AvalAplha", "algae": "BvalAlgae", "beta": "CvalBeta", "booze": "BvalBooze", "gamma": "GvalGamma"]
let testDataDic2: StringsDictionary = ["alpha": "XvalAplha2", "algae2": "CvalAlgae", "beta2": "BvalBeta", "booze2": "DvalBooze", "gamma2": "AvalGamma"]
let testData = [testDataDic1, testDataDic2]

func extractDataByFirstCharacters(data: [[String:String]], keyName: String) -> [Character: [[String:String]]] {
    var result = [Character: [[String:String]]]()
    for item in data {
        if let key = item[keyName] where key.characters.count > 0 {
            let allChars  = Array(result.keys)
            let c = key[key.startIndex]
            if allChars.contains(c) {
                if var array = result[c] {
                    array.append(item)
                    result[c] = array
                }
            } else {
                result[c] = [ item ]
            }
        }
    }
    return result
}

print("x")

let result1 = extractDataByFirstCharacters(testData, keyName: "alpha")
print(result1)

for (key, value) in result1 {
    print("\(key)")
    print(value)
}


