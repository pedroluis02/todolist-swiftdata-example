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
        items = repository.findAll()
    }

    func add(model: ToDoTask) {
        _ = repository.save(model: model)
        fetchAll()
    }
}
