import SwiftUI

struct PlaylistDetailsView: View {
    @EnvironmentObject var store: Store
    
    let playlist: Playlist
        
    var body: some View {
        List {
            ForEach(playlist.songs) { song in
                Button {
                    store.selectSong(song, songQueue: playlist.songs)
                    store.isSongDetailsVisible = true
                } label: {
                    SongView(song: song)
                }
            }
        }
    }
}
