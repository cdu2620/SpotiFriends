//
//  EditProfile.swift
//  SpotiFriends
//
//  Created by Aiyana Huang on 11/18/21.
//

import SwiftUI



struct EditProfile: View {
    var currUser: User
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
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
//                            NavigationLink(destination:ProfileDetail(user: currUser)) {
//                                                    Text("Done")
//                                                }.simultaneousGesture(TapGesture().onEnded{
//                                                    saveProfile()
//                                            })
        Button(action: {
            saveProfile()
            self.presentationMode.wrappedValue.dismiss()
        }) { // save here
          Text("Done")
        }
      )
    }
    
    func saveProfile() {
        print(currUser.personal_info.f_name)
        if (name != "") {
        let f_name = name.split(separator:" ")[0]
            let l_name = name.split(separator:" ")[1]
            currUser.personal_info.f_name = String(f_name)
            currUser.personal_info.l_name = String(l_name)
        }
        if (pronouns != "") {
            let pros = pronouns
            currUser.personal_info.pronouns = pros
        }
        if (bio != "") {
        let new_bio = bio
            currUser.personal_info.bio = new_bio }
    }

}


