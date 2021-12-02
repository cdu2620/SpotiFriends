//
//  MatchRow.swift
//  SpotiFriends
//
//  Created by Aiyana Huang on 11/13/21.
//

import SwiftUI

func openMessages() {
//  let phoneNumber = "bronkie2000@gmail.com"
//  let text = "Some message"
  
  if UIApplication.shared.canOpenURL(URL(string:"sms:")!) {
    print("opening")
       UIApplication.shared.open(URL(string:"sms:1234567890")!, options: [:], completionHandler: nil)
    print("just opened")
  } else {
    print("cant open url")
  }

//  guard let messageURL = NSURL(string: "email:\(phoneNumber)&body=\(text)")
//  else { print("smth went wrong with the url"); return }
//  if UIApplication.shared.canOpenURL(messageURL as URL) {
//    print("will open")
//    UIApplication.shared.openURL(messageURL as URL)
//  }
//  print("not allowed to open")
}

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
            Text(String(score) + "% Match")
          }
            Spacer()
            Button(action:{openMessages()}){
                Image(systemName: "message")
            }
//          .padding()
//          .clipShape(Circle())
//          .foregroundColor(.white)
        }
    }
}

