//
//  MatchesList.swift
//  SpotiFriends
//
//  Created by Joanna Miao on 11/2/21.
//

import SwiftUI
import FirebaseDatabase

func openMessages() {
//  let phoneNumber = "bronkie2000@gmail.com"
//  let text = "Some message"
  
  if UIApplication.shared.canOpenURL(URL(string:"sms:")!) {
    print("opening")
       UIApplication.shared.open(URL(string:"sms:1234567890")!, options: [:], completionHandler: nil)
    print("just opened")
  } else {
    print("cant open url")
  }

//  guard let messageURL = NSURL(string: "email:\(phoneNumber)&body=\(text)")
//  else { print("smth went wrong with the url"); return }
//  if UIApplication.shared.canOpenURL(messageURL as URL) {
//    print("will open")
//    UIApplication.shared.openURL(messageURL as URL)
//  }
//  print("not allowed to open")
}

struct MatchesList: View {
    @ObservedObject var vm = ViewModel()
    @EnvironmentObject var currUser : User
    var tempUser: User
    @EnvironmentObject var my_matches: Match
  
//    init(currUser:Binding<User>){
//        self.currUser = currUser
////        _matches = State(initialValue: currUser.matches.two_way_matches)
//    }
    
    var body: some View {
//      NavigationView {b
        VStack {
        Text("Matches").foregroundColor(.white).font(.system(size: 30, weight: .heavy))//.multilineTextAlignment(.center)
        (List {
            ForEach(my_matches.two_way_matches) { match in
                HStack{
                NavigationLink(destination: OtherProfileDetail(user: match, matchScore: vm.matching(tempUser,match).0)) {
                    
                        MatchRow(match: match, score: vm.matching(tempUser,match).0)
                    
            }
                Button(action:{print("im clicked"); openMessages()}){
                    Image(systemName: "message")
                }
                }
          }.onDelete(perform: delete)
        })
        }
//        .navigationBarTitle("Matches").foregroundColor(.white)
//      }
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

