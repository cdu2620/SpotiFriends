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
    let database = Firestore.firestore()
    var ref: DatabaseReference!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        let nextref = ref.child("users")
        let docRef = database.document("user-infos/4KX3wgYplXpzx6BbIJIl")
        docRef.getDocument { snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            print(data)
        }
    }
    
    func writeData(text:String) {
        let docRef = database.document("user-infos/4KX3wgYplXpzx6BbIJIl")
        docRef.setData(["text": text])
    }
}

