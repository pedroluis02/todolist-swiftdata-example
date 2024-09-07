import XCTest

final class LocalStorageTests: XCTestCase {
    private let localStorage = LocalStorage.shared
    
    func testModelContextInit() {
        let modelContext = localStorage.modelContext
        XCTAssertNotNil(modelContext)
    }
}
