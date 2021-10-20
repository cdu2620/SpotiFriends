import UIKit
import Foundation

let search = "Taylor%20Swift"
// Create URL
let url = URL (string: "https://api.spotify.com/v1/search?q=\(search)&type=track%2Cartist&limit=10")
guard let request = url else { fatalError() }


// Create URL Request
var URLrequest = URLRequest(url: request)

// Specify HTTP Method to use

// Set HTTP Request Header
let header = ["Content-Type": "application/json", "Authorization": "Bearer BQCspe-M_hWQtp-53eYf-8qI3zDXjFhloaKndTh5zHJyK5Fo6Wub5iLf3ud_CUvBktHTGZ3vl6wqkD75ZDFHlbzP4-CGH2_ZzzLh0Jwe_1H-PHabo21fSWfMXoMVdRqzFMtQ0CIe9ERhe7lyLEmQUtcZp_ggBuM2"]
URLrequest.httpMethod = "GET"
URLrequest.allHTTPHeaderFields = header

var jsonStr = Data()
var dict = NSDictionary()

// Send HTTP Request
let task = URLSession.shared.dataTask(with: URLrequest) { (data, response, error) in
    
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
  
  let artists = dict["artists"] as? NSDictionary
  if let items = artists!["items"] as? [NSDictionary] {
    for item in items {
      if let name = item.value(forKey: "name") as? String {
          print(name)
      }
      
    }
  }
    
}

task.resume()
