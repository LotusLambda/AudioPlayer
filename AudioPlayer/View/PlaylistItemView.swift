import SwiftUI

struct PlaylistItemView: View {
    let playlist: Playlist
    
    var body: some View {
        Text(playlist.name)
    }
}
