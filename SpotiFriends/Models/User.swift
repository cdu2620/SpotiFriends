//
//  History.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/28/21.
//

import Foundation
import Firebase
import FirebaseDatabase

class User: Identifiable,ObservableObject {
    var ref: DatabaseReference?
    var id: String
    @Published var matches: Match
    var personal_info: UserInfo
    var spotify_history: History
    
    init(id: String? = nil, matches: Match? = nil, personal_info: UserInfo? = nil, spotify_history: History? = nil) {
        self.ref = nil
        self.id = id!
        self.matches = matches!
        self.personal_info = personal_info!
        self.spotify_history = spotify_history!
    }
    
    func update(id: String, matches: Match, personal_info: UserInfo, spotify_history: History){
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
