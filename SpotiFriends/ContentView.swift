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

    let ref = Database.database().reference()
    var body: some View {
        let _ = print("asflkj")
//        this is just testing to see if our view works (it doesn't lol)
        Button("hello", action: {
            var todayArray = [UserInfo]()

            let liveRef = self.ref.child("users")
            liveRef.observe(.value, with: { snapshot in
                
                let fff = snapshot.childSnapshot(forPath: "personal_info")
                for todayChild in fff.children {
                    let todayChildSnap = todayChild as! DataSnapshot
                    let todayDict = todayChildSnap.value as! [String: Any]
                    let f_name = todayDict["f_name"] as! String
                    let l_name = todayDict["l_name"] as! String
                    let age = todayDict["age"] as! Int
                    let pronouns = todayDict["pronouns"] as! String
                    let bio = todayDict["bio"] as! String
                    let profile_pic = todayDict["profile_pic"] as! String
                    let person = UserInfo(f_name:f_name,l_name: l_name, age: age, pronouns: pronouns, bio: bio, profile_pic: profile_pic)
                    todayArray.append(person)
                    print(f_name)
                    print("hello")
                }
            }
            
            )
        })
    }

}
