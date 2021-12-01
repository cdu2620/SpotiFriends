//
//  MatchesList.swift
//  SpotiFriends
//
//  Created by Joanna Miao on 11/2/21.
//

import SwiftUI
import FirebaseDatabase

struct MatchesList: View {
    @EnvironmentObject var currUser : User
    @EnvironmentObject var my_matches: Match
  
//    init(currUser:Binding<User>){
//        self.currUser = currUser
////        _matches = State(initialValue: currUser.matches.two_way_matches)
//    }
    
    var body: some View {
      NavigationView {
        (List {
            ForEach(my_matches.two_way_matches) { match in
            NavigationLink(destination: OtherProfileDetail(user: match, matchScore: vm.matching(currUser,match)[0])) {
                MatchRow(match: match, score: vm.matching(currUser,match)[0])
            }
          }.onDelete(perform: delete)
        })
        .navigationBarTitle("Matches")
      }
    }
    
    func delete(at offsets: IndexSet) {
        var val = 0
        for i in offsets {
            val = i
        }
        var other_user = my_matches.two_way_matches[val]
        let your_index = my_matches.two_way_matches.firstIndex{ $0.id == other_user.id } as! Int
        let their_index = other_user.matches.two_way_matches.firstIndex{ $0.id == currUser.id } as! Int
        other_user.matches.two_way_matches = other_user.matches.two_way_matches.filter{ $0.id != currUser.id  }
        my_matches.two_way_matches.remove(atOffsets: offsets)
        let path_og = "/users/" + currUser.id
        let refToCopy = Database.database().reference().child(path_og)
        refToCopy.observe(.value, with: {
            (snapshot) in if let snapCast = snapshot.value as? [String:Any]{
                breakLabel:  if let matches = snapCast["matches"] as? [String: Any]
                {
                    if let one_way = matches["two_way_match"] as? [Any] {
                        var tmp = one_way
                        tmp.remove(at: your_index)
                        if (currUser.matches.two_way_matches.count == tmp.count+1) {
                        let path_match = "/users/" + currUser.id + "/matches/two_way_match"
                        let refToDo = Database.database().reference().child(path_match)
                            refToDo.setValue(tmp) }
                    }}
                
               }})
        let path_2 = "/users/" + other_user.id
        let ref2 = Database.database().reference().child(path_2)
        ref2.observe(.value, with: {
            (snapshot) in if let snapCast = snapshot.value as? [String:Any]{
                breakLabel:  if let matches = snapCast["matches"] as? [String: Any]
                {
                    if let one_way = matches["two_way_match"] as? [Any] {
                        var tmp = one_way
                        if (other_user.matches.two_way_matches.count+1 == tmp.count) {
                        tmp.remove(at: their_index)
                        let path_match = "/users/" + other_user.id + "/matches/two_way_match"
                        let refToDo = Database.database().reference().child(path_match)
                            refToDo.setValue(tmp) }
                    }}
                
               }})
    }
}

