import Testing

@testable import ToDoListExampleApp

struct NewTaskViewModelTests {

    @Test func testInitial() {
        let viewModel = NewTaskViewModel(onSave: { _ in })

        #expect(viewModel.name.isEmpty)
        #expect(viewModel.description.isEmpty)
    }

    @Test func testSave() {
        let taskName = "new-task"
        let taskDescription = "New Task Description"

        let viewModel = NewTaskViewModel(onSave: { task in
            #expect(task.name == taskName)
            #expect(task.description == taskDescription)
        })

        viewModel.name = taskName
        viewModel.description = taskDescription

        viewModel.save()
    }

}
