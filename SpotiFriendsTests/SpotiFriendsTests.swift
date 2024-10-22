//
//  SpotiFriendsTests.swift
//  SpotiFriendsTests
//
//  Created by Catherine D on 10/12/21.
//

import XCTest
@testable import SpotiFriends
import Firebase
import FirebaseDatabase
import Spartan

class SpotiFriendsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      
      
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
  
  func testMatchingBehavior() throws {
    var top_3songs = [Song]()
    var top_20songs = [Song]()
    var top_3artists = [SpotiFriends.Artist]()
    var top_20artists = [SpotiFriends.Artist]()
    let one_way_matches1 = [User]()
    let two_way_matches1 = [User]()
    let match1 = Match(one_way_matches: one_way_matches1, two_way_matches: two_way_matches1)
    
    let one_way_matches2 = [User]()
    let two_way_matches2 = [User]()
    let match2 = Match(one_way_matches: one_way_matches2, two_way_matches: two_way_matches2)
//    let match_converted = match2.toAnyObject() as? NSDictionary

    let song1 = Song(id: "5", song_name: "Butter", artist: "BTS", album_image_url: "google.com")
//    let song_converted = song1.toAnyObject() as? NSDictionary

    top_3songs.append(song1)
    top_20songs.append(song1)
    let song2 = Song(id: "6", song_name: "Afterglow", artist: "Taylor Swift", album_image_url: "google.com")
    top_3songs.append(song2)
    top_20songs.append(song2)
    let song3 = Song(id: "7", song_name: "SHOOT!", artist: "ITZY", album_image_url: "google.com")
    top_3songs.append(song3)
    top_20songs.append(song3)
    let song4 = Song(id: "14", song_name: "fourteen", artist: "Taylor 14", album_image_url: "14.com")
    top_20songs.append(song4)
    let song5 = Song(id: "15", song_name: "fifteen", artist: "Taylor 15", album_image_url: "15.com")
    top_20songs.append(song5)
    let song6 = Song(id: "16", song_name: "sixteen", artist: "Taylor 16", album_image_url: "16.com")
    top_20songs.append(song6)
    let song7 = Song(id: "17", song_name: "seventeen", artist: "Taylor 17", album_image_url: "17.com")
    top_20songs.append(song7)
    let song8 = Song(id: "18", song_name: "eighteen", artist: "Taylor 18", album_image_url: "18.com")
    top_20songs.append(song8)
    let song9 = Song(id: "19", song_name: "nineteen", artist: "Taylor 19", album_image_url: "19.com")
    top_20songs.append(song9)
    let song10 = Song(id: "20", song_name: "twenty", artist: "Taylor 20", album_image_url: "20.com")
    top_20songs.append(song10)
    let song11 = Song(id: "21", song_name: "twentyone", artist: "Taylor 21", album_image_url: "21.com")
    top_20songs.append(song11)
    let song12 = Song(id: "22", song_name: "twentytwo", artist: "Taylor 22", album_image_url: "22.com")
    top_20songs.append(song12)
    let song13 = Song(id: "23", song_name: "twentythree", artist: "Taylor 23", album_image_url: "23.com")
    top_20songs.append(song13)
    let song14 = Song(id: "24", song_name: "twentyfour", artist: "Taylor 24", album_image_url: "24.com")
    top_20songs.append(song14)
    let song15 = Song(id: "25", song_name: "twentyfive", artist: "Taylor 25", album_image_url: "25.com")
    top_20songs.append(song15)
    let song16 = Song(id: "26", song_name: "twentysix", artist: "Taylor 26", album_image_url: "26.com")
    top_20songs.append(song16)
    let song17 = Song(id: "27", song_name: "twentyseven", artist: "Taylor 27", album_image_url: "27.com")
    top_20songs.append(song17)
    let song18 = Song(id: "28", song_name: "twentyeight", artist: "Taylor 28", album_image_url: "28.com")
    top_20songs.append(song18)
    let song19 = Song(id: "29", song_name: "twentynine", artist: "Taylor 29", album_image_url: "29.com")
    top_20songs.append(song19)
    let song20 = Song(id: "30", song_name: "thirty", artist: "Taylor 30", album_image_url: "30.com")
    top_20songs.append(song20)
    let artist1 = Artist(id:"1", name: "BTS", artist_image_url: "google.com")
//    let artist_converted = artist1.toAnyObject() as? NSDictionary
    
    top_3artists.append(artist1)
            top_20artists.append(artist1)
            let artist2 = Artist(id:"2", name: "Taylor Swift", artist_image_url: "google.com")
            top_3artists.append(artist2)
            top_20artists.append(artist2)
            let artist3 = Artist(id:"3", name: "Chase Atlantic", artist_image_url: "google.com")
            top_3artists.append(artist3)
            top_20artists.append(artist3)
            let artist4 = Artist(id:"4", name: "Chase 4", artist_image_url: "4.com")
            top_20artists.append(artist4)
            let artist5 = Artist(id:"5", name: "Chase 5", artist_image_url: "5.com")
            top_20artists.append(artist5)
            let artist6 = Artist(id:"6", name: "Chase 6", artist_image_url: "6.com")
            top_20artists.append(artist6)
            let artist7 = Artist(id:"7", name: "Chase 7", artist_image_url: "7.com")
            top_20artists.append(artist7)
            let artist8 = Artist(id:"8", name: "Chase 8", artist_image_url: "8.com")
            top_20artists.append(artist8)
            let artist9 = Artist(id:"9", name: "Chase 9", artist_image_url: "9.com")
            top_20artists.append(artist9)
            let artist10 = Artist(id:"10", name: "Chase 10", artist_image_url: "10.com")
            top_20artists.append(artist10)
            let artist11 = Artist(id:"11", name: "Chase 11", artist_image_url: "11.com")
            top_20artists.append(artist11)
            let artist12 = Artist(id:"12", name: "Chase 12", artist_image_url: "12.com")
            top_20artists.append(artist12)
            let artist13 = Artist(id:"13", name: "Chase 13", artist_image_url: "13.com")
            top_20artists.append(artist13)
            let artist14 = Artist(id:"14", name: "Chase 14", artist_image_url: "14.com")
            top_20artists.append(artist14)
            let artist15 = Artist(id:"15", name: "Chase 15", artist_image_url: "15.com")
            top_20artists.append(artist15)
            let artist16 = Artist(id:"16", name: "Chase 16", artist_image_url: "16.com")
            top_20artists.append(artist16)
            let artist17 = Artist(id:"17", name: "Chase 17", artist_image_url: "17.com")
            top_20artists.append(artist17)
            let artist18 = Artist(id:"18", name: "Chase 18", artist_image_url: "18.com")
            top_20artists.append(artist18)
            let artist19 = Artist(id:"19", name: "Chase 19", artist_image_url: "19.com")
            top_20artists.append(artist19)
            let artist20 = Artist(id:"20", name: "Chase 20", artist_image_url: "20.com")
            top_20artists.append(artist20)
    
    let his = History(top_3_songs: top_3songs, top_3_artists: top_3artists, top_20_songs: top_20songs, top_20_artists: top_20artists)
//    let his_converted = his.toAnyObject() as? NSDictionary

    let person = UserInfo(f_name:"A",l_name: "LASTNAME", age: 21, pronouns: "they/she", bio: "i live so i love",profile_picture_url: "google.com")
//    let personConverted = person.toAnyObject() as? NSDictionary

    let one = User(id: "TEST_A", matches: match1, personal_info:person, spotify_history: his)
//    let oneConverted = one.toAnyObject() as? NSDictionary

//    one_way_matches.append(one)

    let person2 = UserInfo(f_name:"B",l_name: "LASTNAME", age: 21, pronouns: "she/her", bio: "hello",profile_picture_url: "google.com")
    let two = User(id: "TEST_B", matches: match2, personal_info:person2, spotify_history: his)
//    let twoConverted = two.toAnyObject() as? NSDictionary

//    two_way_matches.append(two)
    
//    let match3 = Match(one_way_matches: one_way_matches, two_way_matches: two_way_matches)
//    let match3_converted = match3.toAnyObject() as? NSDictionary

    let matchedBool = SwipeView(currUser: one, potentialMatches: [two]).matched(user1: one, user2: two)
    
    // B is in A's one way matches
    XCTAssertEqual(one.matches.one_way_matches.count, 1)
    XCTAssertEqual(one.matches.one_way_matches[0].personal_info.f_name, two.personal_info.f_name)
    XCTAssertEqual(one.matches.one_way_matches[0].personal_info.l_name, two.personal_info.l_name)
    
    // B swipes right on A
    let matchedBool2 = SwipeView(currUser: two, potentialMatches: [one]).matched(user1: two, user2: one)
    XCTAssertEqual(one.matches.two_way_matches.count, 1)
    XCTAssertEqual(two.matches.two_way_matches.count, 1)
    XCTAssertEqual(one.matches.two_way_matches[0].personal_info.f_name, two.personal_info.f_name)
    XCTAssertEqual(one.matches.two_way_matches[0].personal_info.l_name, two.personal_info.l_name)
    XCTAssertEqual(two.matches.two_way_matches[0].personal_info.f_name, one.personal_info.f_name)
    XCTAssertEqual(two.matches.two_way_matches[0].personal_info.l_name, one.personal_info.l_name)
    XCTAssertEqual(one.matches.one_way_matches.count, 0)
    XCTAssertEqual(two.matches.one_way_matches.count, 0)
    
    // A unmatches B
    // TODO: environment object???
    
//    var indices = IndexSet()
//    indices.insert(0)
//    let ml = MatchesList(tempUser: one)//.environmentObject(one) as! MatchesList
//      ml.delete(at: indices)
//    XCTAssertEqual(one.matches.one_way_matches.count, 0)
//    XCTAssertEqual(two.matches.one_way_matches.count, 0)
//    XCTAssertEqual(one.matches.two_way_matches.count, 0) // FAIL
//    print(one.matches.two_way_matches[0].personal_info.f_name)
//
//    XCTAssertEqual(two.matches.two_way_matches.count, 0)
    
    
    // clean up firebase dummy users
    Database.database().reference().child("/users/"+one.id).removeValue()
    Database.database().reference().child("/users/"+two.id).removeValue()
    
  }
  
  func testMatchAlgo() throws {
    var top_3songs = [Song]()
    var top_20songs = [Song]()
    var top_3artists = [SpotiFriends.Artist]()
    var top_20artists = [SpotiFriends.Artist]()
    var one_way_matches = [User]()
    var two_way_matches = [User]()
    let match1 = Match(one_way_matches: one_way_matches, two_way_matches: two_way_matches)
    let song1 = Song(id: "5", song_name: "Butter", artist: "BTS", album_image_url: "google.com")
    let song_converted = song1.toAnyObject() as? NSDictionary

    top_3songs.append(song1)
    top_20songs.append(song1)
    let song2 = Song(id: "6", song_name: "Afterglow", artist: "Taylor Swift", album_image_url: "google.com")
    top_3songs.append(song2)
    top_20songs.append(song2)
    let song3 = Song(id: "7", song_name: "SHOOT!", artist: "ITZY", album_image_url: "google.com")
    top_3songs.append(song3)
    top_20songs.append(song3)
    let song4 = Song(id: "14", song_name: "fourteen", artist: "Taylor 14", album_image_url: "14.com")
    top_20songs.append(song4)
    let song5 = Song(id: "15", song_name: "fifteen", artist: "Taylor 15", album_image_url: "15.com")
    top_20songs.append(song5)
    let song6 = Song(id: "16", song_name: "sixteen", artist: "Taylor 16", album_image_url: "16.com")
    top_20songs.append(song6)
    let song7 = Song(id: "17", song_name: "seventeen", artist: "Taylor 17", album_image_url: "17.com")
    top_20songs.append(song7)
    let song8 = Song(id: "18", song_name: "eighteen", artist: "Taylor 18", album_image_url: "18.com")
    top_20songs.append(song8)
    let song9 = Song(id: "19", song_name: "nineteen", artist: "Taylor 19", album_image_url: "19.com")
    top_20songs.append(song9)
    let song10 = Song(id: "20", song_name: "twenty", artist: "Taylor 20", album_image_url: "20.com")
    top_20songs.append(song10)
    let song11 = Song(id: "21", song_name: "twentyone", artist: "Taylor 21", album_image_url: "21.com")
    top_20songs.append(song11)
    let song12 = Song(id: "22", song_name: "twentytwo", artist: "Taylor 22", album_image_url: "22.com")
    top_20songs.append(song12)
    let song13 = Song(id: "23", song_name: "twentythree", artist: "Taylor 23", album_image_url: "23.com")
    top_20songs.append(song13)
    let song14 = Song(id: "24", song_name: "twentyfour", artist: "Taylor 24", album_image_url: "24.com")
    top_20songs.append(song14)
    let song15 = Song(id: "25", song_name: "twentyfive", artist: "Taylor 25", album_image_url: "25.com")
    top_20songs.append(song15)
    let song16 = Song(id: "26", song_name: "twentysix", artist: "Taylor 26", album_image_url: "26.com")
    top_20songs.append(song16)
    let song17 = Song(id: "27", song_name: "twentyseven", artist: "Taylor 27", album_image_url: "27.com")
    top_20songs.append(song17)
    let song18 = Song(id: "28", song_name: "twentyeight", artist: "Taylor 28", album_image_url: "28.com")
    top_20songs.append(song18)
    let song19 = Song(id: "29", song_name: "twentynine", artist: "Taylor 29", album_image_url: "29.com")
    top_20songs.append(song19)
    let song20 = Song(id: "30", song_name: "thirty", artist: "Taylor 30", album_image_url: "30.com")
    top_20songs.append(song20)
    let artist1 = Artist(id:"1", name: "BTS", artist_image_url: "google.com")
    let artist_converted = artist1.toAnyObject() as? NSDictionary

    
//    let artist1 = Artist(id:"1", name: "BTS", artist_image_url: "google.com")
    
    top_3artists.append(artist1)
            top_20artists.append(artist1)
            let artist2 = Artist(id:"2", name: "Taylor Swift", artist_image_url: "google.com")
            top_3artists.append(artist2)
            top_20artists.append(artist2)
            let artist3 = Artist(id:"3", name: "Chase Atlantic", artist_image_url: "google.com")
            top_3artists.append(artist3)
            top_20artists.append(artist3)
            let artist4 = Artist(id:"4", name: "Chase 4", artist_image_url: "4.com")
            top_20artists.append(artist4)
            let artist5 = Artist(id:"5", name: "Chase 5", artist_image_url: "5.com")
            top_20artists.append(artist5)
            let artist6 = Artist(id:"6", name: "Chase 6", artist_image_url: "6.com")
            top_20artists.append(artist6)
            let artist7 = Artist(id:"7", name: "Chase 7", artist_image_url: "7.com")
            top_20artists.append(artist7)
            let artist8 = Artist(id:"8", name: "Chase 8", artist_image_url: "8.com")
            top_20artists.append(artist8)
            let artist9 = Artist(id:"9", name: "Chase 9", artist_image_url: "9.com")
            top_20artists.append(artist9)
            let artist10 = Artist(id:"10", name: "Chase 10", artist_image_url: "10.com")
            top_20artists.append(artist10)
            let artist11 = Artist(id:"11", name: "Chase 11", artist_image_url: "11.com")
            top_20artists.append(artist11)
            let artist12 = Artist(id:"12", name: "Chase 12", artist_image_url: "12.com")
            top_20artists.append(artist12)
            let artist13 = Artist(id:"13", name: "Chase 13", artist_image_url: "13.com")
            top_20artists.append(artist13)
            let artist14 = Artist(id:"14", name: "Chase 14", artist_image_url: "14.com")
            top_20artists.append(artist14)
            let artist15 = Artist(id:"15", name: "Chase 15", artist_image_url: "15.com")
            top_20artists.append(artist15)
            let artist16 = Artist(id:"16", name: "Chase 16", artist_image_url: "16.com")
            top_20artists.append(artist16)
            let artist17 = Artist(id:"17", name: "Chase 17", artist_image_url: "17.com")
            top_20artists.append(artist17)
            let artist18 = Artist(id:"18", name: "Chase 18", artist_image_url: "18.com")
            top_20artists.append(artist18)
            let artist19 = Artist(id:"19", name: "Chase 19", artist_image_url: "19.com")
            top_20artists.append(artist19)
            let artist20 = Artist(id:"20", name: "Chase 20", artist_image_url: "20.com")
            top_20artists.append(artist20)
    
    let his = History(top_3_songs: top_3songs, top_3_artists: top_3artists, top_20_songs: top_20songs, top_20_artists: top_20artists)
    let his_converted = his.toAnyObject() as? NSDictionary


    let person = UserInfo(f_name:"Catherine",l_name: "Du", age: 21, pronouns: "they/she", bio: "i live so i love",profile_picture_url: "google.com")
    let personConverted = person.toAnyObject() as? NSDictionary

    let one = User(id: "cdu2620", matches: match1, personal_info:person, spotify_history: his)
    let oneConverted = one.toAnyObject() as? NSDictionary

    one_way_matches.append(one)
    let match2 = Match(one_way_matches: one_way_matches, two_way_matches: two_way_matches)
    let match_converted = match2.toAnyObject() as? NSDictionary

    let person2 = UserInfo(f_name:"Joyce",l_name: "Wu", age: 21, pronouns: "she/her", bio: "hello",profile_picture_url: "google.com")
    let two = User(id: "joycewu", matches: match2, personal_info:person2, spotify_history: his)
    let twoConverted = two.toAnyObject() as? NSDictionary

    two_way_matches.append(two)
    let match3 = Match(one_way_matches: one_way_matches, two_way_matches: two_way_matches)
    let match3_converted = match3.toAnyObject() as? NSDictionary

    let person3 = UserInfo(f_name:"Joanna",l_name: "Miao", age: 20, pronouns: "she/her", bio: "hello lol",profile_picture_url: "google.com")
    let three = User(id: "joannamiao", matches: match3, personal_info:person3, spotify_history: his)
    let threeConverted = three.toAnyObject() as? NSDictionary

    
    var vm = ViewModel()
    let (score, artistList, songList) = vm.matching(one, two)
//    let song_converted = song1.toAnyObject() as? NSDictionary
//    if let song_name = song_converted?["song_name"] as?  String {
//        XCTAssertEqual(song_name, "Butter")
//    }
    XCTAssertEqual(score, 100)
    XCTAssertEqual(artistList.count, 20)
    for (i, artist) in artistList.enumerated() {
      if (i == 0) {
        XCTAssertEqual(artistList[0].name,artist1.name)
      } else if (i == 1) {
        XCTAssertEqual(artistList[1].name,artist2.name)
      } else if (i == 2) {
        XCTAssertEqual(artistList[2].name,artist3.name)
      }
    }
    XCTAssertEqual(songList.count, 20)
    
  }

    func testUserModel() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var top_3songs = [Song]()
        var top_20songs = [Song]()
        var top_3artists = [SpotiFriends.Artist]()
        var top_20artists = [SpotiFriends.Artist]()
        var one_way_matches = [User]()
        var two_way_matches = [User]()
        let match1 = Match(one_way_matches: one_way_matches, two_way_matches: two_way_matches)
        let song1 = Song(id: "5", song_name: "Butter", artist: "BTS", album_image_url: "google.com")
        let song_converted = song1.toAnyObject() as? NSDictionary
        if let song_name = song_converted?["song_name"] as?  String {
            XCTAssertEqual(song_name, "Butter")
        }
        if let id = song_converted?["id"] as? String {
              XCTAssertEqual(id, "5")
            }
            if let artist = song_converted?["artist"] as? String {
              XCTAssertEqual(artist, "BTS")
            }
            if let album_image_url = song_converted?["album_image_url"] as? String {
              XCTAssertEqual(album_image_url, "google.com")
            }
        top_3songs.append(song1)
        top_20songs.append(song1)
        let song2 = Song(id: "6", song_name: "Afterglow", artist: "Taylor Swift", album_image_url: "google.com")
        top_3songs.append(song2)
        top_20songs.append(song2)
        let song3 = Song(id: "7", song_name: "SHOOT!", artist: "ITZY", album_image_url: "google.com")
        top_3songs.append(song3)
        top_20songs.append(song3)
        let song4 = Song(id: "14", song_name: "fourteen", artist: "Taylor 14", album_image_url: "14.com")
        top_20songs.append(song4)
        let song5 = Song(id: "15", song_name: "fifteen", artist: "Taylor 15", album_image_url: "15.com")
        top_20songs.append(song5)
        let song6 = Song(id: "16", song_name: "sixteen", artist: "Taylor 16", album_image_url: "16.com")
        top_20songs.append(song6)
        let song7 = Song(id: "17", song_name: "seventeen", artist: "Taylor 17", album_image_url: "17.com")
        top_20songs.append(song7)
        let song8 = Song(id: "18", song_name: "eighteen", artist: "Taylor 18", album_image_url: "18.com")
        top_20songs.append(song8)
        let song9 = Song(id: "19", song_name: "nineteen", artist: "Taylor 19", album_image_url: "19.com")
        top_20songs.append(song9)
        let song10 = Song(id: "20", song_name: "twenty", artist: "Taylor 20", album_image_url: "20.com")
        top_20songs.append(song10)
        let song11 = Song(id: "21", song_name: "twentyone", artist: "Taylor 21", album_image_url: "21.com")
        top_20songs.append(song11)
        let song12 = Song(id: "22", song_name: "twentytwo", artist: "Taylor 22", album_image_url: "22.com")
        top_20songs.append(song12)
        let song13 = Song(id: "23", song_name: "twentythree", artist: "Taylor 23", album_image_url: "23.com")
        top_20songs.append(song13)
        let song14 = Song(id: "24", song_name: "twentyfour", artist: "Taylor 24", album_image_url: "24.com")
        top_20songs.append(song14)
        let song15 = Song(id: "25", song_name: "twentyfive", artist: "Taylor 25", album_image_url: "25.com")
        top_20songs.append(song15)
        let song16 = Song(id: "26", song_name: "twentysix", artist: "Taylor 26", album_image_url: "26.com")
        top_20songs.append(song16)
        let song17 = Song(id: "27", song_name: "twentyseven", artist: "Taylor 27", album_image_url: "27.com")
        top_20songs.append(song17)
        let song18 = Song(id: "28", song_name: "twentyeight", artist: "Taylor 28", album_image_url: "28.com")
        top_20songs.append(song18)
        let song19 = Song(id: "29", song_name: "twentynine", artist: "Taylor 29", album_image_url: "29.com")
        top_20songs.append(song19)
        let song20 = Song(id: "30", song_name: "thirty", artist: "Taylor 30", album_image_url: "30.com")
        top_20songs.append(song20)
        let artist1 = Artist(id:"1", name: "BTS", artist_image_url: "google.com")
        let artist_converted = artist1.toAnyObject() as? NSDictionary
        if let artist_name = artist_converted?["name"] as?  String {
            XCTAssertEqual(artist_name, "BTS")
        }
        if let artist_id = artist_converted?["id"] as? String {
          XCTAssertEqual(artist_id, "1")
        }
        if let artist_image_url = artist_converted?["artist_image_url"] as? String {
          XCTAssertEqual(artist_image_url, "google.com")
        }
