import XCTest

@testable import ToDoListData

final class TaskDaoTests: XCTestCase {

    func testInsertion() {
        let dao = TaskDao()

        let model = TaskModel(name: "Task1", description: "", status: "created", createdAt: Date())
        dao.insert(model)

        let storedModel = dao.fetchById(model.uuid)
        XCTAssertNotNil(storedModel)
    }
}
