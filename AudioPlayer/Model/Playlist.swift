struct Playlist: Identifiable, Equatable, Hashable {
    var id: String
    var name: String
    var songs: [Song]
}
