import Foundation
import SwiftData
import Testing

@testable import ToDoListData

final class TaskDaoSwiftTests {
    let container: ModelContainer

    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: TaskModel.self, configurations: config)
    }

    @Test("Test ToDo insertion")
    func insertion() async throws {
        let dao = TaskDao(modelContainer: container)

        let model = TaskModel(name: "Task1", description: "", status: "created", createdAt: Date())
        let inserted = await dao.insert(model)

        #expect(inserted)
        let storedModel = await dao.fetchById(model.uuid)
        #expect(storedModel != nil)
    }

    deinit {
        container.deleteAllData()
    }
}
