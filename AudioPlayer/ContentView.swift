import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: .constant(0),
                content:  {
                    DashboardView().tabItem { Text("Dashboard") }.tag(1)
                    
                    PlaylistsView().tabItem { Text("Playlists") }.tag(2)
                })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
