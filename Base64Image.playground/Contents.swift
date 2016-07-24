//: Playground - noun: a place where people can play

import UIKit

let image = UIImage(named: "cba.jpeg")!
let path = NSBundle.mainBundle().pathForResource("cba", ofType: "jpeg")!
let data = NSData(contentsOfFile: path)!
print(data.length)

//let jpegData = UIImagePNGRepresentation(image)!
let jpegData = UIImageJPEGRepresentation(image, 0.355)!
let jpegDataLen = jpegData.length

let string = jpegData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions())
let base64StringLen = string.characters.count

let stringData = string.dataUsingEncoding(NSUTF8StringEncoding)!
let stringDataLen = stringData.length

let overhead = stringDataLen - jpegDataLen