import Foundation
import SwiftData

class TaskDao {
    private let dataStorage: LocalStorage
    
    init(dataStorage: LocalStorage = LocalStorage.shared) {
        self.dataStorage = dataStorage
    }
    
    func fecthAll() -> [TaskModel] {
        let descriptor = FetchDescriptor<TaskModel>()
        let modelContext = dataStorage.modelContext
        return try! modelContext.fetch(descriptor)
    }
    
    func fetchById(_ uuid: UUID) -> TaskModel? {
        let descriptor = FetchDescriptor<TaskModel>(
            predicate: #Predicate { $0.uuid == uuid}
        )
        
        let modelContext = dataStorage.modelContext
        return try? modelContext.fetch<TaskModel>(descriptor).first 
    }
    
    func insert(_ model: TaskModel) {
        let modelContext = dataStorage.modelContext
        modelContext.insert(model)
    }
}
