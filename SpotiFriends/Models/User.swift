////
////  User.swift
////  SpotiFriends
////
////  Created by Catherine D on 10/19/21.
////
//
//import Foundation
//import SwiftUI
//
//// Database of all users on the SpotiFriends app
//struct Users: Codable {
//    let users: [User]
//
//    enum CodingKeys : String, CodingKey {
//        case users
//    }
//}
//
//// An individual user has personal information, the list of people they've matched with, and their Spotify top artists/songs
//struct User: Codable, Identifiable {
//    let id: Int
//    let personal_info: Info
//    let matches: Matches
//    let spotify_history: History
//
//    enum CodingKeys : String, CodingKey {
//        case id = "uid"
//        case personal_info
//        case matches
//        case spotify_history = "items"
//    }
//}
//
//// In the list of matches, we indicate if both parties have matchedd, or just the first user has matched.
//struct Matches: Codable {
//    let two_way_match: [Match]
//    let one_way_match: [Match]
//    enum CodingKeys : String, CodingKey {
//        case two_way_match
//        case one_way_match
//    }
//}
//
////In a match, we know the other person's user ID (refer to struct User) as well as the % match score.
//struct Match: Codable {
//    let other_user_id: Int
//    let score: Int
//    enum CodingKeys : String, CodingKey {
//        case other_user_id
//        case score
//    }
//}
//
////The personal info section contains the person's first name, last name, age, pronouns, bio and profile picture. The name & profile picture will be populated by an external API call.
//struct Info: Codable {
//    let f_name: String
//    let l_name: String
//    let age: Int
//    let pronouns: String
//    let bio: String
//    let profile_pic: String
//
//    enum CodingKeys : String, CodingKey {
//        case f_name = "display_name"
//        case l_name
//        case age
//        case pronouns
//        case bio
//        case profile_pic = "url"
//    }
//}
//
////The history contains the top 3 songs/artists to be displayed on the user's own profile, as well as the top 20 songs/artists to be used in comparison with other users.
//
//struct History: Codable {
//    let top_3_songs: [Song]
//    let top_3_artists: [Artist]
//    let top_20_songs: [Song]
//    let top_20_artists: [Artist]
//    enum CodingKeys : String, CodingKey {
//        case top_3_songs
//        case top_3_artists
//        case top_20_songs
//        case top_20_artists
//    }
//}
//
//// The song data will be populated by an external API call; namely, we want to store the song ID, name, artist and cover art.
//struct Song: Codable, Identifiable {
//    let id: String
//    let song_name: String
//    let artist: String
//    let album_cover: String
//
//    enum CodingKeys : String, CodingKey {
//        case id
//        case song_name = "name"
//        case artist
//        case album_cover = "url"
//    }
//
//}
//
//// The artist data will be populated by an external API call; namely, we want to store the artist ID, name, and cover art.
//struct Artist: Codable, Identifiable {
//    let id: String
//    let name: String
//    let artist_image: String
//
//    enum CodingKeys : String, CodingKey {
//        case id
//        case name
//        case artist_image = "url"
//
//    }
//
//}
