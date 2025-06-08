import ToDoListDomain

public class TaskRepositoryImpl: ToDoTaskRepository {
    private let dao: TaskDao = TaskDao(modelContainer: LocalStorage.shared.modelContainer)
    private let mapper: TaskModelMapper = TaskModelMapper()

    public init() {}

    public func findAll() async -> [ToDoTask] {
        let result = await dao.fecthAll()
        return result.map(mapper.toDomain)
    }

    public func save(model: ToDoTask) async -> ToDoTask? {
        let taskModel = mapper.toSave(model)
        let inserted = await dao.insert(taskModel)

        return inserted ? mapper.toDomain(taskModel) : nil
    }
}
