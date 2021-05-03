import SwiftUI

struct SongDetailsView: View {
    @EnvironmentObject var store: Store
    
    let song: Song
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
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
                }
            }
            .padding()
            .navigationTitle(song.title)
            .navigationBarItems(trailing: Group(content: {
                if store.isSongFavorite(song: song) {
                    Button {
                        print("Unfavorite song!")
                        store.unfavorite(song: song)
                    } label: {
                        Image(systemName: "heart.slash.fill")
                    }.buttonStyle(PlainButtonStyle())
                } else {
                    Button {
                        print("Favorite song!")
                        store.favorite(song: song)
                    } label: {
                        Image(systemName: "heart.fill")
                    }.buttonStyle(PlainButtonStyle())
                }
            }))
        }
        .onAppear {
            store.selectedSong = song
        }
    }
}
