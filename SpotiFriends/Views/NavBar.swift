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
    var currUser: User
    var my_matches: Match
    
//    init(potentialMatches:[User], index: Int, user: User) {
//        UITabBar.appearance().backgroundColor = .clear
//        _potentialMatches = State(initialValue: potentialMatches)
//        self.index = index
//        _user = State(initialValue: user)
//    }
  
    var body: some View {
            TabView{
                MatchesList()
                    .tabItem {
                        Image(systemName: "list.bullet.indent")
                        Text("Matches")
                    }
                SwipeView(currUser: currUser, potentialMatches: potentialMatches)
                    .tabItem {
                        Image(systemName: "plus")
                        Text("Match")
                    }
                ProfileDetail(currUser:currUser)
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
            }
            .background(Color.black)
            .environmentObject(my_matches)
        }
    }


