import SwiftData
import SwiftUI
import ToDoListData
import ToDoListDomain

struct ContentView: View {
    @State private var viewModel = TaskViewModel()
    @State private var showingPopover = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(viewModel.items, id: \.id) { item in
                    NavigationLink {
                        Text(item.name).bold().font(.title)
                        Text(item.description)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(item.name).bold()
                            Text(item.description).font(.caption)
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            #if os(macOS)
                .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            #endif
            .toolbar {
                #if os(iOS)
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                #endif
                ToolbarItem {
                    Button(action: { showingPopover = true }) {
                        Label("Add Item", systemImage: "plus")
                    }.popover(isPresented: $showingPopover, arrowEdge: .bottom) {
                        NewTaskView { model in
                            showingPopover = false
                            addItem(model)
                        }
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = ToDoTask(name: "Task \(Date().timeIntervalSince1970)")
            viewModel.add(model: newItem)
        }
    }

    private func addItem(_ model: ToDoTask) {
        withAnimation {
            viewModel.add(model: model)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            //empty block
        }
    }
}

#Preview {
    ContentView()
}
