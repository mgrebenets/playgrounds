//: Playground - noun: a place where people can play

import UIKit


var dic = [String: AnyObject]()

let a = 0
let b: Int? = nil
let c: Int? = 5

dic["a"] = a
print(dic["a"])
dic["b"] = b
print(dic["b"])
dic["c"] = c
print(dic["c"])
//dic["date"] = NSDate()

let data = try? NSJSONSerialization.dataWithJSONObject(dic, options: NSJSONWritingOptions())
print(data)

let readDic = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions())
print(readDic)
print("x")
