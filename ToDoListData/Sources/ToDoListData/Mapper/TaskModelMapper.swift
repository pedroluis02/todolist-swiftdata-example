import ToDoListDomain
import Foundation

final class TaskModelMapper {
    func toDomain(_ model: TaskModel) -> Task {
        return Task(uuid: model.uuid, name: model.name, description: model.name, status: TaskStatus(rawValue: model.status) ?? TaskStatus.none, createdAt: model.createdAt)
    }
    
    func toSave(_ model: Task) -> TaskModel {
        return TaskModel(name: model.name, status: model.status.rawValue, createdAt: Date())
    }
}
