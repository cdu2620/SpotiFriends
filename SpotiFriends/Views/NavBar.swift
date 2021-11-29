//
//  NavBar.swift
//  SpotiFriends
//
//  Created by Joanna Miao on 11/2/21.
//

import SwiftUI

struct NavBar: View {
    @State var potentialMatches: [User]
    var index: Int
    @State var user: User
    
    init(potentialMatches:[User], index: Int, user: User) {
        UITabBar.appearance().backgroundColor = .clear
        _potentialMatches = State(initialValue: potentialMatches)
        self.index = index
        _user = State(initialValue: user)
    }
    var body: some View {
//        NavigationView{
            TabView{
                MatchesList(currUser: $user)
                    .tabItem {
                        Image(systemName: "list.bullet.indent")
                        Text("Matches")
                    }
//                Matching(potentialMatches: potentialMatches, index: 0, currUser:user)
                SwipeView(currUser: $user, potentialMatches: potentialMatches)
                    .tabItem {
                        Image(systemName: "plus")
                        Text("Match")
                    }
                ProfileDetail(user: self.user)
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


