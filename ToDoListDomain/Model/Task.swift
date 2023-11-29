import Foundation

public struct Task {
    var uuid: UUID
    var name: String
    var description: String
    var status: TaskStatus
    var createdAt: Date
}

public enum TaskStatus: String {
    case none
    case created
    case pending
    case canceled
    case done
}
