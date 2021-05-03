import SwiftUI

class Store: ObservableObject {
    @Published var favoritePlaylist = Playlist(id: UUID().uuidString, name: "Favorites", songs: [])
    @Published var customPlaylists: [Playlist] = []
    
    @Published var allSongs: [Song] = []
    
    func createPlaylist(name: String) {
        let playlist = Playlist(id: UUID().uuidString, name: name, songs: [])
        
        customPlaylists.append(playlist)
    }
    
    func deletePlaylist(indexSet: IndexSet) {
        customPlaylists.remove(atOffsets: indexSet)
    }
}
