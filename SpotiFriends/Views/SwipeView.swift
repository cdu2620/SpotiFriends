//
//  SwipeView.swift
//  SpotiFriends
//
//  Created by Joanna Miao on 11/14/21.
//

import SwiftUI
import FirebaseDatabase

struct SwipeView: View {
    @State private var offset: CGFloat = 0
    @State private var index = 0
    
    var potentialMatches: [User]
    let spacing: CGFloat = 10
    var currUser: User

    var body: some View {
        GeometryReader { geometry in
            return ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: self.spacing) {
                    ForEach(self.potentialMatches) { user in
                        Matching(potentialMatchUser:user, currUser:currUser)
                            .frame(width: geometry.size.width)
                    }
                }
            }
            .content.offset(x: self.offset)
            .frame(width: geometry.size.width, alignment: .leading)
            .gesture(
                
                DragGesture()
                    .onChanged({ value in
                        self.offset = value.translation.width - geometry.size.width * CGFloat(self.index)
                    })
                    .onEnded({ value in
                        if -value.predictedEndTranslation.width > geometry.size.width / (1.5){
                            //this is when user accepts/likes potential match
                            
//                            matched(user1:currUser, user2:potentialMatches[index])
                            if self.index + 1 >= self.potentialMatches.count{
                                self.index = 0
                            } else {
                                self.index += 1
                            }
                            withAnimation { self.offset = -(geometry.size.width + self.spacing) * CGFloat(self.index) }

                        }
                        if value.predictedEndTranslation.width > geometry.size.width / (1.5) {
                            //this is when user rejects potential match
                            if self.index + 1 >= self.potentialMatches.count{
                                self.index = 0
                            } else {
                                self.index += 1
                            }
                            withAnimation { self.offset = (geometry.size.width + self.spacing) * CGFloat(self.index) }
                        }
                        
                       
                    })
            )
        }
    }
    // user1 is you, user2 is other user
    func matched(user1 : User, user2 : User) {
        if (user2.matches.one_way_matches.filter{ $0.id == user1.id  }.count == 1) {
            print("gonna have matched popup")
            let index = user2.matches.one_way_matches.firstIndex{ $0.id == user1.id } as! Int
            user2.matches.one_way_matches = user2.matches.one_way_matches.filter{ $0.id != user1.id  }
            user1.matches.two_way_matches.append(user2)
            user2.matches.two_way_matches.append(user1)
            let match_path = "/users/" + user2.id + "/matches/two_way_match/"+String(user2.matches.two_way_matches.count-1) + "/other_user_id"
            let userRef = Database.database().reference().child(match_path)
            userRef.setValue(user1.id)

            let match_path2 = "/users/" + user1.id + "/matches/two_way_match/"+String(user1.matches.two_way_matches.count-1) + "/other_user_id"
            let userRef2 = Database.database().reference().child(match_path2)
            userRef2.setValue(user2.id)
            // remove from one way match in db
            let path_og = "/users/" + user2.id
            let refToCopy = Database.database().reference().child(path_og)
            refToCopy.observe(.value, with: {
                (snapshot) in if let snapCast = snapshot.value as? [String:Any]{
                    breakLabel:  if let matches = snapCast["matches"] as? [String: Any]
                    {
                        if let one_way = matches["one_way_match"] as? [Any] {
                            var tmp = one_way
                            tmp.remove(at: index)
                            if (user2.matches.one_way_matches.count == tmp.count+1) {
                            let path_match = "/users/" + user2.id + "/matches/one_way_match"
                            let refToDo = Database.database().reference().child(path_match)
                                refToDo.setValue(tmp) }
                        }}
                    
                   }})
        } // end of if you are already in user2's matches
        
        else {
            print("first time")
            user1.matches.one_way_matches.append(user2)
            let match_path2 = "/users/" + user1.id + "/matches/one_way_match/"+String(user1.matches.two_way_matches.count-1) + "/other_user_id"
            let userRef2 = Database.database().reference().child(match_path2)
            userRef2.setValue(user2.id)
        }
    } // end of matched function
}
