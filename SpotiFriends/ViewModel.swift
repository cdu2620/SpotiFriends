//
//  ViewModel.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/25/21.
//

import Foundation
import Firebase

class ViewModel: ObservableObject {
    @Published var list = [UserInfo]()
    
    func getData() {
        let db = Firestore.firestore()
        db.collection("user-infos").getDocuments {
            snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    self.list = snapshot.documents.map {
                        d in
                        return UserInfo(id: d.documentID,
                                        f_name: d["f_name"] as? String ?? "",
                                        l_name: d["l_name"] as? String ?? "",
                                        age: d["age"] as? Int ?? 0,
                                        pronouns: d["pronouns"] as? String ?? "",
                                        bio: d["bio"] as? String ?? "",
                                        profile_pic: d["profile_pic"] as? String ?? "")
                    }
                }
            }
            else {
                return
            }
        }
    }
}
