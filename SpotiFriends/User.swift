//
//  User.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/19/21.
//

import Foundation
import SwiftUI

struct Users: Codable {
    let users: [User]
    
    enum CodingKeys : String, CodingKey {
        case users
    }
}

struct User: Codable, Identifiable {
    let id: Int
    let personal_info: [Info]
    let spotify_history: [History]
    
    enum CodingKeys : String, CodingKey {
        case id = "uid"
        case personal_info
        case spotify_history
    }
}

struct Info: Codable {
    let f_name: String
    let l_name: String
    let age: Int
    let pronouns: String
    let bio: String
    
    enum CodingKeys : String, CodingKey {
        case f_name
        case l_name
        case age
        case pronouns
        case bio
    }
}

struct History: Codable {
    let top_3_songs: [Song]
    let top_3_artists: [Artist]
    let top_20_songs: [Song]
    let top_20_artists: [Artist]
    enum CodingKeys : String, CodingKey {
        case top_3_songs
        case top_3_artists
        case top_20_songs
        case top_20_artists
    }
}

struct Song: Codable, Identifiable {
    let id: Int
    let song_name: String
    let artist: String
    let album_cover: String
    
    enum CodingKeys : String, CodingKey {
        case id = "song_id"
        case song_name
        case artist
        case album_cover
    }
    
}

struct Artist: Codable, Identifiable {
    let id: Int
    let name: String
    let artist_image: String
    
    enum CodingKeys : String, CodingKey {
        case id = "artist_id"
        case name
        case artist_image

    }
    
}
