import SwiftUI

struct PlayerControlsView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                store.previous()
            } label: {
                Image(systemName: "backward.end.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
            }

            Button {
                if store.isPlaying {
                    store.pause()
                } else {
                    store.play()
                }
            } label: {
                if store.isPlaying {
                    Image(systemName: "pause.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                } else {
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }
            
            Button {
                store.next()
            } label: {
                Image(systemName: "forward.end.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            
            Spacer()
        }.padding()
    }
}
