//
//  UserInfo.swift
//  SpotiFriends
//
//  Created by Xinyi Huang on 10/28/21.
//

import Foundation
import SwiftUI

class UserInfo: Identifiable {
    var f_name: String
    var l_name: String
    var age: Int
    var pronouns: String?
    var bio: String?
    var profile_picture_url: String?
    var profile_picture: Image?
    
    
    init(f_name: String, l_name: String, age: Int, pronouns: String? = nil, bio: String? = nil, profile_pic_url: String? = nil) {
        self.f_name = f_name
        self.l_name = l_name
        self.age = age
        self.pronouns = pronouns
        self.bio = bio
        self.profile_picture_url = profile_pic_url
        if let image = profile_pic_url {
            self.profile_picture = Image(image)
        }
    }
}
