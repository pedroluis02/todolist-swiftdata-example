import Foundation
import SwiftData

@Model
final class TaskModel {
    let uuid: UUID
    var name: String
    var status: String
    var createdAt: Date
    
    init(uuid: UUID, name: String, status: String, createdAt: Date) {
        self.uuid = uuid
        self.name = name
        self.status = status
        self.createdAt = createdAt
    }
}
