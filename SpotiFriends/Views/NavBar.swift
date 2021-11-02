//
//  NavBar.swift
//  SpotiFriends
//
//  Created by Joanna Miao on 11/2/21.
//

import SwiftUI

struct NavBar: View {
    var potentialMatches: [User]
    var index: Int
    var user: User
    var body: some View {
//        NavigationView{
            TabView{
                MatchesList()
                    .tabItem {
                        Image(systemName: "list.bullet.indent")
                        Text("Matches")
                    }
                Matching(potentialMatches: potentialMatches, index: 0, currUser:user)
                    .tabItem {
                        Image(systemName: "plus")
                        Text("Match")
                    }
                ProfileDetail(potentialMatches: potentialMatches, user: user)
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                }
//            .navigationBarHidden(true)
        }
        
//    }
}


