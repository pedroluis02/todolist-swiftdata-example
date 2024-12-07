import ToDoListDomain
import Foundation

final class TaskModelMapper {
    func toDomain(_ model: TaskModel) -> ToDoTask {
        return ToDoTask(name: model.name, id: model.uuid.uuidString, description: model.desc, status: ToDoTaskStatus(rawValue: model.status) ?? ToDoTaskStatus.none, createdAt: model.createdAt)
    }
    
    func toSave(_ model: ToDoTask) -> TaskModel {
        return TaskModel(name: model.name, description: model.description, status: model.status.rawValue, createdAt: model.createdAt)
    }
}
