public protocol TaskRepositoryProtocol {
    func findAll() -> [Task]
    func save(model: Task) -> Task
}
