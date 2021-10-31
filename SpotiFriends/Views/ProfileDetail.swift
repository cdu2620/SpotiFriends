//
//  ProfileDetail.swift
//  SpotiFriends
//
//  Created by Xinyi Huang on 10/29/21.
//
import SwiftUI


struct ProfileDetail: View {
    
    var user: User
    
    var body: some View {
        VStack{
            Image(uiImage: user.personal_info.profile_picture!)
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
                Text(user.personal_info.f_name + " " + user.personal_info.l_name).fontWeight(.bold)
                Text(String(user.personal_info.age)).fontWeight(.bold)
            }
            Spacer().frame(height: 30)
            if let bio = user.personal_info.bio {
                Text(bio)
            }
            Spacer().frame(height: 50)
        
            HStack{
                Text("Your Top 3 Artists: ").fontWeight(.bold)
                Button(action: {}) {
                  Text("Edit")
                }
            }
        
            HStack{
                VStack{
                    Image(uiImage: user.spotify_history.top_3_artists[0].artist_image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                              Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .shadow(radius: 5)
                            )
                    Text(user.spotify_history.top_3_artists[0].name)
                    }
                    
                VStack{
                    Image(uiImage: user.spotify_history.top_3_artists[1].artist_image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                              Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .shadow(radius: 5)
                            )
                    Text(user.spotify_history.top_3_artists[1].name)
                    }
                    
                VStack{
                    Image(uiImage: user.spotify_history.top_3_artists[2].artist_image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                              Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .shadow(radius: 5)
                          )
                    Text(user.spotify_history.top_3_artists[2].name)
                    }
                Spacer().frame(height: 30)
                }
            
            
            HStack{
                Text("Your Top 3 Songs: ").fontWeight(.bold)
                Button(action: {}) {
                  Text("Edit")
                }
            }

            HStack{
                VStack{
                    Image(uiImage: user.spotify_history.top_3_songs[0].album_image!)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                              Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .shadow(radius: 5)
                          )
                    Text(user.spotify_history.top_3_songs[0].song_name)
                    }
                    
                VStack{
                    Image(uiImage: user.spotify_history.top_3_songs[1].album_image!)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                              Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .shadow(radius: 5)
                          )
                    Text(user.spotify_history.top_3_songs[1].song_name)
                    }
                    
                VStack{
                    Image(uiImage: user.spotify_history.top_3_songs[2].album_image!)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                              Circle()
                                .stroke(Color.white, lineWidth: 4)
                                .shadow(radius: 5)
                          )
                    Text(user.spotify_history.top_3_songs[2].song_name)
                    }
                }
            


//        }
//    }
//}
//
//struct ProfileDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileDetails()
    }
}
