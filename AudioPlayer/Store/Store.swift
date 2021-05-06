import SwiftUI
import AVFoundation
import Combine

let songs = [
    Song(id: UUID().uuidString, title: "Song 1", url: URL(string: "https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_5MG.mp3")!),
    Song(id: UUID().uuidString, title: "Song 2", url: URL(string: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3")!),
    Song(id: UUID().uuidString, title: "Song 3", url: URL(string: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-16.mp3")!),
]

class Store: ObservableObject {
    @Published var favoritePlaylist = Playlist(id: UUID().uuidString, name: "Favorites", songs: [])
    @Published var customPlaylists: [Playlist] = [
        Playlist(id: UUID().uuidString, name: "Playlista 1", songs: [
            songs[0],
            songs[1]
        ]),
        Playlist(id: UUID().uuidString, name: "Playlista 2", songs: [
            songs[1],
            songs[2]
        ])
    ]
    @Published var allSongs: [Song] = songs
    @Published var selectedSong: Song?
    @Published var songToPlaylist: Song?
    @Published var songQueue: [Song] = []
    @Published var isPlaying = false
    @Published var isSongDetailsVisible = false
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        $selectedSong.removeDuplicates().sink { song in
            if let song = song {
                let item = AVPlayerItem(url: song.url)
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
        guard
            let selectedSong = selectedSong,
            let currentIndex = songQueue.firstIndex(of: selectedSong) else {
            return
        }
        
        let newIndex = currentIndex - 1
        
        if newIndex < 0 {
            return
        }
        
        let newSong = songQueue[newIndex]
        self.selectedSong = newSong
    }
    
    func next() {
        guard
            let selectedSong = selectedSong,
            let currentIndex = songQueue.firstIndex(of: selectedSong) else {
            return
        }
        
        let newIndex = currentIndex + 1
        
        if newIndex >= songQueue.count {
            return
        }
        
        let newSong = songQueue[newIndex]
        self.selectedSong = newSong
    }
    
    func pause() {
        isPlaying = false
        
        audioPlayer.pause()
    }
    
    func play() {
        if selectedSong == nil {
            selectSong(allSongs[0], songQueue: allSongs)
        }
        
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
    
    func selectSong(_ song: Song, songQueue: [Song]) {
        self.selectedSong = song
        self.songQueue = songQueue
    }
}
