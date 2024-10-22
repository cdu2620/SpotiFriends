//
//  Song.swift
//  SpotiFriends
//
//  Created by Catherine D on 10/28/21.
//
import Foundation
import Firebase
import FirebaseDatabase

class Artist: Identifiable {
    
    let ref: DatabaseReference?
    let id: String
    let name: String
    let artist_image_url: String?
    let artist_image: UIImage
    
    init(id: String, name: String, artist_image_url: String) {
        self.ref = nil
        self.id = id
        self.name = name
        self.artist_image_url = artist_image_url
        
        let url = URL(string: self.artist_image_url!)
        let data = try? Data(contentsOf:url!)
        if let imageData = data {
            self.artist_image = UIImage(data: imageData)!
        } else {
            let url = URL(string: "https://st4.depositphotos.com/14953852/24787/v/600/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg")
            let data = try? Data(contentsOf:url!)
            self.artist_image = UIImage(data: data!)!
        }
    }
    
     
     func toAnyObject() -> Any {
       return [
         "id": id,
         "name": name,
         "artist_image_url": artist_image_url,
       ]
     }
}
