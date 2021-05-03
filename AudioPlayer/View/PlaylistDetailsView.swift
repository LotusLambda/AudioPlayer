import SwiftUI

struct PlaylistDetailsView: View {
    let playlist: Playlist
        
    var body: some View {
        List(playlist.songs) { song in
            SongView(song: song)
        }
    }
}
