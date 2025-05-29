import ToDoListDomain
import Swinject

private func createContainer() -> Container {
    let container = Container()
    container.register(ToDoTaskRepository.self) { _ in TaskRepositoryImpl() }
    return container
}

public let dataContainer = createContainer()
