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
                  VStack {
                                      Text("Spotifriends").foregroundColor(.white).font(.largeTitle).fontWeight(.black)
                                      Image(systemName: "wifi").padding().background(Color.green).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).foregroundColor(.white).font(.largeTitle).frame(width:200, height: 200).scaleEffect(2.0)
                                      Text("The app for meeting people with similar music tastes! Swipe right to match and left to skip").frame(width: 240, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center).foregroundColor(.gray).font(.title3)
                    Button(action: {
                        vm.getMatches()
                        DispatchQueue.main.asyncAfter(deadline: .now()+30) {
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
                      Text("Log In").foregroundColor(.black).font(.title2).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }.frame(minWidth: 0, maxWidth: 200)
                    .font(.system(size: 18))
                    .padding()
//                    .foregroundColor(.blue)
                    .background(Color.white)
                    .cornerRadius(25.0)
//                    .font(.title)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 25)
//                            .stroke(Color.white, lineWidth: 2))
                  } //end of vstack
                }
            }
                
        }.background(Color.black)
    
 

    }
}

