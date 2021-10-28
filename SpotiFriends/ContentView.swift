//
//  ContentView.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/12/21.
//

import SwiftUI

struct ContentView: View {
    
    var testUser = UserInfo(f_name: "Aiyana", l_name: "Huang", age: 21, pronouns: "she/her", bio: "yo whats up", profile_pic_url: "https://scontent-ort2-1.xx.fbcdn.net/v/t1.6435-1/p320x320/72964043_1179102052281709_2306759581004464128_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=0c64ff&_nc_ohc=2_twbjg_vTEAX8CO-26&_nc_ht=scontent-ort2-1.xx&edm=AP4hL3IEAAAA&oh=ca648c5bf17a2f80961ed31033d861ad&oe=61944E9B")
    
    var body: some View {
        NavigationView{
            NavigationLink(
                destination: ProfileDetails(user: testUser),
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
