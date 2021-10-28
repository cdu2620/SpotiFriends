//
//  Song.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/28/21.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Artist: Identifiable {
    let ref: DatabaseReference?
    let id: String
    let name: String
       let artist_image: String
    
    init(id: String, name: String, artist_image: String) {
        self.ref = nil
        self.id = id
        self.name = name
        self.artist_image = artist_image
    }
    init?(snapshot: DataSnapshot) {
       // This is what we call a failable init because
       // it returns nil if initialization fails
       guard
         let value = snapshot.value as? [String: AnyObject],
         let id = value["id"] as? String,
         let song_name = value["name"] as? String,
        let artist_image = value["artist_image"] as? String
       else {
         return nil
       }
       
       self.ref = snapshot.ref
        self.id = id
        self.name = song_name
        self.artist_image = artist_image
     }
     
     func toAnyObject() -> Any {
       return [
         "id": id,
         "name": name,
         "artist_image": artist_image,
       ]
     }
}


