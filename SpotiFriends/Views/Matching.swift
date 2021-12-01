//
//  Matching.swift
//  SpotiFriends
//
//  Created by Xinyi Huang on 11/1/21.
//

import SwiftUI
import FirebaseDatabase

struct Matching: View {
    var potentialMatchUser: User
    var currUser: User
    var potentialMatches:[User]
    @State var index: Int
  @ObservedObject var vm = ViewModel()
    @Binding var showModal: Bool
    
    var body: some View {
      // Get next user
//      var user = potentialMatches[index]
//      var currUser = vm.users.filter{ $0.id == vm.username  }[0]
      var res = vm.matching(currUser, potentialMatchUser)

        ScrollView{
            Text(String(res.0)+"% Match").font(.system(size: 35)).foregroundColor(.white)
            Spacer().frame(height:10)
            VStack{
                // List artists
                Text("Top 3 Artists in Common").fontWeight(.bold).foregroundColor(.white).font(.system(size: 20))
                HStack{
                    VStack{
//                        let  _ = print(user.matches.one_way_matches[0].id)
                        Image(uiImage:
                                res.1[0].artist_image
                                
//                               user.spotify_history.top_3_artists[0].artist_image
                        )
                                .resizable()
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius:10)
                                    .stroke(Color.white, lineWidth: 0)
                                    .shadow(radius: 2)
                                )
                            .frame(width: 70, height: 70)
                        //Text(user.spotify_history.top_3_artists[0].name)
                      Text(res.1[0].name)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        }
                        
                    VStack{
                        Image(uiImage: res.1[1].artist_image
                                //user.spotify_history.top_3_artists[1].artist_image
                          )
                                .resizable()
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius:10)
                                    .stroke(Color.white, lineWidth: 0)
                                    .shadow(radius: 2)
                                )
                            .frame(width: 70, height: 70)
                        //Text(user.spotify_history.top_3_artists[1].name)
                      Text(res.1[1].name)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        }
                        
                    VStack{
                        Image(uiImage: res.1[2].artist_image
                                //user.spotify_history.top_3_artists[2].artist_image
                        )
                                .resizable()
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius:10)
                                    .stroke(Color.white, lineWidth: 0)
                                    .shadow(radius: 2)
                                )
                            .frame(width: 70, height: 70)
                      //Text(user.spotify_history.top_3_artists[2].name)
                      Text(res.1[2].name)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        }
                    .frame(alignment: .center)
                }
                
                Spacer().frame(height: 20)
                
                // List songs
                Text("Top 3 Songs in Common").fontWeight(.bold).foregroundColor(.white).font(.system(size: 20))
                HStack{
                    VStack{
                        Image(uiImage: res.2[0].album_image!
                                //user.spotify_history.top_3_songs[0].album_image!
                        )
                                .resizable()
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius:10)
                                    .stroke(Color.white, lineWidth: 0)
                                    .shadow(radius: 2)
                                )
                            .frame(width: 70, height: 70)
                      Text(res.2[0].song_name)
                        //Text(user.spotify_history.top_3_songs[0].song_name)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        }
                        
                    VStack{
                        Image(uiImage: res.2[1].album_image!
                                //user.spotify_history.top_3_songs[1].album_image!
                        )
                                .resizable()
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius:10)
                                    .stroke(Color.white, lineWidth: 0)
                                    .shadow(radius: 2)
                                )
                            .frame(width: 70, height: 70)
                      Text(res.2[1].song_name)
                        //Text(user.spotify_history.top_3_songs[1].song_name)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        }
                        
                    VStack{
                        Image(uiImage: res.2[2].album_image!
                                //user.spotify_history.top_3_songs[2].album_image!
                        )
                                .resizable()
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius:10)
                                    .stroke(Color.white, lineWidth: 0)
                                    .shadow(radius: 2)
                                )
                            .frame(width: 70, height: 70)
                      Text(res.2[2].song_name)
                        //Text(user.spotify_history.top_3_songs[2].song_name)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        }
                    .frame(alignment: .center)
                }
                Spacer().frame(width: .infinity, height:10)
                }.background(Color.green)
                .cornerRadius(15)
            .frame(minWidth: 200, maxWidth: .infinity, minHeight:200, maxHeight:.infinity,alignment: .center)
                
                Spacer().frame(height:10)
                // Display User Info
                VStack{
                    Image(uiImage: potentialMatchUser.personal_info.profile_picture!)
                            .resizable()
                            .frame(width:200,height:200)
                            .clipShape(Circle())
                            .overlay(
                              Circle()
                                .stroke(Color.white, lineWidth: 0)
                                .shadow(radius: 5)
                                .frame(width:40,height:40)
                          )
                    
                    Spacer().frame(height: 20)
                    HStack{
                        Text(potentialMatchUser.personal_info.f_name + " " + potentialMatchUser.personal_info.l_name).fontWeight(.bold)
                            .foregroundColor(.white)
                        Text(String(potentialMatchUser.personal_info.age)).fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    Spacer().frame(height: 20)
                    if let bio = potentialMatchUser.personal_info.bio {
                        Text(bio).foregroundColor(.white)
                    }
                    ModalView( isShowing: $showModal, matchedUser:potentialMatchUser) 
                }
                
//            ModalView( isShowing: $showModal, matchedUser:potentialMatchUser)
            
                // Trying with buttons
//                HStack{
//                    Button(action: {increment()}) {
//                      Image(systemName: "xmark")
//                        .padding()
//                        .background(Color.red)
//                        .clipShape(Circle())
//                        .font(.largeTitle)
//                        .foregroundColor(.white)
//                    }
//                    Spacer().frame(height: 30)
//                    Button(action: {matched(user1: currUser, user2: potentialMatchUser)}) {
//                        Image(systemName: "checkmark")
//                          .padding()
//                          .background(Color.green)
//                          .clipShape(Circle())
//                          .font(.largeTitle)
//                          .foregroundColor(.white)
//                    }
//                }
            }
            .background(Color.black)
        }
    
