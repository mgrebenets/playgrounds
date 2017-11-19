//: Playground - noun: a place where people can play

import UIKit


let hexString = "ABCDEF0123"

var data = NSMutableData()

for var index = hexString.startIndex; index < hexString.endIndex; index = index.successor().successor() {
    let byteString = hexString.substringWithRange(Range<String.Index>(start: index, end: index.successor().successor()))
    let num = UInt8(byteString.withCString { strtoul($0, nil, 16) })
    print(num)
    data.appendBytes([num] as [UInt8], length: 1)
}

print(data)

data = NSMutableData()

for c in hexString.characters {
//    print(c)
}


var index = hexString.startIndex
while index < hexString.endIndex {
    let nextIndex = index.advancedBy(2)
    let byteString = hexString.substringWithRange(index..<nextIndex)
    print(byteString)
    let number = UInt8(byteString.withCString { strtoul($0, nil, 16) })

    index = nextIndex
}



//hexString[index]

for i in 0..<hexString.characters.count / 2 {
    hexString.startIndex
}
//let stride = 0.stride(to: hexString.characters.count, by: 2)
//hexString.startIndex.adva/
//stride.map { index in
//    hexString.substringWithRange(Range<String.Index>(start: index..<index + 2]
//}


print("x")
