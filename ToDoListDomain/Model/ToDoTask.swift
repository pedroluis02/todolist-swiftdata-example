import Foundation

public struct ToDoTask {
    public var id: String
    public var name: String
    public var description: String
    public var status: ToDoTaskStatus
    public var createdAt: Date

    public init(
        name: String,
        id: String? = nil,
        description: String? = nil,
        status: ToDoTaskStatus? = nil,
        createdAt: Date? = nil
    ) {
        self.id = id ?? ""
        self.name = name
        self.description = description ?? ""
        self.status = status ?? ToDoTaskStatus.none
        self.createdAt = createdAt ?? Date()
    }
}
