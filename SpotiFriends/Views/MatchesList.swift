//
//  MatchesList.swift
//  SpotiFriends
//
//  Created by Joanna Miao on 11/2/21.
//

import SwiftUI

struct MatchesList: View {
    var currUser: User
    @State var matches: [User]
    
    init(currUser:User){
        self.currUser = currUser
        _matches = .init(initialValue: currUser.matches.two_way_matches)
    }
    
    var body: some View {
      NavigationView {
        (List {
          ForEach(matches) { match in
            NavigationLink(destination: OtherProfileDetail(user: match, matchScore: 50)) {
              MatchRow(match: match, score: 50)
            }
          } //.onDelete(perform: delete)
        })
        .navigationBarTitle("Matches")
      }
    }
}

