//: Playground - noun: a place where people can play

import UIKit

class MediaItem {
    
    var name: String
    
    init(name: String) {
        
        self.name = name
    }
}

class Movie: MediaItem {
    
    var director: String
    
    init(name: String, director: String) {
        
        self.director = director
        
        super.init(name: name)
    }
}

class Song: MediaItem {
    
    var artist: String
    
    init(name: String, artist: String) {
        
        self.artist = artist
        
        super.init(name: name)
    }
}

let library = [

    Movie(name: "Casablanca", director: "Michael Curtiz"),
    
    Movie(name: "Blue Suede Shoes", director: "Elvis Presley"),
    
    Song(name: "Citizen Kane", artist: "Orson Welles"),
    
    Song(name: "The One and Only", artist: "Chesney Hawkes"),
    
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

var movieCount = 0

var songCount = 0

for item in library {
    
    if item is Movie {
        
        ++movieCount
        
    } else if item is Song {
        
        ++songCount
    }
}

print("\(movieCount) movies and \(songCount) songs.")

for item in library {
    
    if let movie = item as? Movie {
        
        print("Movie: \(movie.name), Director: \(movie.director)")
        
    } else if let song = item as? Song {
        
        print("Song: \(song.name), Artist: \(song.artist)")
    }
}

let someObjects: [AnyObject] = [

    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    
    Movie(name: "Moon", director: "Duncan Jones"),
    
    Movie(name: "Alien", director: "Ridley Scott")
    
]

//for object in someObjects {
//    
//    let movie = object as! Movie
//    
//    print("Movie: \(movie.name), Director: \(movie.director)")
//}

//Shorter Code

for movie in someObjects as! [Movie] {
    
    print("Movie: \(movie.name), Director: \(movie.director)")
}

//var things = [Any]()
//
//things.append(0)
//
//things.append(0.0)
//
//things.append(42)
//
//things.append(3.14159)
//
//things.append("hello")
//
//things.append((3.0 , 5.0))
//
//things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
//
//things.append({(name: String) -> String in "Hello, \(name)" })

















