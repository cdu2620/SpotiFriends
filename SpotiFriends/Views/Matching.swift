//
//  Matching.swift
//  SpotiFriends
//
//  Created by Xinyi Huang on 11/1/21.
//

import SwiftUI

struct Matching: View {
    var potentialMatchUser: User
    var currUser: User
  @ObservedObject var vm = ViewModel()
    
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
                        let _ = print(currUser.personal_info.f_name, potentialMatchUser.personal_info.f_name)
                        let _ = print(res.2)
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
                }
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
    }
    
    

