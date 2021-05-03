import SwiftUI

struct SongView: View {
    let song: Song
    
    var body: some View {
        HStack {
            Text(song.title)
        }
    }
}
