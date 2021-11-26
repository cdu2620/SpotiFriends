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
        
//        NavigationView{
            VStack {
                if populatedData == true {
                    var testUser = vm.users.filter{ $0.id == vm.username  }[0]
                    var my_matches = testUser.matches.two_way_matches
                    var notme = vm.users.filter{ $0.id != vm.username  }
                    var otherUsers = notme.filter({ (user: User) -> Bool in
                                                        return my_matches.contains(where: { (user1: User) -> Bool in
                                                    return user.id != user1.id})})
                    VStack{
                        NavBar(potentialMatches: otherUsers, index: 0, user: testUser)
                        
                    }
                   
                } else {
                    Button(action: {
                        vm.getMatches()
                        DispatchQueue.main.asyncAfter(deadline: .now()+10) {
                            populatedData = true
                            var testUser = vm.users.filter{ $0.id == vm.username  }[0]
                            var my_matches = testUser.matches.two_way_matches
                            var notme = vm.users.filter{ $0.id != vm.username  }
                            var otherUsers = notme.filter({ (user: User) -> Bool in
                                                                return my_matches.contains(where: { (user1: User) -> Bool in
                                                            return user.id != user1.id})})
                            VStack{
                                NavBar(potentialMatches: otherUsers, index: 0, user: testUser)
                            }
                        }
                        
                    }) {
                        Text("Log In")
                    }
                }
//            }
                
        }
    
 

    }
}

