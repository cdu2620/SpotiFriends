//
//  UserInfo.swift
//  SpotiFriends
//
//  Created by Xinyi Huang on 10/28/21.
//
import Foundation
import SwiftUI
import Firebase
import FirebaseDatabase

class UserInfo: Identifiable {
  
    var ref: DatabaseReference?
//    var id = UUID().uuidString
    var f_name: String
    var l_name: String
    var age: Int
    var pronouns: String?
    var bio: String?
    var profile_picture_url: String?
    var profile_picture: UIImage?
    
    
    init(f_name: String, l_name: String, age: Int, pronouns: String? = nil, bio: String? = nil, profile_picture_url: String? = nil) {
        
        self.f_name = f_name
        self.l_name = l_name
        self.age = age
        self.pronouns = pronouns
        self.bio = bio
        self.profile_picture_url = profile_picture_url
        
        let url = URL(string: self.profile_picture_url!)
        let data = try? Data(contentsOf:url!)
        if let imageData = data {
            self.profile_picture = UIImage(data: imageData)
        }
    }

//    init?(snapshot: DataSnapshot) {
//          // This is what we call a failable init because
//          // it returns nil if initialization fails
//          guard
//            let value = snapshot.value as? [String: AnyObject],
//            let f_name = value["f_name"] as? String,
//            let l_name = value["l_name"] as? String,
//            let age = value["age"] as? Int,
//            let pronouns = value["pronouns"] as? String,
//            let bio = value["bio"] as? String,
//            let profile_picture_url = value["profile_picture_url"] as? String
//          else {
//            return nil
//          }
//          
//          self.ref = snapshot.ref
//          self.f_name = f_name
//          self.l_name = l_name
//          self.age = age
//          self.pronouns = pronouns
//          self.bio = bio
//          self.profile_picture_url = profile_picture_url
//          let url = URL(string: self.profile_picture_url!)
//          let data = try? Data(contentsOf:url!)
//          if let imageData = data {
//              self.profile_picture = UIImage(data: imageData)
//          }
//          
//        }
        
        func toAnyObject() -> Any {
          return [
            "f_name": f_name,
            "l_name": l_name,
            "age": age,
            "pronouns" : pronouns,
            "bio" : bio,
            "profile_picture_url" : profile_picture_url
          ]
        }
    }
