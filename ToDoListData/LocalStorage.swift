import SwiftData

class StorageContext {
    static var shared: StorageContext = {
        let instance = StorageContext()
        return instance
    }()
    
    let modelContext: ModelContext
    
    private init() {
        self.modelContext = createModelContext()
    }
    
    private func createModelContext() -> ModelContext {
        let modelContainer = try! ModelContainer(for: TaskModel.self)
        return ModelContext(modelContainer)
    }
}

