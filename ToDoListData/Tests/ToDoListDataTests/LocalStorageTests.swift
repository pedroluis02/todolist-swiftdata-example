import XCTest

@testable import ToDoListData

final class LocalStorageTests: XCTestCase {

    func testModelContainerAndContextInit() throws {
        let dataStore = LocalStorage.shared
        let config = dataStore.modelContainer.configurations.first

        XCTAssertNotNil(config!)
        
        let scheme = config!.schema!
        XCTAssertNotNil(scheme.entities.count > 0)
    }
}
