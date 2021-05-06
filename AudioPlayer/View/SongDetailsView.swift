import SwiftUI

struct SongDetailsView: View {
    @EnvironmentObject var store: Store
    
    let song: Song
    
    var body: some View {
        NavigationView {
            VStack {
                PlayerControlsView()
            }
            .padding()
            .navigationTitle(song.title)
            .navigationBarItems(trailing: Group(content: {
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
            }))
        }
        .onAppear {
            store.selectedSong = song
        }
    }
}
