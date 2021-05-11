import SwiftUI

struct PlaylistsView: View {
    @EnvironmentObject var store: Store
        
    var body: some View {
        NavigationView(content: {
            VStack {
                List {
                    NavigationLink(store.favoritePlaylist.name, destination: PlaylistDetailsView(playlist: store.favoritePlaylist))
                }
                PlayerControlsView()
            }
            .navigationTitle("Playlists")
        })
        
    }
}
