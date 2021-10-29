//
//  ProfileDetail.swift
//  SpotiFriends
//
//  Created by Xinyi Huang on 10/29/21.
//

import SwiftUI


struct ProfileDetail: View {
    
    // temporary - iniitialize spotifyHistory within User Class later
    var user: UserInfo
    var spotifyHistory: SpotifyHistory
    
    var body: some View {
        VStack{
            Image(uiImage: user.profile_picture!)
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                      Circle()
                        .stroke(Color.white, lineWidth: 4)
                        .shadow(radius: 5)
                  )
            }
            
            Spacer().frame(height: 50)
            HStack{
                Text(user.f_name + " " + user.l_name).fontWeight(.bold)
                Text(String(user.age)).fontWeight(.bold)
            }
            Spacer().frame(height: 30)
            if let bio = user.bio {
                Text(bio)
            }
            Spacer().frame(height: 50)
//            HStack{
//                Text("Your Top 3 Artists: ").fontWeight(.bold)
//                Button(action: {}) {
//                  Text("Edit")
//                }
//            }
//            HStack{
//                VStack{
//                    user.spotify_history.top_3_artists[0].artist_picture
//                        .resizable()
//                        .scaledToFit()
//                        .clipShape(Circle())
//                        .overlay(
//                          Circle()
//                            .stroke(Color.white, lineWidth: 4)
//                            .shadow(radius: 2)
//                        )
//                    Text(user.spotify_history.top_3_artists[0].name)
//                }
//                VStack{
//                    user.spotify_history.top_3_artists[1].artist_picture
//                        .resizable()
//                        .scaledToFit()
//                        .clipShape(Circle())
//                        .overlay(
//                          Circle()
//                            .stroke(Color.white, lineWidth: 4)
//                            .shadow(radius: 2)
//                        )
//                    Text(user.spotify_history.top_3_artists[1].name)
//                }
//                VStack{
//                    user.spotify_history.top_3_artists[2].artist_picture
//                        .resizable()
//                        .scaledToFit()
//                        .clipShape(Circle())
//                        .overlay(
//                          Circle()
//                            .stroke(Color.white, lineWidth: 4)
//                            .shadow(radius: 2)
//                        )
//                    Text(user.spotify_history.top_3_artists[2].name)
//                }
//            }
//
            HStack{
                VStack{
                    Image(uiImage: spotifyHistory.top_3_songs[0].album_image!)
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                              Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .shadow(radius: 5)
                          )
                    }
                    Text(spotifyHistory.top_3_songs[0].song_name)
                VStack{
                    Image(uiImage: spotifyHistory.top_3_songs[1].album_image!)
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                              Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .shadow(radius: 5)
                          )
                    }
                    Text(spotifyHistory.top_3_songs[1].song_name)
                VStack{
                    Image(uiImage: spotifyHistory.top_3_songs[2].album_image!)
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                              Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .shadow(radius: 5)
                          )
                    }
                    Text(spotifyHistory.top_3_songs[2].song_name)
                }
            }
//
//
//        }
//    }
//}
//
//struct ProfileDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileDetails()
    }


