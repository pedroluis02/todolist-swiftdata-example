import Foundation
import Testing

@testable import ToDoListData

struct TaskDaoSwiftTests {

    @Test("Test ToDo insertion")
    func insertion() {
        let dao = TaskDao()

        let model = TaskModel(name: "Task1", description: "", status: "created", createdAt: Date())
        dao.insert(model)

        let storedModel = dao.fetchById(model.uuid)
        #expect(storedModel != nil)
    }
}
