public protocol TaskRepositoryProtocol {
    func getAll() -> [Task]
    func save(model: Task) -> Task
}
