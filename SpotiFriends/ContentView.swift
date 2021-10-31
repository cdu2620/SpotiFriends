//
//  ContentView.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/12/21.
//

import SwiftUI
import Firebase
import FirebaseDatabase

struct ContentView: View {

    @ObservedObject var vm = ViewModel()
    @State var populatedData = false
    var testUser = UserInfo(f_name: "Null", l_name: "Null", age: 0, pronouns: "", bio: "", profile_pic_url: "https://artscimedia.case.edu/wp-content/uploads/sites/79/2016/12/14205134/no-user-image.gif")

    var body: some View {
        
        NavigationView{
            VStack {
                if populatedData == true {
                    NavigationLink("hi", destination: ProfileDetail(user: vm.list[0]))
                } else {
                    Button(action: {
                        vm.getData()
                        DispatchQueue.main.asyncAfter(deadline: .now()+10) {
                            print(vm.list)
                            populatedData = true
                            NavigationLink("hi", destination: ProfileDetail(user: vm.list[0]))
                        }
                        
                    }) {
                        Text("Populate")
                    }
                }
            }
                
        }
    
 

    }
}

