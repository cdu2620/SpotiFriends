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
                    var currUser = vm.users.filter{ $0.id == vm.username  }[0]
                    var my_matches = currUser.matches
                    var notme = vm.users.filter{ $0.id != vm.username  }
                    var otherUsers = notme.filter({ (user: User) -> Bool in
                                                        return my_matches.two_way_matches.contains(where: { (user1: User) -> Bool in
                                                    return user.id != user1.id})})
                    VStack{
                        NavBar(potentialMatches: otherUsers, index: 0, currUser: currUser, my_matches: my_matches)
                        
                    }
                   
                } else {
                    Button(action: {
                        vm.getMatches()
                        DispatchQueue.main.asyncAfter(deadline: .now()+10) {
                            populatedData = true
                            var currUser = vm.users.filter{ $0.id == vm.username  }[0]
                            var my_matches = currUser.matches
                            var notme = vm.users.filter{ $0.id != vm.username  }
                            var otherUsers = notme.filter({ (user: User) -> Bool in
                                                                return my_matches.two_way_matches.contains(where: { (user1: User) -> Bool in
                                                            return user.id != user1.id})})
                            print("we are done")
                            
                            VStack{
                                NavBar(potentialMatches: otherUsers, index: 0, currUser: currUser, my_matches: my_matches)
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

