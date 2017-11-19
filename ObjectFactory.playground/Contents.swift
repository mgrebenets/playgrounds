//: Playground - noun: a place where people can play

import UIKit


class CellFactory {
    required init() {

    }

    enum CellType: String {
        case Title = "TitleCellView"
        case Description = "DescriptionCellView"
    }

    class func createCell(type: CellType) -> CellFactory? {
        let appName = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String
        let className = type.rawValue + "." + appName
        guard let any: AnyObject.Type = NSClassFromString(className) else {
            return nil
        }

        guard let cellClass = any as? CellFactory.Type else {
            return nil
        }

        return cellClass.init()
    }
}
