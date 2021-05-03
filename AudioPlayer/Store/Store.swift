import SwiftUI
import AVFoundation
import Combine

class Store: ObservableObject {
    @Published var favoritePlaylist = Playlist(id: UUID().uuidString, name: "Favorites", songs: [])
    @Published var customPlaylists: [Playlist] = [
        Playlist(id: UUID().uuidString, name: "Playlista 1", songs: []),
        Playlist(id: UUID().uuidString, name: "Playlista 2", songs: [])
    ]
    @Published var allSongs: [Song] = [
        Song(id: UUID().uuidString, title: "Song", url: URL(string: "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_5MG.mp3")!)
    ]
    @Published var selectedSong: Song?
    @Published var songToPlaylist: Song?
    @Published var isPlaying = false
    @Published var isSongDetailsVisible = false
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        $selectedSong.removeDuplicates().sink { song in
            if let song = song {
                let item = AVPlayerItem.init(url: song.url)
                self.audioPlayer.replaceCurrentItem(with: item)
                self.play()
            }
        }.store(in: &cancellables)
    }
    
    let audioPlayer = AVPlayer()
    
    func createPlaylist(name: String) {
        let playlist = Playlist(id: UUID().uuidString, name: name, songs: [])
        
        customPlaylists.append(playlist)
    }
    
    func deletePlaylist(indexSet: IndexSet) {
        customPlaylists.remove(atOffsets: indexSet)
    }
    
    func previous() {
        
    }
    
    func next() {
        
    }
    
    func pause() {
        isPlaying = false
        
        audioPlayer.pause()
    }
    
    func play() {
        isPlaying = true
        
        audioPlayer.play()
    }
    
    func favorite(song: Song) {
        if favoritePlaylist.songs.contains(song) {
            return
        }
        
        favoritePlaylist.songs.append(song)
    }
    
    func unfavorite(song: Song) {
        favoritePlaylist.songs.removeAll { _song in
            _song == song
        }
    }
    
    func isSongFavorite(song: Song) -> Bool {
        favoritePlaylist.songs.contains(song)
    }
    
    func addSongToPlaylist(song: Song, playlist: Playlist) {
        if playlist.songs.contains(song) {
            return
        }
        
        let index = self.customPlaylists.firstIndex(of: playlist)!
        
        self.customPlaylists[index].songs.append(song)
    }
    
    func deleteSongFromPlaylist(indexSet: IndexSet, playlist: Playlist) {
        if playlist == self.favoritePlaylist {
            self.favoritePlaylist.songs.remove(atOffsets: indexSet)
        } else {
            let index = self.customPlaylists.firstIndex(of: playlist)!
            
            self.customPlaylists[index].songs.remove(atOffsets: indexSet)
        }
    }
}
