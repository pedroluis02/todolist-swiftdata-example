import Foundation
import SwiftData

@ModelActor
actor TaskDao {

    func fecthAll() -> [TaskModel] {
        let descriptor = FetchDescriptor<TaskModel>()
        return try! modelContext.fetch(descriptor)
    }

    func fetchById(_ uuid: UUID) -> TaskModel? {
        let descriptor = FetchDescriptor<TaskModel>(
            predicate: #Predicate { $0.uuid == uuid }
        )

        let array = try? modelContext.fetch(descriptor)
        return array?.first
    }

    func insert(_ model: TaskModel) -> Bool {
        modelContext.insert(model)
        do {
            try modelContext.save()
            return true
        } catch {
            return false
        }
    }
}
