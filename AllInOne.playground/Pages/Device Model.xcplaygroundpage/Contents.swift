//: [Previous](@previous)

import UIKit


public extension UIDevice {

    /// Device hardware string
    ///
    /// Returns the hardware string, e.g. "iPhone2,1"
    public var hardwareString: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        return machineMirror.children.reduce("") { acc, element in
            guard let value = element.value as? Int8, value != 0 else {
                return acc
            }
            return acc + String(UnicodeScalar(UInt8(value)))
        }
    }

    /// Device model
    //    public var deviceModel: DeviceModel {
    //        return DeviceModel(hardwareString: hardwareString)
    //    }
}


UIDevice.current.hardwareString


@objc enum DeviceModel: Int {

    case a = 5, b, c

    var stringValue: String { return "\(self)" }
    func f() {

    }
}

DeviceModel.a.stringValue

//: [Next](@next)
