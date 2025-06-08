import Foundation
import ToDoListData
import ToDoListDomain

@Observable
class TaskViewModel {
    @ObservationIgnored
    private let repository: ToDoTaskRepository

    var items: [ToDoTask] = []

    init(repository: ToDoTaskRepository = TaskRepositoryImpl()) {
        self.repository = repository
        self.fetchAll()
    }

    func fetchAll() {
        Task {
            items = await repository.findAll()
        }
    }

    func add(model: ToDoTask) {
        Task {
            _ = await repository.save(model: model)
            fetchAll()
        }
    }
}
