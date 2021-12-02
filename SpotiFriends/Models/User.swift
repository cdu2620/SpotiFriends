//
//  History.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/28/21.
//

import Foundation
import Firebase
import FirebaseDatabase

class User: Identifiable, ObservableObject {
    let ref: DatabaseReference?
    let id: String
    @Published var matches: Match
    let personal_info: UserInfo
    let spotify_history: History
    
    init(id: String, matches: Match, personal_info: UserInfo, spotify_history: History) {
        self.ref = nil
        self.id = id
        self.matches = matches
        self.personal_info = personal_info
        self.spotify_history = spotify_history
    }
  
     func toAnyObject() -> Any {
       return [
        "id" : id,
        "matches" : matches,
         "personal_info": personal_info,
         "spotify_history": spotify_history
       ]
     }
}
