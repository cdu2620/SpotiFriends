//
//  Song.swift
//  SpotiFriends
//
//  Created by Xinyi Huang on 10/28/21.
//
import Foundation
import SwiftUI
import Firebase
import FirebaseDatabase

class Song: Identifiable {
    
    let ref: DatabaseReference?
    var id: String
    var song_name: String
    var artist: String
    var album_image_url: String
    var album_image: UIImage?
    
    init(id: String, song_name: String, artist: String, album_image_url: String? = nil) {
        self.ref = nil
        self.id = id
        self.song_name = song_name
        self.artist = artist
        self.album_image_url = album_image_url!
        
        let url = URL(string: self.album_image_url)
        let data = try? Data(contentsOf:url!)
        if let imageData = data {
            self.album_image = UIImage(data: imageData)
        }
    }

    init?(snapshot: DataSnapshot) {
       // This is what we call a failable init because
       // it returns nil if initialization fails
       guard
          let value = snapshot.value as? [String: AnyObject],
          let id = value["id"] as? String,
          let song_name = value["song_name"] as? String,
          let artist = value["artist"] as? String,
          let album_image_url = value["album_image_url"] as? String
       else {
          return nil
       }
       
        self.ref = snapshot.ref
        self.id = id
        self.song_name = song_name
        self.artist = artist
        self.album_image_url = album_image_url
        let url = URL(string: self.album_image_url)
        let data = try? Data(contentsOf:url!)
        if let imageData = data {
            self.album_image = UIImage(data: imageData)
        }
        
     }
     
     func toAnyObject() -> Any {
       return [
         "id": id,
         "song_name": song_name,
         "artist": artist,
         "album_image_url" : album_image_url,
       ]
     }
}
