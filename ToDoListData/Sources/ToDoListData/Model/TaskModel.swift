import Foundation
import SwiftData

@Model
final class TaskModel {
    @Attribute(.unique) var uuid: UUID
    var name: String
    var status: String
    var createdAt: Date
    
    init(name: String, status: String, createdAt: Date) {
        self.uuid = UUID()
        self.name = name
        self.status = status
        self.createdAt = createdAt
    }
}
