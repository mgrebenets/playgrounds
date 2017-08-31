//: [Previous](@previous)

import UIKit

let image = UIImage(named: "cba.jpeg")!
let path = NSBundle.mainBundle().pathForResource("cba", ofType: "jpeg")!
let data = NSData(contentsOfFile: path)!
print(data.count)

//let jpegData = UIImagePNGRepresentation(image)!
let jpegData = UIImageJPEGRepresentation(image, 0.355)!
let jpegDataLen = jpegData.count

let string = jpegData.base64EncodedStringWithOptions(NSData.Base64EncodingOptions)
let base64StringLen = string.characters.count

let stringData = string.dataUsingEncoding(NSUTF8StringEncoding)!
let stringDataLen = stringData.length

let overhead = stringDataLen - jpegDataLen

//: [Next](@next)
