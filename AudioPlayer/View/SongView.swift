import SwiftUI

struct SongView: View {
    @EnvironmentObject var store: Store
    let song: Song
    
    var body: some View {
        HStack {
            Text(song.title)
            
            Spacer()
            
            if store.isSongFavorite(song: song) {
                Button {
                    print("Unfavorite song!")
                    store.unfavorite(song: song)
                } label: {
                    Image(systemName: "heart.slash.fill")
                }.buttonStyle(PlainButtonStyle())
            } else {
                Button {
                    print("Favorite song!")
                    store.favorite(song: song)
                } label: {
                    Image(systemName: "heart.fill")
                }.buttonStyle(PlainButtonStyle())
            }
            
            Button {
                store.songToPlaylist = song
            } label: {
                Image(systemName: "ellipsis")
            }.buttonStyle(PlainButtonStyle())
        }
    }
}
