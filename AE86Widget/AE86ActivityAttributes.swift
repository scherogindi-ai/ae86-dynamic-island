import ActivityKit
import Foundation

struct AE86ActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var status: String
        var frame: Int
    }
    var carName: String
}
