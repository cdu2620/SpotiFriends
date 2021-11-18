//
//  EditProfile.swift
//  SpotiFriends
//
//  Created by Aiyana Huang on 11/18/21.
//

import SwiftUI

struct EditProfile: View {
    var body: some View {
      VStack {
          HStack {
            Text("Name:")
              .fontWeight(.bold)
              .padding(.leading)
            TextField("full name", text: $name)
              .padding(.trailing)
          }.padding()
          HStack {
            Text("Pronouns:")
              .fontWeight(.bold)
              .padding(.leading)
            TextField("pronouns", text: $name)
              .padding(.trailing)
          }.padding()
          HStack {
            Text("Bio:")
              .fontWeight(.bold)
              .padding(.leading)
            TextField("bio", text: $name)
              .padding(.trailing)
          }.padding()
          Button(action: {
            self.showImagePicker = true
          }) {
            Text(buttonText())
          }.padding()
          Spacer()
      } // end of vstack
      .navigationBarTitle("Edit Profile")
      .navigationBarItems(trailing:
        Button(action: {}) {
          Text("Save")
        }
      )
        

    } // end of body
  
    func buttonText() -> String {
      return image == nil ? "Add Contact Picture" : "Change Contact Picture"
    }
}


