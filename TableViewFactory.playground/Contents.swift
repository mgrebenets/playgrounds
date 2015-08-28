//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum ListingDetailContentType: String {
    case Description = "Description"
    case Location = "Location"

    typealias CellType = UITableViewCell

    var cellClass: UITableViewCell.Type {
        switch self {
        case .Description:
            return UITableViewCell.self
        case .Location:
            return UITableViewCell.self
        }
    }

}

enum ContentType {
    case Description(UITableViewCell)
    case Location(UITableViewCell)
}


let tableView = UITableView()
let cellClass = UITableViewCell.self
var cell = tableView.dequeueReusableCellWithIdentifier("id") as cellClass
//let contentType: ContentType = .Description(
//var cell = tableView.dequeueReusableCellWithIdentifier("id") as? contentType.cellClass
//print(cell)


//print(c)

//let type = UITableViewCell.self
