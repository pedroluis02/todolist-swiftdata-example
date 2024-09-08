import XCTest
@testable import ToDoListData

final class TaskTests: XCTestCase {
    func testInsertion() {
        let model = TaskModel(name: "Task1", status: "created", createdAt: Date())
        
        let dao = TaskDao()
        dao.insert(model)
        
        //let storedModel = dao.fetchById(model.uuid)
        //XCTAssertNotNil(storedModel)
    }
}
