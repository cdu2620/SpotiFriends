//
//  SpotifyHistory.swift
//  SpotiFriends
//
//  Created by Xinyi Huang on 10/28/21.
//

import Foundation

class SpotifyHistory: Identifiable {
    var top_3_songs: [Song]
//    var top_20_songs: [Song]
//    var top_3_artists: [Artist]
//    var top_20_artists: [Artist]
    
    init(songs: [Song]) {
        // fetch from database based on user ID
        self.top_3_songs = songs
    }
}
