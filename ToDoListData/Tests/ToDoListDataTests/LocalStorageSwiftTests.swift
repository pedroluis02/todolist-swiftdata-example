import Testing

@testable import ToDoListData

struct LocalStorageSwiftTests {

    @Test
    func testModelContainerAndContextInit() {
        let dataStorage = LocalStorage.shared
        let config = dataStorage.modelContainer.configurations.first

        #expect(config != nil)

        let schema = config!.schema!
        #expect(schema.entities.count > 0)
    }
}
