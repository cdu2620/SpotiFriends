//
//  History.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/28/21.
//

import Foundation
import Firebase
import FirebaseDatabase

struct User: Identifiable {
    let ref: DatabaseReference?
    let id: String = UUID().uuidString
    let personal_info: UserInfo
    let spotify_history: History
    
    init(personal_info: UserInfo, spotify_history: History) {
        self.ref = nil
        self.personal_info = personal_info
        self.spotify_history = spotify_history
    }
    init?(snapshot: DataSnapshot) {
       // This is what we call a failable init because
       // it returns nil if initialization fails
       guard
         let value = snapshot.value as? [String: AnyObject],
         let personal_info = value["personal_info"] as? UserInfo,
         let spotify_history = value["spotify_history"] as? History
      
       else {
         return nil
       }
       
       self.ref = snapshot.ref
        self.personal_info = personal_info
        self.spotify_history = spotify_history
     }
     
     func toAnyObject() -> Any {
       return [
         "personal_info": personal_info,
         "spotify_history": spotify_history
       ]
     }
}
