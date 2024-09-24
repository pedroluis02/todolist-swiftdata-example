public protocol ToDoTaskRepository {
    func findAll() -> [ToDoTask]
    func save(model: ToDoTask) -> ToDoTask
}
