//
//  UserInfo.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/25/21.
//

import Foundation

struct UserInfo: Codable, Identifiable {
    let id: String
    let f_name: String
    let l_name: String
    let age: Int
    let pronouns: String
    let bio: String
    let profile_pic: String
    
    enum CodingKeys : String, CodingKey {
        case id
        case f_name = "display_name"
        case l_name
        case age
        case pronouns
        case bio
        case profile_pic = "url"
    }
}

