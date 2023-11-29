//https://www.hackingwithswift.com/quick-start/swiftdata/how-to-use-mvvm-to-separate-swiftdata-from-your-views

import SwiftData

class LocalStorage {
    static let shared = LocalStorage()
    
    let modelContext: ModelContext
    
    private init() {
        self.modelContext = createModelContext()
    }
    
    private func createModelContext() -> ModelContext {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true, allowsSave: false)
        let modelContainer = try! ModelContainer(for: TaskModel.self, configurations: configuration)
        
        return ModelContext(modelContainer)
    }
}
