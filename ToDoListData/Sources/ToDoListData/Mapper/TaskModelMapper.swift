import ToDoListDomain
import Foundation

final class TaskModelMapper {
    func toDomain(_ model: TaskModel) -> ToDoTask {
        return ToDoTask(name: model.name, id: model.uuid.uuidString, description: model.name, status: ToDoTaskStatus(rawValue: model.status) ?? ToDoTaskStatus.none, createdAt: model.createdAt)
    }
    
    func toSave(_ model: ToDoTask) -> TaskModel {
        return TaskModel(name: model.name, status: model.status.rawValue, createdAt: model.createdAt)
    }
}
