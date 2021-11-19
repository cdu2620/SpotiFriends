//
//  EditProfile.swift
//  SpotiFriends
//
//  Created by Aiyana Huang on 11/18/21.
//

import SwiftUI



struct EditProfile: View {
  @State var name: String = ""
  @State var pronouns: String = ""
  @State var bio: String = ""
  
      var body: some View {
      VStack {
        HStack {
          Text("name:")
            .fontWeight(.bold)
            .padding(.leading)
          TextField("full name", text: $name)
            .padding(.trailing)
        }.padding()
        HStack {
          Text("pronouns:")
            .fontWeight(.bold)
            .padding(.leading)
          TextField("pronouns", text: $pronouns)
            .keyboardType(.phonePad)
            .padding(.trailing)
        }.padding()
        HStack {
          Text("bio:")
            .fontWeight(.bold)
            .padding(.leading)
          TextField("bio", text: $bio)
            .keyboardType(.emailAddress)
            .padding(.trailing)
        }.padding()
      }
      .navigationBarTitle("Edit Profile")
      .navigationBarItems(trailing:
        Button(action: {}) { // save here
          Text("Done")
        }
      )
    }

}


