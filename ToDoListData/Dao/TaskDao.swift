import Foundation
import SwiftData

class TaskDao {
    private let modelContext: ModelContext = LocalStorage.shared.modelContext
    
    func fecthAll() -> [TaskModel] {
        let descriptor = FetchDescriptor<TaskModel>()
        return try! modelContext.fetch(descriptor)
    }
    
    func fetchById(_ uuid: UUID) -> TaskModel? {
        let descriptor = FetchDescriptor<TaskModel>(
            predicate: #Predicate {
            $0.uuid == uuid
        })
        
        return try! modelContext.fetch<TaskModel>(descriptor).first
    }
    
    func insert(_ model: TaskModel) {
        modelContext.insert(model)
    }
}
