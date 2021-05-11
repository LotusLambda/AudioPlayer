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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
