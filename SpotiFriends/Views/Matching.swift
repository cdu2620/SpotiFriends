//
//  Matching.swift
//  SpotiFriends
//
//  Created by Xinyi Huang on 11/1/21.
//

import SwiftUI

struct Matching: View {
    var potentialMatches: [User]
    var index: Int
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
                let  _ = print(user.spotify_history)
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
        
        // Yes/ No buttons
        HStack{
            NavigationLink(destination: Matching(potentialMatches: potentialMatches, index: index<potentialMatches.count ? index+1: 0,currUser:currUser)) {
                Image(systemName: "checkmark")
                  .padding()
                  .background(Color.green)
                  .clipShape(Circle())
                  .font(.largeTitle)
                  .foregroundColor(.white)
            }
            NavigationLink(destination: Matching(potentialMatches: potentialMatches, index: index<potentialMatches.count ? index+1: 0,currUser:currUser)) {
                Image(systemName: "xmark")
                  .padding()
                  .background(Color.red)
                  .clipShape(Circle())
                  .font(.largeTitle)
                  .foregroundColor(.white)
            }
        }
    }
}
//        NavBar(potentialMatches: potentialMatches, index: index, user: currUser)
// Trying with buttons
//            Button(action: {}) {
//              Image(systemName: "checkmark")
//                .padding()
//                .background(Color.green)
//                .clipShape(Circle())
//                .font(.largeTitle)
//                .foregroundColor(.white)
//            }
//            Button(action: {}) {
//                Image(systemName: "xmark")
//                  .padding()
//                  .background(Color.green)
//                  .clipShape(Circle())
//                  .font(.largeTitle)
//                  .foregroundColor(.white)
//            }
//
        
        
    }
}
