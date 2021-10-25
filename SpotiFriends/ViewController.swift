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

class ViewController: UIViewController {
    let database = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

