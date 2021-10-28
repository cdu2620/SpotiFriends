//
//  Song.swift
//  SpotiFriends
//
//  Created by Xinyi Huang on 10/28/21.
//

import Foundation
import SwiftUI

class Song: Identifiable {
    
    var id: String
    var song_name: String
    var artist: String
    var album_image_url: String
    var album_image: UIImage?
    
    init(id: String, song_name: String, artist: String, album_image_url: String? = nil) {
        self.id = id
        self.song_name = song_name
        self.artist = artist
        self.album_image_url = album_image_url!
        
        let url = URL(string: self.album_image_url)
        let data = try? Data(contentsOf:url!)
        if let imageData = data {
            self.album_image = UIImage(data: imageData)
        }
    }
}
