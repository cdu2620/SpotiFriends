//
//  ViewController.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/25/21.
//

import SwiftUI
import UIKit
import Foundation
import FirebaseFirestore
import FirebaseDatabase
import Spartan

class ViewModel: ObservableObject {
    @Published var list = [UserInfo]()
    @Published var users = [User]()
    let ref = Database.database().reference()

  
    
    func getData() {
      
        
        _ = Spartan.getMyTopArtists(limit: 20, offset: 0, timeRange: .mediumTerm, success: { (pagingObject) in
            // Get the artists via pagingObject.items
        }, failure: { (error) in
            print(error)
        })
        let liveRef = self.ref.child("users")
        liveRef.observe(.value, with: {
            (snapshot) in if let snapCast = snapshot.value as? [String:AnyObject]{
                for snap in snapCast
                            {
                    var top_3sg = [Song]()
                    var top_3art = [Artist]()
                    var top_20sg = [Song]()
                    var top_20art = [Artist]()
                    let val = snap.value as! [String: Any]
                            if let history = val["spotify_history"] as? [String: Any]
                            {
 
                                if let top_3s = history["top_3_songs"] as? [Any] {
                                    for top in top_3s {
                                        if let song = top as? [String: Any] {
                                            let song_id = song["song_id"] as! String
                                            let song_name = song["song_name"] as! String
                                                                    let artist = song["artist"] as! String
                                            let cover = song["album_cover"] as! String
                                            let newsong = Song(id:song_id, song_name: song_name, artist: artist, album_cover: cover)
                                            top_3sg.append(newsong)
                                        }
                                       
                                       
                                    }
                                }
                                
                                if let top_20s = history["top_20_songs"] as? [Any] {
                                    for top in top_20s {
                                        if let song = top as? [String: Any] {
                                            let song_id = song["song_id"] as! String
                                            let song_name = song["song_name"] as! String
                                                                    let artist = song["artist"] as! String
                                            let cover = song["album_cover"] as! String
                                            let newsong = Song(id:song_id, song_name: song_name, artist: artist, album_cover: cover)
                                            top_20sg.append(newsong)
                                        }
                                       
                                       
                                    }
                                }
                                
                                if let top_3arts = history["top_3_artists"] as? [Any] {
                                    for top in top_3arts {
                                        if let art = top as? [String: Any] {
                                            let artist_id = art["artist_id"] as! String
                                            let name = art["name"] as! String
                                            let image = art["artist_image"] as! String
                                            let newart = Artist(id:artist_id, name: name, artist_image: image)
                                            top_3art.append(newart)
                                        }
                                       
                                       
                                    }
                                }
                                
                                if let top_20arts = history["top_20_artists"] as? [Any] {
                                    for top in top_20arts {
                                        if let art = top as? [String: Any] {
                                            let artist_id = art["artist_id"] as! String
                                            let name = art["name"] as! String
                                            let image = art["artist_image"] as! String
                                            let newart = Artist(id:artist_id, name: name, artist_image: image)
                                            top_20art.append(newart)
                                        }
                                       
                                       
                                    }
                                }
                                
                            }
                    let his = History(top_3_songs: top_3sg, top_3_artists: top_3art, top_20_songs: top_20sg, top_20_artists: top_20art)

                            if let vals = val["personal_info"] as? [String: Any]
                            {
                                let f_name = vals["f_name"] as! String
                                let l_name = vals["l_name"] as! String
                                let age = vals["age"] as! Int
                                let pronouns = vals["pronouns"] as? String ?? ""
                                let bio = vals["bio"] as! String
                                let profile_pic = vals["profile_pic"] as! String
                                let person = UserInfo(f_name:f_name,l_name: l_name, age: age, pronouns: pronouns, bio: bio, profile_pic: profile_pic)
                                let one = User(personal_info:person, spotify_history: his)
                                self.list.append(person)
                                self.users.append(one)
                            }
 
                            
                        } // end of individual user
                print(self.users[0].personal_info.age)
            }})
    }
    
}

