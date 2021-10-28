//
//  UserInfo.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/25/21.
//

import Foundation
import Firebase
import FirebaseDatabase

class UserInfo: Identifiable {
    let ref: DatabaseReference?
    let id: String = UUID().uuidString
    let f_name: String
    let l_name: String
    let age: Int
    let pronouns: String
    let bio: String
    let profile_pic: String
    
    init(f_name: String, l_name: String, age: Int, pronouns: String, bio: String, profile_pic: String) {
        self.ref = nil
        self.f_name = f_name
        self.l_name = l_name
        self.age = age
        self.pronouns = pronouns
        self.bio = bio
        self.profile_pic = profile_pic
    }
    init?(snapshot: DataSnapshot) {
       // This is what we call a failable init because
       // it returns nil if initialization fails
       guard
         let value = snapshot.value as? [String: AnyObject],
         let f_name = value["f_name"] as? String,
         let l_name = value["l_name"] as? String,
         let age = value["age"] as? Int,
        let pronouns = value["pronouns"] as? String,
        let bio = value["bio"] as? String,
        let profile_pic = value["profile_pic"] as? String
       else {
         return nil
       }
       
       self.ref = snapshot.ref
        self.f_name = f_name
        self.l_name = l_name
        self.age = age
        self.pronouns = pronouns
        self.bio = bio
        self.profile_pic = profile_pic
     }
     
     func toAnyObject() -> Any {
       return [
         "f_name": f_name,
         "l_name": l_name,
         "age": age,
        "pronouns" : pronouns,
        "bio" : bio,
        "profile_pic" : profile_pic
       ]
     }
}

