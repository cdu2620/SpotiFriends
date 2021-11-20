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
    var username = ""
  
    
    func getData() {
      var top_3sg_api = [Song]()
      var top_3art_api = [Artist]()
        
        let getMe = Spartan.getMe(success: { (user) in
              // Do something with the user object
            self.username = user.id as! String
            let path2 = "/users/" + self.username + "/uid"
//            let path2 = String(format:"/users/%s/uid",username as! String)
            print(path2)
          let userRef = Database.database().reference().child(path2)
//          let path = "/users/cdu2620/personal_info/profile_pic"
            let path = "/users/" + self.username + "/personal_info/profile_pic"
          let pfpRef = Database.database().reference().child(path)
          let pfp = user.images![0].url!
              pfpRef.setValue(pfp)
            userRef.setValue(self.username)
          }, failure: { (error) in
              print(error)
          })

        
      let apiCallSongs = Spartan.getMyTopTracks(limit: 3, offset: 0, timeRange: .mediumTerm, success: { (pagingObject) in
        // Get the artists via pagingObject.items
        
        var i = 0
        for obj in pagingObject.items {
            let path = "/users/" + self.username + "/spotify_history/top_3_songs/"+String(i)
        
          let namePath = path+"/song_name"
          let nameRef = Database.database().reference().child(namePath)
          let song_name = obj.name!
          nameRef.setValue(song_name)
          
          let idPath = path+"/song_id"
          let idRef = Database.database().reference().child(idPath)
          let song_id = obj.id as! String
          idRef.setValue(song_id)
          
          let artistPath = path+"/artist"
          let artistRef = Database.database().reference().child(artistPath)
          let artist = obj.artists[0].name!
          artistRef.setValue(artist)
          
          let coverPath = path+"/album_cover"
          let coverRef = Database.database().reference().child(coverPath)
          let cover = obj.album.images[0].url!
          coverRef.setValue(cover)

          let newsong = Song(id:song_id, song_name: song_name, artist: artist, album_image_url: cover)
          top_3sg_api.append(newsong)
          i += 1
        
        }
      }, failure: { (error) in
          print(error)
      })
        
        
      
      let apiCallArtists = Spartan.getMyTopArtists(limit: 3, offset: 0, timeRange: .mediumTerm, success: { (pagingObject) in
        // Get the artists via pagingObject.items
        
        var i = 0
        for obj in pagingObject.items {
            let path = "/users/" + self.username + "/spotify_history/top_3_artists/"+String(i)
        
          let namePath = path+"/name"
          let nameRef = Database.database().reference().child(namePath)
          let name = obj.name!
          nameRef.setValue(name)
//          print(nameRef)
//          print(name)
          
          let idPath = path+"/artist_id"
          let idRef = Database.database().reference().child(idPath)
          let artist_id = obj.id as! String
          idRef.setValue(artist_id)
//          print(idRef)
          
          
          let coverPath = path+"/artist_image"
          let coverRef = Database.database().reference().child(coverPath)
          let cover = obj.images[0].url!
          coverRef.setValue(cover)
//          print(coverRef)

          let newartist = Artist(id: artist_id, name: name, artist_image_url: cover)
          top_3art_api.append(newartist)
          i += 1
        
        }
//        print(top_3art_api)
      }, failure: { (error) in
          print(error)
      })

      
      print("firebase below")
        if (self.users.count == 0) {
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
                                            let newsong = Song(id:song_id, song_name: song_name, artist: artist, album_image_url: cover)
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
                                            let newsong = Song(id:song_id, song_name: song_name, artist: artist, album_image_url: cover)
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
                                            let newart = Artist(id:artist_id, name: name, artist_image_url: image)
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
                                            let newart = Artist(id:artist_id, name: name, artist_image_url: image)
                                            top_20art.append(newart)
                                        }
                                       
                                       
                                    }
                                }
                                
                            }
                    let his = History(top_3_songs: top_3sg, top_3_artists: top_3art, top_20_songs: top_20sg, top_20_artists: top_20art)
                    
                    let temp_match = Match(one_way_matches: [User](), two_way_matches: [User]())
                    let uid = val["uid"] as! String
                            if let vals = val["personal_info"] as? [String: Any]
                            {
                                let f_name = vals["f_name"] as! String
                                let l_name = vals["l_name"] as! String
                                let age = vals["age"] as! Int
                                let pronouns = vals["pronouns"] as? String ?? ""
                                let bio = vals["bio"] as! String
                                let profile_pic = vals["profile_pic"] as! String
                                let person = UserInfo(f_name:f_name,l_name: l_name, age: age, pronouns: pronouns, bio: bio,profile_picture_url: profile_pic)
                                let one = User(id: uid, matches: temp_match, personal_info:person, spotify_history: his)
                                self.list.append(person)
                                self.users.append(one)
                            }
 
                            
                        }// end of individual user
                print("dummy")
            }})
            
          
    }
    
    } // end of getData
    
    func getMatches() {
        getData()
        let liveRef = self.ref.child("users")
        liveRef.observe(.value, with: {
            (snapshot) in if let snapCast = snapshot.value as? [String:AnyObject]{
                for snap in snapCast
                            {
                    var one_match = [User]()
                    var two_match = [User]()
                    let val = snap.value as! [String: Any]
                    let uid = val["uid"] as! String
                    let og_user = self.users.filter{ $0.id == uid }[0]
                            if let matches = val["matches"] as? [String: Any]
                            {
 
                                if let one_way = matches["one_way_match"] as? [Any] {
                                    for one in one_way {
                                        if let match = one as? [String: Any] {
                                            let user = match["other_user_id"] as! String
                                            let find = self.users.filter{ $0.id == user }[0]
                                            one_match.append(find)
                                        }
                                    }} // one way
                                
                                if let two_way = matches["two_way_match"] as? [Any] {
                                    for two in two_way {
                                        if let match = two as? [String: Any] {
                                            let user = match["other_user_id"] as! String
                                            let find = self.users.filter{ $0.id == user }[0]
                                            two_match.append(find)
                                        }
                                    }} // two way
                                
                                let users_matches = Match(one_way_matches: one_match, two_way_matches: two_match)
                                og_user.matches = users_matches
                            }
                    
                } // end of individual user
                
            }})
        print("ok")
    } // end of getmatches
 }

