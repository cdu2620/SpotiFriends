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
    
        
 

    var body: some View {
        
        NavigationView{
            VStack {
                if populatedData == true {
                    var testUser = vm.users.filter{ $0.id == vm.username  }[0]
                    var otherUsers = vm.users.filter{ $0.id != vm.username  }
                    VStack{
                        NavBar(potentialMatches: otherUsers, index: 0, user: testUser)
                        
                    }
                   
                } else {
                    Button(action: {
                        vm.getMatches()
                        DispatchQueue.main.asyncAfter(deadline: .now()+10) {
                            populatedData = true
                            var testUser = vm.users.filter{ $0.id == vm.username  }[0]
                            var otherUsers = vm.users.filter{ $0.id != vm.username  }
                            VStack{
                                NavBar(potentialMatches: otherUsers, index: 0, user: testUser)
                            }
                        }
                        
                    }) {
                        Text("Log In")
                    }
                }
            }
                
        }
    
 

    }
}

