import SwiftUI

struct AddPlaylistView: View {
    @EnvironmentObject var store: Store
    @State private var playlistName: String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView(content: {
            VStack {
                TextField("Playlist name", text: $playlistName)

                Button {
                    store.createPlaylist(name: playlistName)
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Create playlist")
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Add playlist")
        })
    }
}
