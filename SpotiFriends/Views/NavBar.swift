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
    @StateObject var currUser: User
    
    init(potentialMatches:[User], index: Int, user: User) {
        UITabBar.appearance().backgroundColor = .clear
        _potentialMatches = State(initialValue: potentialMatches)
        self.index = index
        _currUser = StateObject(wrappedValue: user)
    }
    var body: some View {
//        NavigationView{
            TabView{
                let _ = print(" IM IN NAVB AR")
                let _ = print(currUser.matches.two_way_matches)
                MatchesList()
                    .tabItem {
                        Image(systemName: "list.bullet.indent")
                        Text("Matches")
                    }
//                Matching(potentialMatches: potentialMatches, index: 0, currUser:user)
                SwipeView(potentialMatches: potentialMatches)
                    .tabItem {
                        Image(systemName: "plus")
                        Text("Match")
                    }
                ProfileDetail(user: self.currUser)
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                }
            .background(Color.black)
            .environment(\.horizontalSizeClass, .compact)
//        }.environmentObject(currUser)
        
    }
}


