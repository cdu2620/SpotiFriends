
import Foundation
import Firebase
import FirebaseDatabase

class Match: Identifiable {
    let ref: DatabaseReference?
//    let id: UUID.
    var one_way_matches: [User]
    var two_way_matches: [User]

    
    init(one_way_matches: [User], two_way_matches: [User]) {
        self.ref = nil
        self.one_way_matches = one_way_matches
        self.two_way_matches = two_way_matches
    }
     
     func toAnyObject() -> Any {
       return [
         "one_way_matches": one_way_matches,
        "two_way_matches" : two_way_matches
       ]
     }
}
