import Foundation

struct Song: Identifiable, Equatable, Hashable {
    let id: String
    let title: String
    let url: URL
}
