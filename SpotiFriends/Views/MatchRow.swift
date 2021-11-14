//
//  MatchRow.swift
//  SpotiFriends
//
//  Created by Aiyana Huang on 11/13/21.
//

import SwiftUI

struct MatchRow: View {
  var match: User
  var score: Int
    var body: some View {
        HStack {
          Image(uiImage: match.personal_info.profile_picture!)
            .resizable()
            .scaledToFit()
            .frame(width: 30, height:30)
            .clipShape(Circle())
            .overlay(
              Circle()
                .stroke(Color.white, lineWidth: 0)
                .shadow(radius: 5)
            )
          VStack {
            Text(match.personal_info.f_name + " " + match.personal_info.l_name)
            Text(score + "% Match")
          }
          Image(systemName: "message")
          .padding()
          .clipShape(Circle())
          .foregroundColor(.white)
        }
    }
}

