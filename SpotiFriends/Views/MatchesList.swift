//
//  MatchesList.swift
//  SpotiFriends
//
//  Created by Joanna Miao on 11/2/21.
//

import SwiftUI

struct MatchesList: View {
    var currUser: User
    
    var body: some View {
      var matches = currUser.matches.two_way_matches
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

