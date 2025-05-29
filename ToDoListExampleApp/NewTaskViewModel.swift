import Foundation
import ToDoListData
import ToDoListDomain

typealias OnSaveAction = ((ToDoTask) -> Void)

@Observable
class NewTaskViewModel {

    var name: String
    var description: String

    private let onSave: OnSaveAction?

    init(name: String? = nil, description: String? = nil, onSave: OnSaveAction?) {
        self.name = name ?? ""
        self.description = description ?? ""
        self.onSave = onSave
    }

    func save() {
        let newName = name.trim()
        let newDesc = description.trim()

        if newName.isEmpty {
            return
        }

        onSave?(ToDoTask(name: newName, description: newDesc))
    }

}

extension String {
    fileprivate func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
