import ToDoListDomain

class TaskRepositoryImpl: ToDoTaskRepository {
    private let dao: TaskDao = TaskDao()
    private let mapper: TaskModelMapper = TaskModelMapper()

    func findAll() -> [ToDoTask] {
        let result = dao.fecthAll()
        return result.map(mapper.toDomain)
    }

    func save(model: ToDoTask) -> ToDoTask {
        let taskModel = mapper.toSave(model)
        dao.insert(taskModel)

        return mapper.toDomain(taskModel)
    }
}
