import Foundation
import SwiftData

protocol DataStorage {

    var modelContainer: ModelContainer { get }
    var modelContext: ModelContext { get }
}
