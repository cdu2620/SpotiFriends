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

// Specify HTTP Method to use

// Set HTTP Request Header
//request.setValue("application/json", forHTTPHeaderField: "Accept")
let header = ["Content-Type": "application/json", "Authorization": "Bearer BQAFbRQXWKrB0EfzKqOu7d-2FWx9SiVvZJV8l4ruJapv4gLAw1wFjg15fLZvGU8n0YMtq_Iu4QGgxs3nFgLpfMtVR2t_ogM_NjJJYggbOmoLfsTU1n7WOU3NmrzUXYrXjYSUja-MN6-_IjEeSqt3w8OC7cKfGn8ChRWMq5QC2MSrYE54BtnrS7RK"]
requestArtists.httpMethod = "GET"
requestArtists.allHTTPHeaderFields = header

requestTracks.httpMethod = "GET"
requestTracks.allHTTPHeaderFields = header

requestUserInfo.httpMethod = "GET"
requestUserInfo.allHTTPHeaderFields = header

var jsonStr = Data()
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
      
    // Convert HTTP Response Data to a simple String
    if let data = data, let dataString = String(data: data, encoding: .utf8) {
      jsonStr = dataString.data(using: .utf8)!
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
      print(item["name"]!)
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
      
    // Convert HTTP Response Data to a simple String
    if let data = data, let dataString = String(data: data, encoding: .utf8) {
      jsonStr = dataString.data(using: .utf8)!
        
        
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
      print(item["name"]!)
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
    if let data = data, let dataString = String(data: data, encoding: .utf8) {
      jsonStr = dataString.data(using: .utf8)!
    }
  
    do {
              if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                  userInfo = convertedJsonIntoDict
                let userName = userInfo.value(forKey: "display_name") as? String
                var userImageUrl=""
//                let userImageAllInfo = userInfo.value(forKey:"images") as? [NSDictionary]
//                let userImageInfo =  userImageAllInfo[0]
                if let userImageAllInfo = userInfo["images"] as? [NSDictionary] {
                  for item in userImageAllInfo {
                    if let url = item.value(forKey:"url") as? String{
                        userImageUrl = url
                        print(url)
                    }
                  }
                }
                
                print(userName!)
                print(userImageUrl)
                print(userInfo)
                
               }
    } catch let error as NSError {
               print(error.localizedDescription)
    }
  
//  if let items = dictTracks["items"] as? [NSDictionary] {
//    for item in items {
//      print(item["name"]!)
//    }
//  }
    
}

task3.resume()



















