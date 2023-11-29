import SwiftUI
import SwiftData

class TaskDao {
    private let modelContext: ModelContext = LocalStorage.shared.modelContext

    
    func fecthAll() -> [TaskModel] {
        let descriptor = FetchDescriptor<TaskModel>(sortBy: [SortDescriptor(\.name)])
        return try! modelContext.fetch(descriptor)
    }
    
    func insert(model: TaskModel) {
        modelContext.insert(model)
    }
}
