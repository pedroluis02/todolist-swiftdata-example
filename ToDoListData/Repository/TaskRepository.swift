import ToDoListDomain

public class TaskRepository: TaskRepositoryProtocol {
    private let dao: TaskDao = TaskDao()
    
    public func getAll() -> [Task] {
        <#code#>
    }
    
    public func save(model: Task) -> Task {
        <#code#>
    }
}
