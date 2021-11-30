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
    @EnvironmentObject var currUser : User
    var potentialMatches: [User]
    @State var x: [CGFloat] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    @State var degree : [Double] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    let spacing: CGFloat = 10
    
    @State private var showModal = false
    
    init(potentialMatches:[User]){
        self.potentialMatches = potentialMatches
//        self.currUser = currUser
    }

    var body: some View {
        ZStack{
//            Color.black.opacity(0.05).edgesIgnoringSafeArea(.all)
            Button(action: {
                for i in 0..<self.x.count{
                    self.x[i] = 0
                }
                for i in 0..<self.degree.count{
                    self.degree[i] = 0
                }
            }){
                Image(systemName: "return").font(.title)
            }
            ZStack{
                ForEach(0..<potentialMatches.count, id: \.self){ i in
                    Matching(potentialMatchUser: potentialMatches[i], currUser: currUser, potentialMatches: potentialMatches, index:i, showModal: $showModal)
                        .offset(x: self.x[i % x.count])
                        .rotationEffect(.init(degrees:self.degree[i]))
                        .gesture(DragGesture()
                                    .onChanged({ (value)  in
                                        if  value.translation.width > 0{
                                            self.x[i] = value.translation.width
                                            self.degree[i] = 8
                                        }
                                        else{
                                            self.x[i] = value.translation.width
                                            self.degree[i] = -8
                                        }
                                        
                                    })
                                    .onEnded({(value) in
                                        if value.translation.width > 0{
                                            if value.translation.width > 100{
                                                let  _ = print("we swiped right")
                                                let isTwoWay =  true // matched(user1: currUser, user2: self.potentialMatches[i])
                                                if isTwoWay{
                                                    currUser.matches.two_way_matches.append(self.potentialMatches[i])
                                                    let _ = print("IN swipe view, checking struct")
                                                    let _ = print(currUser.matches.two_way_matches)
                                                    self.potentialMatches[i].matches.two_way_matches.append(currUser)
                                                    NavBar(potentialMatches: potentialMatches, index: 0, user: currUser)
                                                    let _ = print("IM HERERERERERERERER")
                                                    showModal.toggle()
                                                    
                                                }
                                                let _ = print(showModal)
                                                self.x[i] = 500
                                                self.degree[i]=15
                                                let _ = print("before rendering modalView")
                                                ModalView(isShowing: $showModal)
                                            }
                                            else{
                                                self.x[i] = 0
                                                self.degree[i]=0
                                            }
                                        }
                                        else{
                                            if value.translation.width < -100{
                                                let  _ = print("we swiped left")
                                                self.x[i] = -500
                                                self.degree[i] = -15
                                            }
                                            else{
                                                self.x[i] = 0
                                                self.degree[i]=0
                                            }
                                        }
                                    })
                        )
                }
                .navigationBarHidden(true)
            }
            .animation(.default)
        }
    }
    // user1 is you, user2 is other user
    func matched(user1 : User, user2 : User) -> Bool {
        if (user2.matches.one_way_matches.filter{ $0.id == user1.id  }.count == 1) {
            print("gonna have matched popup")
            let index = user2.matches.one_way_matches.firstIndex{ $0.id == user1.id } as! Int
            user2.matches.one_way_matches = user2.matches.one_way_matches.filter{ $0.id != user1.id  }
            user1.matches.two_way_matches.append(user2)
            user2.matches.two_way_matches.append(user1)
            DispatchQueue.global(qos: .background).async {
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
                            print(tmp.count)
                            print(user2.matches.one_way_matches.count)
                            if (user2.matches.one_way_matches.count == tmp.count) {
                            tmp.remove(at: index)
                            let path_match = "/users/" + user2.id + "/matches/one_way_match"
                            let refToDo = Database.database().reference().child(path_match)
                                refToDo.setValue(tmp) }
                        }}

                   }})
            }
            return true
          
        } // end of if you are already in user2's matches
        
        else {
            print("first time")
            user1.matches.one_way_matches.append(user2)
            DispatchQueue.global(qos: .background).async {
            let match_path2 = "/users/" + user1.id + "/matches/one_way_match/"+String(user1.matches.two_way_matches.count-1) + "/other_user_id"
            let userRef2 = Database.database().reference().child(match_path2)
            userRef2.setValue(user2.id)
            }
            return false
        }
    } // end of matched function
}
