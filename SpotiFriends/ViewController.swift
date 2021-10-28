//
//  ViewController.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/25/21.
//

import SwiftUI
import UIKit
import Foundation
import FirebaseFirestore
import FirebaseDatabase

class ViewController: UIViewController {
//    @Published var list = [UserInfo]()
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//   ref.observe(.value, with: { snapshot in
//    var newTasks: [UserInfo] = []
//              for child in snapshot.children {
//                if let snapshot = child as? DataSnapshot,
//                  let task = UserInfo(snapshot: snapshot) {
//                  newTasks.append(task)
//                }
//              }
//
//    })
        
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
            }
        }
        
        )}
    
}
