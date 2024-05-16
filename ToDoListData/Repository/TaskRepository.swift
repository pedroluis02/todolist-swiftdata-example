import ToDoListDomain

public class TaskRepository: TaskRepositoryProtocol {
    private let dao: TaskDao = TaskDao()
    private let mapper: TaskModelMapper = TaskModelMapper()
    
    public func findAll() -> [Task] {
        let result = dao.fecthAll()
        return result.map(mapper.toDomain)
    }
    
    public func save(model: Task) -> Task {
        let taskModel = mapper.toSave(model);
        dao.insert(taskModel)
        
        return mapper.toDomain(taskModel)
    }
}