//    func increment()  {
//        if self.index < potentialMatches.count-1  {
//            self.index += 1
//            } else {
//                self.index = 0
//            }
//        }
    
//    // user1 is you, user2 is other user
//    func matched(user1 : User, user2 : User) {
//        if (user2.matches.one_way_matches.filter{ $0.id == user1.id  }.count == 1) {
//            print("gonna have matched popup")
//            let index = user2.matches.one_way_matches.firstIndex{ $0.id == user1.id } as! Int
//            user2.matches.one_way_matches = user2.matches.one_way_matches.filter{ $0.id != user1.id  }
//            user1.matches.two_way_matches.append(user2)
//            user2.matches.two_way_matches.append(user1)
//            DispatchQueue.global(qos: .background).async {
//            let match_path = "/users/" + user2.id + "/matches/two_way_match/"+String(user2.matches.two_way_matches.count-1) + "/other_user_id"
//            let userRef = Database.database().reference().child(match_path)
//            userRef.setValue(user1.id)
//
//            let match_path2 = "/users/" + user1.id + "/matches/two_way_match/"+String(user1.matches.two_way_matches.count-1) + "/other_user_id"
//            let userRef2 = Database.database().reference().child(match_path2)
//            userRef2.setValue(user2.id)
//            // remove from one way match in db
//            let path_og = "/users/" + user2.id
//            let refToCopy = Database.database().reference().child(path_og)
//            refToCopy.observe(.value, with: {
//                (snapshot) in if let snapCast = snapshot.value as? [String:Any]{
//                    breakLabel:  if let matches = snapCast["matches"] as? [String: Any]
//                    {
//                        if let one_way = matches["one_way_match"] as? [Any] {
//                            var tmp = one_way
//                            tmp.remove(at: index)
//                            if (user2.matches.one_way_matches.count == tmp.count+1) {
//                            let path_match = "/users/" + user2.id + "/matches/one_way_match"
//                            let refToDo = Database.database().reference().child(path_match)
//                                refToDo.setValue(tmp) }
//                        }}
//
//                   }})
//            }} // end of if you are already in user2's matches
//
//        else {
//            print("first time")
//            user1.matches.one_way_matches.append(user2)
//            DispatchQueue.global(qos: .background).async {
//            let match_path2 = "/users/" + user1.id + "/matches/one_way_match/"+String(user1.matches.two_way_matches.count-1) + "/other_user_id"
//            let userRef2 = Database.database().reference().child(match_path2)
//                userRef2.setValue(user2.id) }
//        }
//    } // end of matched function
    }
    
    

