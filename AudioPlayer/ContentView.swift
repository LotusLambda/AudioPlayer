import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: Store
        
    var body: some View {
        TabView {
            DashboardView().tabItem { Text("Dashboard") }.tag(1)
            
            PlaylistsView().tabItem { Text("Playlists") }.tag(2)
        }
        .sheet(isPresented: $store.isSongDetailsVisible) {
            
        } content: {
            if let song = store.selectedSong {
                SongDetailsView(song: song)
            }
        }
        .actionSheet(item: $store.songToPlaylist) { song in
            let playlistButtons = [
                Alert.Button.default(Text(store.favoritePlaylist.name), action: {
                    store.favorite(song: song)
                })
            ] + store.customPlaylists.map({ playlist in
                Alert.Button.default(Text(playlist.name)) {
                    let index = store.customPlaylists.firstIndex(of: playlist)!
                    store.customPlaylists[index].songs.append(song)
                }
            })
            
            let cancelButton = [
                ActionSheet.Button.cancel()
            ]
            
            return ActionSheet(title: Text("Add to playlist"), message: nil, buttons: playlistButtons + cancelButton)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
