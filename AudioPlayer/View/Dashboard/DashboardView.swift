import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        NavigationView(content: {
            List {
                ForEach(store.allSongs) { song in
                    Button {
                        store.selectedSong = song
                        store.isSongDetailsVisible = true
                    } label: {
                        SongView(song: song)
                    }.buttonStyle(PlainButtonStyle())
                }
            }.navigationTitle("Dashboard")
        })
    }
}
