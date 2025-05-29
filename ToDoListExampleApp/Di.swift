import Swinject
import ToDoListData
import ToDoListDomain

private func createContainer() -> Container {
    let container = Container()
    container.register(TaskViewModel.self) { _ in
        let repository = dataContainer.resolve(ToDoTaskRepository.self)!
        return TaskViewModel(repository: repository)
    }
    return container
}

let uiContainer = createContainer()
