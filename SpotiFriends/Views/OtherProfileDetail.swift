//
//  OtherProfileDetail.swift
//  SpotiFriends
//
//  Created by Aiyana Huang on 11/13/21.
//

import SwiftUI

struct OtherProfileDetail: View {
    var user: User
    var matchScore: Int
    var body: some View {
        ScrollView{
            ZStack{
            VStack{
                VStack{
                    Image(uiImage: user.personal_info.profile_picture!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height:300)
                            .clipShape(Circle())
                            .overlay(
                              Circle()
                                .stroke(Color.white, lineWidth: 0)
                                .shadow(radius: 5)
                          )
                    }
//                    Spacer().frame(height: 20)
//                    Button(action:{ openMessages()}){
//                            Image(systemName: "message")
//                    }
                    Spacer().frame(height: 20)
                    HStack{
                        Text(user.personal_info.f_name + " " + user.personal_info.l_name).fontWeight(.bold).foregroundColor(.white).font(.system(size: 30))
                        Spacer().frame(width: 40)
                    Text(String(user.personal_info.age)).fontWeight(.bold).foregroundColor(.white).font(.system(size: 30))
                    }
                    Spacer().frame(height: 10)
                    if let bio = user.personal_info.bio {
                        Text(bio).foregroundColor(.white)
                    }
                    Spacer().frame(height: 30)
                    Text(String(matchScore)+"% Match").foregroundColor(.white).font(.system(size: 25))
                    Spacer().frame(height: 30)
                    VStack {
                    VStack{
                        Text("Their Top 3 Artists:").fontWeight(.bold).foregroundColor(.white)
                        HStack{
                            VStack{
                                Image(uiImage: user.spotify_history.top_3_artists[0].artist_image)
                                        .resizable()
                                    .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius:10)
                                            .stroke(Color.white, lineWidth: 0)
                                            .shadow(radius: 2)
                                        )
                                        .frame(width: 80, height: 80)
                                Text(user.spotify_history.top_3_artists[0].name)
                                    .multilineTextAlignment(.center).foregroundColor(.white).fixedSize(horizontal: false, vertical: true)
                                }
                            Spacer().frame(width:UIScreen.main.bounds.size.width/10)
                                
                            VStack{
                                Image(uiImage: user.spotify_history.top_3_artists[1].artist_image)
                                    .resizable()
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius:10)
                                        .stroke(Color.white, lineWidth: 0)
                                        .shadow(radius: 2)
                                    )
                                    .frame(width: 80, height: 80)
                                Text(user.spotify_history.top_3_artists[1].name)
                                    .multilineTextAlignment(.center).foregroundColor(.white).fixedSize(horizontal: false, vertical: true)
                                }
                            Spacer().frame(width:UIScreen.main.bounds.size.width/10)
                                
                            VStack{
                                Image(uiImage: user.spotify_history.top_3_artists[2].artist_image)
                                    .resizable()
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius:10)
                                        .stroke(Color.white, lineWidth: 0)
                                        .shadow(radius: 2)
                                    )
                                    .frame(width: 80, height: 80)
                                Text(user.spotify_history.top_3_artists[2].name)
                                    .multilineTextAlignment(.center).foregroundColor(.white).fixedSize(horizontal: false, vertical: true)
                                }
                            Spacer().frame(width:UIScreen.main.bounds.size.width/10)
                            }.frame(alignment: .center)
                    }
                    
                    Spacer().frame(height: 30)
                
                VStack{
                    Text("Their Top 3 Songs: ").fontWeight(.bold).foregroundColor(.white)
                    HStack{
                        VStack{
                            Image(uiImage: user.spotify_history.top_3_songs[0].album_image!)
                                .resizable()
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius:10)
                                    .stroke(Color.white, lineWidth: 0)
                                    .shadow(radius: 2)
                                )
                                .frame(width: 80, height: 80)
                            Text(user.spotify_history.top_3_songs[0].song_name)
                                .multilineTextAlignment(.center).foregroundColor(.white).fixedSize(horizontal: false, vertical: true)
                            }
                        Spacer().frame(width:UIScreen.main.bounds.size.width/10)
                        VStack{
                            Image(uiImage: user.spotify_history.top_3_songs[1].album_image!)
                                .resizable()
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius:10)
                                    .stroke(Color.white, lineWidth: 0)
                                    .shadow(radius: 2)
                                )
                                .frame(width: 80, height: 80)
                            Text(user.spotify_history.top_3_songs[1].song_name)
                                .multilineTextAlignment(.center).foregroundColor(.white).fixedSize(horizontal: false, vertical: true)
                            }
                        Spacer().frame(width:UIScreen.main.bounds.size.width/10)
                        VStack{
                            Image(uiImage: user.spotify_history.top_3_songs[2].album_image!)
                                .resizable()
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius:10)
                                    .stroke(Color.white, lineWidth: 0)
                                    .shadow(radius: 2)
                                )
                                .frame(width: 80, height: 80)
                            Text(user.spotify_history.top_3_songs[2].song_name)
                                .multilineTextAlignment(.center).foregroundColor(.white).fixedSize(horizontal: false, vertical: true)
                            }
                        Spacer().frame(width:UIScreen.main.bounds.size.width/10)
                        }
                    .frame(alignment: .center)
                }
              }
                    .background(Color.gray)
                    .cornerRadius(15)
                .frame(minWidth: 200, maxWidth: .infinity, minHeight:200, maxHeight:.infinity,alignment: .center)
            }
            
            }
            VStack{
                Spacer().frame(height: 20)
                Button(action:{openMessages()}, label: {
                    Text("Message")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .overlay(RoundedRectangle(cornerRadius: 10))
                })
                .buttonStyle(PlainButtonStyle())
//                .background(Color.green)
//                .overlay(RoundedRectangle(cornerRadius: 10))

//                .background(Color.green)
                
            }
           
//            .background(Color.black)
            }
          }
    }
