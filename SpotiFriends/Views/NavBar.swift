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
    
    init(potentialMatches:[User], index: Int, user: User) {
        UITabBar.appearance().backgroundColor = .clear
        self.potentialMatches = potentialMatches
        self.index = index
        self.user = user
    }
    var body: some View {
//        NavigationView{
            TabView{
                MatchesList(currUser:user)
                    .tabItem {
                        Image(systemName: "list.bullet.indent")
                        Text("Matches")
                    }
//                Matching(potentialMatches: potentialMatches, index: 0, currUser:user)
                  SwipeView(potentialMatches: potentialMatches, currUser: user)
                    .tabItem {
                        Image(systemName: "plus")
                        Text("Match")
                    }
                ProfileDetail(user: user)
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                }
            .background(Color.black)
            .environment(\.horizontalSizeClass, .compact)
//            .navigationBarHidden(true)
        }
        
//    }
}


