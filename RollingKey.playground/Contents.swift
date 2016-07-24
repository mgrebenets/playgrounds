//: Playground - noun: a place where people can play

import UIKit

let feedlerString = "16ac7dcb 9cc90283 85500eb8 b6bd53b0 67994b46 07d6b702 d6f91338 ea6c72cd a263c627 e194d77b f12a5db0 4341406f 8f1dca02 f3d0c1a2 440c3bc7 4ff0d841 c4d43702 b72298d6 a23e3598 fa5327bb 6240e00a f81ff784 0751a162 01b61740 0f5420fb c69050a3 80b8c500 afe57cf3 00983605 bda077c8 5fab1126 ca249314 aef09262 1a318ab5 42bfde98 c7be7adc 0ee54f1f fa78c2b6 4fdbe3ad f416c0dd 03e43eac a32c42a8 219206e2 8a07678a b9900b4e db584ac3 6d29e91b 89825ed2 d39bac0c 895587db 0ec14db2 2a491ed3 8122f14d 22ca52fe 356af5d6 1bbfcdd0 8e9c206a 2da3c732 a9abd8fc 09d552fe c6b69c72 d055cb32 616e3159 92e06db0"

func describe(string: String) {
    let totalLen = feedlerString.characters.count
    let blocks = totalLen / 9
    let spaces = feedlerString.characters.filter { $0 == " " }
    let spacesCount = spaces.count
    print(totalLen)
    print(blocks)
    print(spacesCount)
}

let another = "0f3fa1d7 efa65639 22db4044 2a41926c 23a27fdb 95d79bb9 5a8dc61e be6d0853 3fd3121e c41850e7 a881fd15 bb24a1aa 36e3aa62 b2e4be43 8da0fdcd 74058b51 08734ec6 d313b231 478193c1 550613a3 82a34a09 615eb509 668381f9 a510a56b 936f2717 816b14f2 73fb2784 3c03fea1 69f4b795 5138f228 49a9df28 fb8d9fd7 0c715d4d 0890de59 92fc6748 e7de52d8 0d0ec6ec 464bd1d2 8d60b9eb c9fb1081 c959ff76 a1d067ea 61b3c391 77a69510 89fbf02d 41f41edf ac658119 11a3e1f1 f99a2215 145ebaf9 836f0aed f933aa51 07a9c19e 4b71f1ff 64942b27 8cbd96fc b0fdc767 b0a0e409 8b74372c 9714d03f d63f9f26 5962ac2d 6f5e7db2 b7ff8a8f"

describe(feedlerString)
describe(another)

extension NSData {
    var hexString: String {
        var byteArray = [UInt8](count: length, repeatedValue: 0)
        getBytes(&byteArray, length: length)
        let hexString = byteArray.reduce("") { result, value in
            result + String(format: "%02x", value)
        }
        return hexString
    }
}

let dataString = "0f3fa1d7 efa65639 22db4044 2a41926c 23a27fdb 95d79bb9 5a8dc61e be6d0853 3fd3121e c41850e7 a881fd15 bb24a1aa 36e3aa62 b2e4be43 8da0fdcd 74058b51 08734ec6 d313b231 478193c1 550613a3 82a34a09 615eb509 668381f9 a510a56b 936f2717 816b14f2 73fb2784 3c03fea1 69f4b795 5138f228 49a9df28 fb8d9fd7 0c715d4d 0890de59 92fc6748 e7de52d8 0d0ec6ec 464bd1d2 8d60b9eb c9fb1081 c959ff76 a1d067ea 61b3c391 77a69510 89fbf02d 41f41edf ac658119 11a3e1f1 f99a2215 145ebaf9 836f0aed f933aa51 07a9c19e 4b71f1ff 64942b27 8cbd96fc b0fdc767 b0a0e409 8b74372c 9714d03f d63f9f26 5962ac2d 6f5e7db2 b7ff8a8f"
let dataByteStrings = dataString.componentsSeparatedByString(" ")

String(format: "%02x", " ")
