import UIKit
import Foundation


// Create URL
let urlArtists = URL (string: "https://api.spotify.com/v1/me/top/artists?time_range=long_term&limit=20&offset=0")
let urlTracks = URL (string: "https://api.spotify.com/v1/me/top/tracks?time_range=long_term&limit=20&offset=0")
let urlUserInformation = URL (string: "https://api.spotify.com/v1/me")
guard let requestUrlArtists = urlArtists else { fatalError() }
guard let requestUrlTracks = urlTracks else { fatalError() }
guard let requestUrlUserInfo = urlUserInformation else { fatalError() }


// Create URL Request
var requestArtists = URLRequest(url: requestUrlArtists)
var requestTracks = URLRequest(url: requestUrlTracks)
var requestUserInfo = URLRequest(url: requestUrlUserInfo)


// Set HTTP Request Header
//request.setValue("application/json", forHTTPHeaderField: "Accept")
let header = ["Content-Type": "application/json", "Authorization": "Bearer BQDI8NR38zcl0hH8So3qDSBy7hPIVn_O_oupyN9PBK5wVK8rhtVXI9RyJdvfbYO2fe9A6VGQG4a36tWDeKKqCX1cVAa-W4sGfFGfpfWH4g9WxOjXkCVbBLTPFtrR1s28X5DKj5HnYxbKXriGpNE"]
requestArtists.httpMethod = "GET"
requestArtists.allHTTPHeaderFields = header

requestTracks.httpMethod = "GET"
requestTracks.allHTTPHeaderFields = header

requestUserInfo.httpMethod = "GET"
requestUserInfo.allHTTPHeaderFields = header

var dict = NSDictionary()

// Send HTTP Request to fetch top artists for user
let task = URLSession.shared.dataTask(with: requestArtists) { (data, response, error) in
    
    // Check if Error took place
    if let error = error {
        print("Error took place \(error)")
        return
    }
    
    // Read HTTP Response Status code
    if let response = response as? HTTPURLResponse {
        print("Response HTTP Status code: \(response.statusCode)")
    }
    
    
    do {
        if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
            dict = convertedJsonIntoDict
        }
    } catch let error as NSError {
        print(error.localizedDescription)
    }
    
    if let items = dict["items"] as? [NSDictionary] {
        for item in items {
            //top 20 artists
            print(item["name"]!)
            
            if let covers = item["images"] as? [NSDictionary] {
                for c in covers {
                    if c["height"] as! Int == 640 {
                        // print the url of their Spotify profile pic
                        print(c["url"]!)
                    }
                    
                }
                
            }
            
        }
    }
    
}

task.resume()



var dictTracks = NSDictionary()
// Send HTTP Request to fetch top tracks info
let task2 = URLSession.shared.dataTask(with: requestTracks) { (data, response, error) in
    
    // Check if Error took place
    if let error = error {
        print("Error took place \(error)")
        return
    }
    
    // Read HTTP Response Status code
    if let response = response as? HTTPURLResponse {
        print("Response HTTP Status code: \(response.statusCode)")
    }
    
    
    do {
        if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
            dictTracks = convertedJsonIntoDict
        }
    } catch let error as NSError {
        print(error.localizedDescription)
    }
    
    if let items = dictTracks["items"] as? [NSDictionary] {
        for item in items {
            // print the song name
            print(item["name"]!)
            if let all_covers = item["album"] as? NSDictionary {
                if let covers = all_covers["images"] as? [NSDictionary] {
                    for c in covers {
                        if c["height"] as! Int == 64 {
                            // print the url of the cover image
                            print(c["url"]!)
                        }
                        
                    }
                }
            }
            
            if let artists = item["artists"] as? [NSDictionary] {
                for a in artists {
                    // print the artist name
                    print(a["name"]!)
                }
            }
        }
    }
    
}

task2.resume()

var userInfo = NSDictionary()
let task3 = URLSession.shared.dataTask(with: requestUserInfo) { (data, response, error) in
    
    // Check if Error took place
    if let error = error {
        print("Error took place \(error)")
        return
    }
    
    // Read HTTP Response Status code
    if let response = response as? HTTPURLResponse {
        print("Response HTTP Status code: \(response.statusCode)")
    }
    
    // Convert HTTP Response Data to a simple String
    
    
    do {
        if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
            userInfo = convertedJsonIntoDict
            let userName = userInfo.value(forKey: "display_name") as? String
            var userImageUrl=""
            if let userImageAllInfo = userInfo["images"] as? [NSDictionary] {
                for item in userImageAllInfo {
                    if let url = item.value(forKey:"url") as? String{
                        userImageUrl = url
                    }
                }
            }
            //print the person's name and profile pic url
            print(userName!)
            print(userImageUrl)
            
        }
    } catch let error as NSError {
        print(error.localizedDescription)
    }
    
    
}

task3.resume()



