//
//      let artist1 = Artist(id:"1", name: "BTS", artist_image_url: "google.com")
  //    let artist_converted = artist1.toAnyObject() as? NSDictionary
      
      top_3artists.append(artist1)
              top_20artists.append(artist1)
              let artist2 = Artist(id:"2", name: "Taylor Swift", artist_image_url: "google.com")
              top_3artists.append(artist2)
              top_20artists.append(artist2)
              let artist3 = Artist(id:"3", name: "Chase Atlantic", artist_image_url: "google.com")
              top_3artists.append(artist3)
              top_20artists.append(artist3)
              let artist4 = Artist(id:"4", name: "Chase 4", artist_image_url: "4.com")
              top_20artists.append(artist4)
              let artist5 = Artist(id:"5", name: "Chase 5", artist_image_url: "5.com")
              top_20artists.append(artist5)
              let artist6 = Artist(id:"6", name: "Chase 6", artist_image_url: "6.com")
              top_20artists.append(artist6)
              let artist7 = Artist(id:"7", name: "Chase 7", artist_image_url: "7.com")
              top_20artists.append(artist7)
              let artist8 = Artist(id:"8", name: "Chase 8", artist_image_url: "8.com")
              top_20artists.append(artist8)
              let artist9 = Artist(id:"9", name: "Chase 9", artist_image_url: "9.com")
              top_20artists.append(artist9)
              let artist10 = Artist(id:"10", name: "Chase 10", artist_image_url: "10.com")
              top_20artists.append(artist10)
              let artist11 = Artist(id:"11", name: "Chase 11", artist_image_url: "11.com")
              top_20artists.append(artist11)
              let artist12 = Artist(id:"12", name: "Chase 12", artist_image_url: "12.com")
              top_20artists.append(artist12)
              let artist13 = Artist(id:"13", name: "Chase 13", artist_image_url: "13.com")
              top_20artists.append(artist13)
              let artist14 = Artist(id:"14", name: "Chase 14", artist_image_url: "14.com")
              top_20artists.append(artist14)
              let artist15 = Artist(id:"15", name: "Chase 15", artist_image_url: "15.com")
              top_20artists.append(artist15)
              let artist16 = Artist(id:"16", name: "Chase 16", artist_image_url: "16.com")
              top_20artists.append(artist16)
              let artist17 = Artist(id:"17", name: "Chase 17", artist_image_url: "17.com")
              top_20artists.append(artist17)
              let artist18 = Artist(id:"18", name: "Chase 18", artist_image_url: "18.com")
              top_20artists.append(artist18)
              let artist19 = Artist(id:"19", name: "Chase 19", artist_image_url: "19.com")
              top_20artists.append(artist19)
              let artist20 = Artist(id:"20", name: "Chase 20", artist_image_url: "20.com")
              top_20artists.append(artist20)

        let his = History(top_3_songs: top_3songs, top_3_artists: top_3artists, top_20_songs: top_20songs, top_20_artists: top_20artists)
        let his_converted = his.toAnyObject() as? NSDictionary
        if let top_3_songs = his_converted?["top_3_songs"] as? [Song] {
            XCTAssertEqual(top_3_songs.count, 3)
        }
        if let top_3_artists = his_converted?["top_3_artists"] as? [SpotiFriends.Artist] {
            XCTAssertEqual(top_3_artists.count, 3)
        }
        if let top_20_songs = his_converted?["top_20_songs"] as? [Song] {
            XCTAssertEqual(top_20_songs.count, 20)
        }
        if let top_20_artists = his_converted?["top_20_artists"] as? [SpotiFriends.Artist] {
            XCTAssertEqual(top_20_artists.count, 20)
        }
        let person = UserInfo(f_name:"Catherine",l_name: "Du", age: 21, pronouns: "they/she", bio: "i live so i love",profile_picture_url: "google.com")
        let personConverted = person.toAnyObject() as? NSDictionary
        if let f_name = personConverted?["f_name"] as? String {
          XCTAssertEqual(f_name, "Catherine")
        }
        if let l_name = personConverted?["l_name"] as? String {
          XCTAssertEqual(l_name, "Du")
        }
        if let age = personConverted?["age"] as? Int {
          XCTAssertEqual(age, 21)
        }
        if let pronouns = personConverted?["pronouns"] as? String {
          XCTAssertEqual(pronouns, "they/she")
        }
        if let bio = personConverted?["bio"] as? String {
          XCTAssertEqual(bio, "i live so i love")
        }
        if let profile_picture_url = personConverted?["profile_picture_url"] as? String {
          XCTAssertEqual(profile_picture_url, "google.com")
        }
        let one = User(id: "cdu2620", matches: match1, personal_info:person, spotify_history: his)
        let oneConverted = one.toAnyObject() as? NSDictionary
        if let user_id = oneConverted?["id"] as? String {
          XCTAssertEqual(user_id, "cdu2620")
        }
        if let personal_info = oneConverted?["personal_info"] as? UserInfo {
            XCTAssertEqual(personal_info.age, 21)
        }
        if let spotify_history = oneConverted?["spotify_history"] as? History {
            XCTAssertEqual(spotify_history.top_3_songs.count, 3)
        }
        one_way_matches.append(one)
        let match2 = Match(one_way_matches: one_way_matches, two_way_matches: two_way_matches)
        let match_converted = match2.toAnyObject() as? NSDictionary
        if let one_way = match_converted?["one_way_matches"] as? [Song] {
            XCTAssertEqual(one_way.count, 1)
        }
        let person2 = UserInfo(f_name:"Joyce",l_name: "Wu", age: 21, pronouns: "she/her", bio: "hello",profile_picture_url: "google.com")
        let two = User(id: "joycewu", matches: match2, personal_info:person2, spotify_history: his)
        let twoConverted = two.toAnyObject() as? NSDictionary
        if let matches1 = twoConverted?["matches"] as? Match {
            XCTAssertEqual(matches1.one_way_matches.count, 1)
        }
        two_way_matches.append(two)
        let match3 = Match(one_way_matches: one_way_matches, two_way_matches: two_way_matches)
        let match3_converted = match3.toAnyObject() as? NSDictionary
        if let two_way = match3_converted?["two_way_matches"] as? [Song] {
            XCTAssertEqual(two_way.count, 1)
        }
        let person3 = UserInfo(f_name:"Joanna",l_name: "Miao", age: 20, pronouns: "she/her", bio: "hello lol",profile_picture_url: "google.com")
        let three = User(id: "joannamiao", matches: match3, personal_info:person3, spotify_history: his)
        let threeConverted = three.toAnyObject() as? NSDictionary
        if let matches2 = threeConverted?["matches"] as? Match {
            XCTAssertEqual(matches2.two_way_matches.count, 1)
        }
    }
    

    func testAPICalls() throws {
        let namePath = "/users/cdu2620/spotify_history/top_3_songs/1/song_name"
        let nameRef = Database.database().reference().child(namePath)
        nameRef.observe(.value, with: { snapshot in
            if let snapCast = snapshot.value as? String
            {
                XCTAssertEqual(snapCast, "DNA")

            }
        })
        Spartan.authorizationToken = "BQBP-tMWgc9VAwYTBEMbbwbSJC-xmiR2_5w3LWvoL-f6xDZRQrYZv0pS2RL5zUqPmuxZpYyQ2ADddGPBrNEhwinWoDAL5CN3ylq5Rq0_cczXq4QwjTnCdW-rQ6-HE1VHDqy8eYNP5IZN9MFXMZPXvzo8dJOiRw"
        let apiCallSongs = Spartan.getMyTopTracks(limit: 3, offset: 0, timeRange: .mediumTerm, success: { (pagingObject) in
            XCTAssertEqual(pagingObject.items.count, 3)
        }, failure: { (error) in
            print(error)
        })
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
