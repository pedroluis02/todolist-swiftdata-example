import XCTest

@testable import ToDoListData

final class LocalStorageTests: XCTestCase {
    func testModelContainerAndContextInit() throws {
        let localStorage = LocalStorage.shared

        XCTAssertNotNil(localStorage.modelContainer)
        XCTAssertNotNil(localStorage.modelContext)
    }
}
