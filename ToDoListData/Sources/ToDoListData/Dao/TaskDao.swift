import Foundation
import SwiftData

class TaskDao {
    private let dataStorage: DataStorage
    
    init(dataStorage: DataStorage = LocalStorage.shared) {
        self.dataStorage = dataStorage
    }

    func fecthAll() -> [TaskModel] {
        let descriptor = FetchDescriptor<TaskModel>()
        let modelContext = dataStorage.modelContext
        return try! modelContext.fetch(descriptor)
    }

    func fetchById(_ uuid: UUID) -> TaskModel? {
        let descriptor = FetchDescriptor<TaskModel>(
            predicate: #Predicate { $0.uuid == uuid }
        )

        let modelContext = dataStorage.modelContext
        let array = try? modelContext.fetch(descriptor)
        return array?.first
    }

    func insert(_ model: TaskModel) {
        let modelContext = dataStorage.modelContext
        modelContext.insert(model)
    }
}
