import Swinject
import ToDoListData
import ToDoListDomain

@propertyWrapper struct Inject<Dependency> {
    var wrappedValue: Dependency

    init(wrappedValue: Dependency) {
        self.wrappedValue = Injection.shared.container.resolve(Dependency.self)!
    }
}

private final class Injection {
    static let shared = Injection()
    var container: Container {
        get {
            return _container ?? createContainer()
        }
        set {
            _container = newValue
        }
    }

    private var _container: Container?
    private func createContainer() -> Container {
        let container = Container()
        container.register(TaskViewModel.self) { _ in
            let repository = dataContainer.resolve(ToDoTaskRepository.self)!
            return TaskViewModel(repository: repository)
        }
        return container
    }
}
