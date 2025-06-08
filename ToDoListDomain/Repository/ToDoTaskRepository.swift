@available(macOS 10.15.0, *)
public protocol ToDoTaskRepository {
    func findAll() async -> [ToDoTask]
    func save(model: ToDoTask) async -> ToDoTask?
}
