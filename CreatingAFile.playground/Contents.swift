//: Playground - noun: a place where people can play

import Foundation

let identifier = "a-b-c"
let basePath = "base/path"
let searchPathDirectory: FileManager.SearchPathDirectory = .applicationSupportDirectory

let fileManager = FileManager.default
let directoryUrl = try fileManager.url(for: searchPathDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
let managerDir = directoryUrl.appendingPathComponent(identifier).appendingPathComponent(basePath)

try! fileManager.createDirectory(at: managerDir, withIntermediateDirectories: true, attributes: nil)

let path: String? = "storage/path"
let url = managerDir.appendingPathComponent(path ?? "")

do {
    try fileManager.createDirectory(atPath: url.deletingLastPathComponent().path, withIntermediateDirectories: true, attributes: nil)
} catch {
    print("error: \(error)")
}

print("done")