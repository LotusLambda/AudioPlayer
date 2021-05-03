import SwiftUI

struct PlaylistDetailsView: View {
    @EnvironmentObject var store: Store
    
    let playlist: Playlist
        
    var body: some View {
        List {
            ForEach(playlist.songs) { song in
                Button {
                    store.selectedSong = song
                    store.isSongDetailsVisible = true
                } label: {
                    SongView(song: song)
                }.buttonStyle(PlainButtonStyle())
            }.onDelete { indexSet in
                store.deleteSongFromPlaylist(indexSet: indexSet, playlist: playlist)
            }
        }
    }
}
