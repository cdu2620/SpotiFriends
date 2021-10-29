//
//  ContentView.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/12/21.
//

import SwiftUI

struct ContentView: View {
    
    var testUser = UserInfo(id: "22jaysu5sxmznflflhhjku5my", f_name: "Aiyana", l_name: "Huang", age: 21, pronouns: "she/her", bio: "yo whats up", profile_pic_url: "https://scontent-ort2-1.xx.fbcdn.net/v/t1.6435-1/p320x320/72964043_1179102052281709_2306759581004464128_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=0c64ff&_nc_ohc=2_twbjg_vTEAX8CO-26&_nc_ht=scontent-ort2-1.xx&edm=AP4hL3IEAAAA&oh=ca648c5bf17a2f80961ed31033d861ad&oe=61944E9B")
    var testSong1 = Song(id:"3mtDgtcl4bxDN73kIM216g", song_name: "Celebrity", artist: "IU", album_image_url: "https://i.scdn.co/image/ab67616d000048512fda07910d40ee81e620fe3f")
    var testSong2 = Song(id:"3mtDgtcl4bxDN73kIM216a", song_name: "Afterglow", artist: "Ed Sheeran", album_image_url: "https://i.scdn.co/image/ab67616d0000485188e170d5ced543d191593fc8")
    var testSong3 = Song(id:"3mtDgtcl4bxDN73kIM216b", song_name: "thank u, next", artist: "Ariana Grande", album_image_url: "https://i.scdn.co/image/ab67616d0000485156ac7b86e090f307e218e9c8")
    
    
    var body: some View {
        var listOfSongs = [testSong1, testSong2, testSong3]
        var spotifyHistory = SpotifyHistory(songs: listOfSongs)
        
        NavigationView{
            NavigationLink(
                destination: ProfileDetail(user: testUser, spotifyHistory: spotifyHistory),
                label: {
                    Text("Navigate")
                })
        }
//        Text("Spotifriends")
//            .padding()
//        Spacer()
//        Text("Click to login")
//            .padding()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
