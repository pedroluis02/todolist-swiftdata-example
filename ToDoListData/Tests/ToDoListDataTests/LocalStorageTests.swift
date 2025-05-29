import XCTest

@testable import ToDoListData

final class LocalStorageTests: XCTestCase {
    func testModelContainerAndContextInit() async throws {
        let localStorage = await LocalStorage.shared

        XCTAssertNotNil(localStorage.modelContainer)
        XCTAssertNotNil(localStorage.modelContext)
    }
}
