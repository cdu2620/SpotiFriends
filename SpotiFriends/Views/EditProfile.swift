//
//  EditProfile.swift
//  SpotiFriends
//
//  Created by Aiyana Huang on 11/18/21.
//

import SwiftUI
import FirebaseDatabase


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
        print(currUser.id)
        if (name != "") {
            let f_name = name
            currUser.personal_info.f_name = String(f_name)
            DispatchQueue.global(qos: .background).async {
            let name_path = "/users/" + currUser.id + "/personal_info/f_name"
            let userRef2 = Database.database().reference().child(name_path)
                userRef2.setValue(name) }
        }
        if (pronouns != "") {
            let pros = pronouns
            currUser.personal_info.pronouns = pros
            DispatchQueue.global(qos: .background).async {
            let pro_path = "/users/" + currUser.id + "/personal_info/pronouns"
            let userRef = Database.database().reference().child(pro_path)
                userRef.setValue(pronouns) }
        }
        if (bio != "") {
        let new_bio = bio
            currUser.personal_info.bio = new_bio
            DispatchQueue.global(qos: .background).async {
            let bio_path = "/users/" + currUser.id + "/personal_info/bio"
            let userRef3 = Database.database().reference().child(bio_path)
                userRef3.setValue(bio)
                
            }
            
        }
    }

}


