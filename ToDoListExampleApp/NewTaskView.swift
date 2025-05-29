import Foundation
import SwiftUI
import ToDoListDomain

struct NewTaskView: View {
    @State private var viewModel: NewTaskViewModel

    init(onSave: OnSaveAction? = nil) {
        self.viewModel = NewTaskViewModel(onSave: onSave)
    }

    var body: some View {
        Form {
            initTextField(TextField("Name", text: $viewModel.name))
            initTextField(TextField("Description", text: $viewModel.description))

            Spacer(minLength: 24)

            Button(action: viewModel.save) {
                Text("Save")
            }
        }.padding()
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
