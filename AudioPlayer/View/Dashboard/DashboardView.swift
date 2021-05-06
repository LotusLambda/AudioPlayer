import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        NavigationView(content: {
            VStack {
                List {
                    ForEach(store.allSongs) { song in
                        Button {
                            store.selectSong(song, songQueue: store.allSongs)
                            store.isSongDetailsVisible = true
                        } label: {
                            SongView(song: song)
                        }
                    }
                }
                PlayerControlsView()
            }.navigationTitle("Dashboard")
        })
    }
}
