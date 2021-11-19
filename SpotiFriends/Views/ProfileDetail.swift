//
//  ProfileDetail.swift
//  SpotiFriends
//
//  Created by Xinyi Huang on 10/29/21.
//
import SwiftUI

//struct ButtonOverlay: View {
////    var user: User
//  var body: some View {
//    ZStack {
//        NavigationLink(destination: EditProfile(currUser: testUser) ) {
//              Image(systemName: "pencil")
//                .padding()
//                .background(Color.green)
//                .clipShape(Circle())
//                .font(.largeTitle)
//                .foregroundColor(.white)
//        }
//    }
//  }
//}

struct ProfileDetail: View {
    var potentialMatches: [User]
    var user: User
    
    var body: some View {
      ScrollView{
        ZStack {
            NavigationLink(destination: EditProfile(currUser: user) ) {
                  Image(systemName: "pencil")
                    .padding()
                    .background(Color.green)
                    .clipShape(Circle())
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
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
//                .overlay(ButtonOverlay(), alignment: .topTrailing)
            
            } // end of VStack
            
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
            VStack{
                HStack{
                    Text("Your Top 3 Artists: ").fontWeight(.bold).foregroundColor(.white)
                }
            
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
                    }
                .frame(alignment: .center)
                
            }
            
            Spacer().frame(height: 30)
        
        VStack{
            HStack{
                Text("Your Top 3 Songs: ").fontWeight(.bold).foregroundColor(.white)
            }
        
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
        .background(Color.black)
        }
    }
}
