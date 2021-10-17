import UIKit
import Foundation


// Create URL
let urlArtists = URL (string: "https://api.spotify.com/v1/me/top/artists?time_range=long_term&limit=20&offset=0")
let urlTracks = URL (string: "https://api.spotify.com/v1/me/top/tracks?time_range=long_term&limit=20&offset=0")
guard let requestUrlArtists = urlArtists else { fatalError() }
guard let requestUrlTracks = urlTracks else { fatalError() }


// Create URL Request
var requestArtists = URLRequest(url: requestUrlArtists)
var requestTracks = URLRequest(url: requestUrlTracks)

// Specify HTTP Method to use

// Set HTTP Request Header
//request.setValue("application/json", forHTTPHeaderField: "Accept")
let header = ["Content-Type": "application/json", "Authorization": "Bearer BQBTq6Ja663sTZXBqCwU0vewHlS7uSlMGRHgV7Ou_4F8KWKME700rhNMS4x3PthBQjpqc__doe4VNbKTqVUNtULxWf-5zgPQgmNqs_BbJ9Vv3F6oIuCzw8B_hlb0AwNA4z5rNTrk74z94HBc3VU"]
requestArtists.httpMethod = "GET"
requestArtists.allHTTPHeaderFields = header

requestTracks.httpMethod = "GET"
requestTracks.allHTTPHeaderFields = header

var jsonStr = Data()
var dict = NSDictionary()

// Send HTTP Request
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
//        print("Response data string:\n \(dataString)")
        
        
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
// Send HTTP Request
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
//        print("Response data string:\n \(dataString)")
        
        
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


















