import Testing

@testable import ToDoListData

struct LocalStorageSwiftTests {

    @Test("Test container and context model init")
    func containerAndContextModelInit() {
        let container = LocalStorage.shared.modelContainer
        let config = container.configurations.first

        #expect(config != nil)

        let schema = config!.schema!
        #expect(schema.entities.count > 0)
    }
}
