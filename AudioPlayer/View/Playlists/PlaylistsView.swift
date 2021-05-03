import SwiftUI

struct PlaylistsView: View {
    @EnvironmentObject var store: Store
    
    @State private var isAddPlaylistPresented = false
    
    var body: some View {
        NavigationView(content: {
            List {
                NavigationLink(store.favoritePlaylist.name, destination: PlaylistDetailsView(playlist: store.favoritePlaylist))
                
                ForEach(store.customPlaylists) { playlist in
                    NavigationLink(playlist.name, destination: PlaylistDetailsView(playlist: playlist))
                }.onDelete { indexSet in
                    store.deletePlaylist(indexSet: indexSet)
                }
            }
            .navigationTitle("Playlists")
            .navigationBarItems(trailing: Button(action: {
                isAddPlaylistPresented = true
            }, label: {
                Image(systemName: "plus.circle")
            }))
            .sheet(isPresented: $isAddPlaylistPresented, content: {
                AddPlaylistView()
            })
        })
        
    }
}
