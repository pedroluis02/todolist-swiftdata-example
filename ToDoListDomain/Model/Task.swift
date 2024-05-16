import Foundation

public struct Task {
    public var uuid: UUID
    public var name: String
    public var description: String
    public var status: TaskStatus
    public var createdAt: Date
    
    public init(uuid: UUID, name: String, description: String, status: TaskStatus, createdAt: Date) {
        self.uuid = uuid
        self.name = name
        self.description = description
        self.status = status
        self.createdAt = createdAt
    }
}
