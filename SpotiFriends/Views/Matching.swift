//
//  Matching.swift
//  SpotiFriends
//
//  Created by Xinyi Huang on 11/1/21.
//

import SwiftUI
import FirebaseDatabase

struct Matching: View {
    var potentialMatches: [User]
    @State var index: Int
    var currUser: User
    
    var body: some View {
        // Get next user
        var user = potentialMatches[index]
        ScrollView{
            VStack{
                Text("72% Match").fontWeight(.bold).font(.system(size: 60))
                // List artists
                Text("Top 3 Artists in Common").fontWeight(.bold)
                HStack{
                    VStack{
                        let  _ = print(currUser.matches.two_way_matches[0].id)
                        Image(uiImage: user.spotify_history.top_3_artists[0].artist_image)
                                .resizable()
                                .clipShape(Circle())
                                .overlay(
                                  Circle()
                                    .stroke(Color.white, lineWidth: 4)
                                    .shadow(radius: 7)
                                )
                            .frame(width: 50, height: 50)
                        Text(user.spotify_history.top_3_artists[0].name)
                            .multilineTextAlignment(.center)
                        }
                        
                    VStack{
                        Image(uiImage: user.spotify_history.top_3_artists[1].artist_image)
                                .resizable()
                                .clipShape(Circle())
                                .overlay(
                                  Circle()
                                    .stroke(Color.white, lineWidth: 4)
                                    .shadow(radius: 7)
                                )
                            .frame(width: 50, height: 50)
                        Text(user.spotify_history.top_3_artists[1].name)
                            .multilineTextAlignment(.center)
                        }
                        
                    VStack{
                        Image(uiImage: user.spotify_history.top_3_artists[2].artist_image)
                                .resizable()
                                .clipShape(Circle())
                                .overlay(
                                  Circle()
                                    .stroke(Color.white, lineWidth: 4)
                                    .shadow(radius: 7)
                              )
                            .frame(width: 50, height: 50)
                        Text(user.spotify_history.top_3_artists[2].name)
                            .multilineTextAlignment(.center)
                        }
                    .frame(alignment: .center)
                }
                
                Spacer().frame(height: 40)
                
                // List songs
                Text("Top 3 Songs in Common").fontWeight(.bold)
                HStack{
                    VStack{
                        Image(uiImage: user.spotify_history.top_3_songs[0].album_image!)
                                .resizable()
                                .clipShape(Circle())
                                .overlay(
                                  Circle()
                                    .stroke(Color.white, lineWidth: 4)
                                    .shadow(radius: 7)
                              )
                            .frame(width: 50, height: 50)
                        Text(user.spotify_history.top_3_songs[0].song_name)
                            .multilineTextAlignment(.center)
                        }
                        
                    VStack{
                        Image(uiImage: user.spotify_history.top_3_songs[1].album_image!)
                                .resizable()
                                .clipShape(Circle())
                                .overlay(
                                  Circle()
                                    .stroke(Color.white, lineWidth: 4)
                                    .shadow(radius: 7)
                              )
                            .frame(width: 50, height: 50)
                        Text(user.spotify_history.top_3_songs[1].song_name)
                            .multilineTextAlignment(.center)
                        }
                        
                    VStack{
                        Image(uiImage: user.spotify_history.top_3_songs[2].album_image!)
                                .resizable()
                                .clipShape(Circle())
                                .overlay(
                                  Circle()
                                    .stroke(Color.white, lineWidth: 4)
                                    .shadow(radius: 7)
                              )
                            .frame(width: 50, height: 50)
                        Text(user.spotify_history.top_3_songs[2].song_name)
                            .multilineTextAlignment(.center)
                        }
                    .frame(alignment: .center)
                }
                
                // Display User Info
                VStack{
                    Image(uiImage: user.personal_info.profile_picture!)
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                              Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .shadow(radius: 10)
                          )
                    
                    Spacer().frame(height: 50)
                    HStack{
                        Text(user.personal_info.f_name + " " + user.personal_info.l_name).fontWeight(.bold)
                        Text(String(user.personal_info.age)).fontWeight(.bold)
                    }
                    Spacer().frame(height: 30)
                    if let bio = user.personal_info.bio {
                        Text(bio)
                    }
                }
                // Trying with buttons
                HStack{
                    Button(action: {increment()}) {
                      Image(systemName: "xmark")
                        .padding()
                        .background(Color.red)
                        .clipShape(Circle())
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    }
                    Spacer().frame(height: 30)
                    Button(action: {matched(user1: currUser, user2: user)}) {
                        Image(systemName: "checkmark")
                          .padding()
                          .background(Color.green)
                          .clipShape(Circle())
                          .font(.largeTitle)
                          .foregroundColor(.white)
                    }
                }
            }
        }
    }
    // user1 is you, user2 is other user
    func matched(user1 : User, user2 : User) {
        if (user2.matches.one_way_matches.filter{ $0.id == user1.id  }.count == 1) {
            print("gonna have matched popup")
            let index = user2.matches.one_way_matches.firstIndex{ $0.id == user1.id } as! Int
            user2.matches.one_way_matches = user2.matches.one_way_matches.filter{ $0.id != user1.id  }
            user1.matches.two_way_matches.append(user2)
            user2.matches.two_way_matches.append(user1)
            DispatchQueue.global(qos: .background).async{
                let match_path = "/users/" + user2.id + "/matches/two_way_match/"+String(user2.matches.two_way_matches.count-1) + "/other_user_id"
                let userRef = Database.database().reference().child(match_path)
                userRef.setValue(user1.id)

                let match_path2 = "/users/" + user1.id + "/matches/two_way_match/"+String(user1.matches.two_way_matches.count-1) + "/other_user_id"
                let userRef2 = Database.database().reference().child(match_path2)
                userRef2.setValue(user2.id)
                // remove from one way match in db
                let path_og = "/users/" + user2.id
                let refToCopy = Database.database().reference().child(path_og)
                refToCopy.observe(.value, with: {
                    (snapshot) in if let snapCast = snapshot.value as? [String:Any]{
                        breakLabel:  if let matches = snapCast["matches"] as? [String: Any]
                        {
                            if let one_way = matches["one_way_match"] as? [Any] {
                                var tmp = one_way
                                if (user2.matches.one_way_matches.count == tmp.count) {
                                tmp.remove(at: index)

                                let path_match = "/users/" + user2.id + "/matches/one_way_match"
                                let refToDo = Database.database().reference().child(path_match)
                                    refToDo.setValue(tmp) }
                            }}
                        
                       }})
                
            } // end of dispatch queue
        } // end of if you are already in user2's matches
        
        else {
            print("first time")
            user1.matches.one_way_matches.append(user2)
            DispatchQueue.global(qos: .background).async{
            let match_path2 = "/users/" + user1.id + "/matches/one_way_match/"+String(user1.matches.two_way_matches.count-1) + "/other_user_id"
            let userRef2 = Database.database().reference().child(match_path2)
                userRef2.setValue(user2.id) }
        }
        increment()
    } // end of matched function
    
    func increment()  {
        if self.index < potentialMatches.count-1  {
            self.index += 1
        } else {
            self.index = 0
        }
    }
}
