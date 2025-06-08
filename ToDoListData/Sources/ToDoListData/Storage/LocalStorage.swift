import SwiftData

final class LocalStorage: DataStorage {
    static let shared = LocalStorage()

    let modelContainer: ModelContainer

    private init() {
        self.modelContainer = {
            let schema = Schema([
                TaskModel.self
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
    }
}
