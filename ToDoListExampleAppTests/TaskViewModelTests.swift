import Foundation
import Testing
import ToDoListDomain

@testable import ToDoListExampleApp

struct TaskViewModelTests {
    
    private var viewModel: TaskViewModel!
    
    init() {
        viewModel = TaskViewModel(repository: ToDoTaskRepositoryInMemory())
    }

    @Test func testInitial() {
        #expect(viewModel.items.isEmpty)
    }

    @Test func testAdd() async throws {
        let task = ToDoTask(name: "new-task", description: "new-task-desciption")

        viewModel.add(model: task)
        await waitForTask(1)

        #expect(viewModel.items.count == 1)
    }

    @Test func testAddRepeated() async throws {
        let task = ToDoTask(name: "new-task", description: "new-task-desciption")

        viewModel.add(model: task)
        await waitForTask(1)

        viewModel.add(model: task)
        await waitForTask(1)

        #expect(viewModel.items.count == 1)
    }

    @Test func testFindAll() async throws {
        viewModel.add(model: ToDoTask(name: "new-task-1", description: "new-task-desciption"))
        await waitForTask(1)

        viewModel.add(model: ToDoTask(name: "new-task-2", description: "new-task-desciption"))
        await waitForTask(1)

        #expect(viewModel.items.count == 2)
    }

    private func waitForTask(_ milliseconds: Double) async {
        try! await Task.sleep(for: .milliseconds(milliseconds))
    }

}

private class ToDoTaskRepositoryInMemory: ToDoTaskRepository {

    private var tasks: [ToDoTask] = []

    func findAll() async -> [ToDoTask] {
        return tasks
    }

    func save(model: ToDoTask) async -> ToDoTask? {
        let stored = tasks.first(where: { $0.name == model.name })
        if stored != nil {
            return nil
        }

        let newModel = ToDoTask(
            name: model.name,
            id: UUID().uuidString,
            description: model.description,
            status: .created
        )
        tasks.append(newModel)
        return newModel
    }

}
