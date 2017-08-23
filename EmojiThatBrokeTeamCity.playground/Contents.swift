// Playground - noun: a place where people can play

import Foundation

let bytes: [UInt8] = [0xF0, 0x9F, 0x92, 0xAA]
let p = String(bytes: bytes, encoding: String.Encoding.utf8)
p