import SwiftData
import XCTest

@testable import ToDoListData

final class TaskDaoTests: XCTestCase {
    var container: ModelContainer!

    override func setUpWithError() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: TaskModel.self, configurations: config)
    }

    func testInsertion() async throws {
        let dao = TaskDao(modelContainer: LocalStorage.shared.modelContainer)

        let model = TaskModel(name: "Task1", description: "", status: "created", createdAt: Date())
        let inserted = await dao.insert(model)

        XCTAssert(inserted)
        let storedModel = await dao.fetchById(model.uuid)
        XCTAssertNotNil(storedModel)
    }

    override func tearDown() {
        container.deleteAllData()
    }
}
