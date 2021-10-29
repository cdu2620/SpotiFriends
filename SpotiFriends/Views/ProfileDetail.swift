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
        // Display User Info
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
        
            // Display Top 3 Artists
            HStack{
                VStack{
                    if let imageData = spotifyHistory.top_3_artists[0].artist_image {
                        Image(uiImage: UIImage(data: imageData)!)
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay(
                                  Circle()
                                    .stroke(Color.white, lineWidth: 4)
                                    .shadow(radius: 5)
                              )
                        }
                    Text(spotifyHistory.top_3_artists[0].name)
                }
                VStack{
                    if let imageData = spotifyHistory.top_3_artists[1].artist_image {
                        Image(uiImage: UIImage(data: imageData)!)
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay(
                                  Circle()
                                    .stroke(Color.white, lineWidth: 4)
                                    .shadow(radius: 5)
                              )
                        }
                    Text(spotifyHistory.top_3_artists[1].name)
                }
                VStack{
                    if let imageData = spotifyHistory.top_3_artists[2].artist_image {
                        Image(uiImage: UIImage(data: imageData)!)
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay(
                                  Circle()
                                    .stroke(Color.white, lineWidth: 4)
                                    .shadow(radius: 5)
                              )
                        }
                    Text(spotifyHistory.top_3_artists[2].name)
                }
            }
        
            // Display Top 3 Songs
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
                    Text(spotifyHistory.top_3_songs[0].song_name)
                }
                VStack{
                    Image(uiImage: spotifyHistory.top_3_songs[1].album_image!)
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                              Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .shadow(radius: 5)
                          )
                    Text(spotifyHistory.top_3_songs[0].song_name)
                }
                VStack{
                    Image(uiImage: spotifyHistory.top_3_songs[2].album_image!)
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                              Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .shadow(radius: 5)
                          )
                    Text(spotifyHistory.top_3_songs[0].song_name)
                    }
                }
            }
