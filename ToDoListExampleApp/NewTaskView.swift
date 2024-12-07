import Foundation
import SwiftUI
import ToDoListDomain

typealias OnSaveAction = ((ToDoTask) -> Void)

struct NewTaskView: View {
    @State private var name = ""
    @State private var description = ""
    
    let onSave: OnSaveAction?
    
    init(onSave: OnSaveAction? = nil) {
        self.onSave = onSave
    }
    
    var body: some View {
        Form {
            initTextField(TextField("Name", text: $name))
            initTextField(TextField("Description", text: $description))
            
            Spacer(minLength: 24)
            
            Button(action: { tryToSave() } ) {
                Text("Save")
            }
        }.padding()
    }
    
    private func tryToSave() {
        onSave?(ToDoTask(name: name, description: description))
    }
    
    private func initTextField(_ view: some View) -> some View {
#if os(macOS)
        return view.frame(minWidth: 200)
#else
        return view
#endif
    }
}

#Preview {
    NewTaskView()
}
