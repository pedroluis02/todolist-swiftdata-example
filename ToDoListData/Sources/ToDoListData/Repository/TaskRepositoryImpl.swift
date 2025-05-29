import ToDoListDomain

public class TaskRepositoryImpl: ToDoTaskRepository {
    private let dao: TaskDao = TaskDao()
    private let mapper: TaskModelMapper = TaskModelMapper()

    public init() {}

    public func findAll() -> [ToDoTask] {
        let result = dao.fecthAll()
        return result.map(mapper.toDomain)
    }

    public func save(model: ToDoTask) -> ToDoTask {
        let taskModel = mapper.toSave(model)
        dao.insert(taskModel)

        return mapper.toDomain(taskModel)
    }
}
