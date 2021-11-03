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

    func testUserModel() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var top_3songs = [Song]()
        var top_20songs = [Song]()
        var top_3artists = [SpotiFriends.Artist]()
        var top_20artists = [SpotiFriends.Artist]()
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
        let one = User(personal_info:person, spotify_history: his)
        let oneConverted = one.toAnyObject() as? NSDictionary
        if let personal_info = oneConverted?["personal_info"] as? UserInfo {
            XCTAssertEqual(personal_info.age, 21)
        }
        if let spotify_history = oneConverted?["spotify_history"] as? History {
            XCTAssertEqual(spotify_history.top_3_songs.count, 3)
        }
//        let converted = one.toAnyObject() as? NSDictionary
    }
    

    func testAPICalls() throws {
        let namePath = "/users/user7/spotify_history/top_3_songs/1/song_name"
        let nameRef = Database.database().reference().child(namePath)
        nameRef.observe(.value, with: { snapshot in
            if let snapCast = snapshot.value as? String
            {
                XCTAssertEqual(snapCast, "Epiphany")

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
