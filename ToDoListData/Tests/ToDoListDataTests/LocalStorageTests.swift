import XCTest

@testable import ToDoListData

final class LocalStorageTests: XCTestCase {

    func testContainerAndContextModelInit() throws {
        let container = LocalStorage.shared.modelContainer
        let config = container.configurations.first

        XCTAssertNotNil(config)

        let scheme = config!.schema!
        XCTAssertNotNil(scheme.entities.count > 0)
    }
}
