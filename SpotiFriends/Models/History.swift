//
//  History.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/28/21.
//

import Foundation
import Firebase
import FirebaseDatabase

class History: Identifiable {
    let ref: DatabaseReference?
    let id: String = UUID().uuidString
    let top_3_songs: [Song]
    let top_3_artists: [Artist]
    let top_20_songs: [Song]
    let top_20_artists: [Artist]
    
    init(top_3_songs: [Song], top_3_artists: [Artist], top_20_songs: [Song], top_20_artists: [Artist]) {
        self.ref = nil
        self.top_3_songs = top_3_songs
        self.top_3_artists = top_3_artists
        self.top_20_songs = top_20_songs
        self.top_20_artists = top_20_artists
    }
//    init?(snapshot: DataSnapshot) {
//       // This is what we call a failable init because
//       // it returns nil if initialization fails
//       guard
//         let value = snapshot.value as? [String: AnyObject],
//         let top_3_songs = value["top_3_songs"] as? [Song],
//         let top_20_songs = value["top_20_songs"] as? [Song],
//         let top_3_artists = value["top_3_artists"] as? [Artist],
//        let top_20_artists = value["top_20_artists"] as? [Artist]
//      
//       else {
//         return nil
//       }
//       
//       self.ref = snapshot.ref
//        self.top_3_songs = top_3_songs
//        self.top_20_songs = top_20_songs
//        self.top_3_artists = top_3_artists
//        self.top_20_artists = top_20_artists
//     }
     
     func toAnyObject() -> Any {
       return [
         "top_3_songs": top_3_songs,
         "top_20_songs": top_20_songs,
         "top_3_artists": top_3_artists,
        "top_20_artists" : top_20_artists
       ]
     }
}
