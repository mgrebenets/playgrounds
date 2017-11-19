import Foundation

enum RandomSource {

    static let file = fopen("/dev/urandom", "r")!
    static let queue = DispatchQueue(label: "random")

    static func get(count: Int) -> [Int8] {
        let capacity = count + 1 // fgets adds null termination
        var data = UnsafeMutablePointer<Int8>.allocate(capacity: capacity)
        defer {
            data.deallocate(capacity: capacity)
        }
        queue.sync {
            fgets(data, Int32(capacity), file)
        }
        return Array(UnsafeMutableBufferPointer(start: data, count: count))
    }
}


extension Integer {

    static var randomized: Self {
        let numbers = RandomSource.get(count: MemoryLayout<Self>.size)
        return numbers.withUnsafeBufferPointer { bufferPointer in
            return bufferPointer.baseAddress!.withMemoryRebound(to: Self.self, capacity: 1) {
                return $0.pointee
            }
        }
    }

}

Int8.randomized
UInt8.randomized
Int16.randomized
UInt16.randomized
Int16.randomized
UInt32.randomized
Int64.randomized
UInt64.randomized
