import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var store: Store

    var body: some View {
        NavigationView(content: {
            List {
                ForEach(store.allSongs) { song in
                    SongView(song: song)
                }
            }.navigationTitle("Dashboard")
        })
    }
}
