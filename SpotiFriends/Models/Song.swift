//
//  Song.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/28/21.
//

import Foundation
import Firebase
import FirebaseDatabase

class Song: Identifiable {
    let ref: DatabaseReference?
    let id: String
    let song_name: String
       let artist: String
       let album_cover: String
    
    init(id: String, song_name: String, artist: String, album_cover: String) {
        self.ref = nil
        self.id = id
        self.song_name = song_name
        self.artist = artist
        self.album_cover = album_cover
    }
    init?(snapshot: DataSnapshot) {
       // This is what we call a failable init because
       // it returns nil if initialization fails
       guard
         let value = snapshot.value as? [String: AnyObject],
         let id = value["id"] as? String,
         let song_name = value["song_name"] as? String,
        let artist = value["artist"] as? String,
        let album_cover = value["album_cover"] as? String
       else {
         return nil
       }
       
       self.ref = snapshot.ref
        self.id = id
        self.song_name = song_name
        self.artist = artist
        self.album_cover = album_cover
     }
     
     func toAnyObject() -> Any {
       return [
         "id": id,
         "song_name": song_name,
         "artist": artist,
        "album_cover" : album_cover,
       ]
     }
}


