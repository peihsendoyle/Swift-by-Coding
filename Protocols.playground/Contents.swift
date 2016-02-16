//: Playground - noun: a place where people can play

import UIKit

//Properties Requirements

protocol FullyNamed {
    
    var fullName: String { get }
}

struct Person: FullyNamed {
    
    var fullName: String
}

let john = Person(fullName: "John Appleseed")

print(john.fullName)

class Starship: FullyNamed {
    
    var prefix: String?
    
    var name: String
    
    init(name: String, prefix: String? = nil) {
        
        self.name = name
        
        self.prefix = prefix
    }
    
    var fullName : String {
        
        return (prefix != nil ? prefix! + " " : " ") + name
    }
}

var ncc1701 = Starship(name: "Hieu Hiep", prefix: "Nguyen")

print(ncc1701.fullName)

//Methods Requirements

protocol RandomNumberGenerator {
    
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    
    var lastRandom = 42.0
    
    let m = 139968.0
    
    let a = 3877.0
    
    let c = 29573.0
    
    func random() -> Double {
        
        lastRandom = ((lastRandom * a + c) % m)
        
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()

//print(generator.random())
//
//print(generator.random())

// Mutating Method Requirements

protocol Togglable {
    
    mutating func toggle()
}

enum OnOfSwitch: Togglable {
    
    case On, Off
    
    mutating func toggle() {
        switch self {
            
        case Off:
            
            self = On
            
        case On:
            
            self = Off
        }
    }
}

var lightSwitch = OnOfSwitch.Off

lightSwitch.toggle()

lightSwitch.toggle()

// Initializer Requirements

protocol SomeProtocol {
    
    init()
}

class SomeSuperClass {
    
    init() {
        
        
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocol {
    
    required override init() {
        
        
    }
}

// Protocols as Types

class Dice {
    
    let sides: Int
    
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        
        self.sides = sides
        
        self.generator = generator
    }
    
    func roll() -> Int {
        
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())

for _ in 1...2 {
    
    print("Random dice roll is \(d6.roll())")
}

// DELEGATE

protocol DiceGame {
    
    var dice: Dice { get }
    
    func play()
}

protocol DiceGameDelegate {
    
    func gameDidStart(game: DiceGame)
    
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    
    func gameDidEnd(game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    
    let finalSquare = 25
    
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    
    var square = 0
    
    var board: [Int]
    
    init() {
        
        board = [Int](count: finalSquare + 1, repeatedValue: 0)
        
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02; board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    var delegate: DiceGameDelegate?
    
    func play() {
        
        square = 0
        
        delegate?.gameDidStart(self)
        
        gameLoop: while square != finalSquare {
            
            let diceRoll = dice.roll()
            
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            
            switch square + diceRoll {
                
            case finalSquare:
                
                break gameLoop
                
            case let newSquare where newSquare > finalSquare:
                
                continue gameLoop
                
            default:
                
                square += diceRoll
                
                square += board[square]
            }
        }
        
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    
    var numberOfTurns = 0
    
    func gameDidStart(game: DiceGame) {
        
        numberOfTurns = 0
        
        if game is SnakesAndLadders {
            
            print("Started a new game of Snakes and Ladders")
        }
        
        print("The game is using a \(game.dice.sides)-sided dice.")
    }
    
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        
        ++numberOfTurns
        
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns.")
    }
}

let tracker = DiceGameTracker()

let game = SnakesAndLadders()

game.delegate = tracker

game.play()

// Adding Protocol Conformance with an Extension

protocol TextRepresentable {
    
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    
    var textualDescription: String {
        
        return "A \(sides)-sided dice."
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())

print(d12.textualDescription)

extension SnakesAndLadders: TextRepresentable {
    
    var textualDescription: String {
        
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}

print(game.textualDescription)

//Declaring Protocol Adoption with an Extension

struct Hamster {
    
    var name: String
    
    var textualDescription: String {
        
        return "A hamster named \(name)"
    }
}

extension Hamster: TextRepresentable {}

let simon = Hamster(name: "Simon")

let someText: TextRepresentable = simon

print(someText.textualDescription)

// Protocol Inheritance

protocol PrettyTextRepresentable: TextRepresentable {
    
    var prettyTextualDescription: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    
    var prettyTextualDescription: String {
        
        var output = textualDescription + ":\n"
        
        for index in 1...finalSquare {
            
            switch board[index] {
                
            case let ladder where ladder > 0:
                
                output += "▲ "
                
            case let snake where snake < 0:
                
                output += "▼ "
                
            default:
                
                output += "○ "
            }
        }
        
        return output
    }
}

print(game.prettyTextualDescription)

// Protocol Composition

protocol Named {
    
    var name: String { get }
}

protocol Aged {
    
    var age: Int { get }
}

struct People: Named, Aged {
    
    var name: String
    
    var age: Int
}

func wishHappyBirthday(celebrator: protocol<Named, Aged>) {
    
    print("Happy Birthday \(celebrator.name) - you are \(celebrator.age)")
}

let birthdayPerson = People(name: "Hiep", age: 22)

wishHappyBirthday(birthdayPerson)

// Checking for Protocol Conformance

protocol HasArea {
    
    var area: Double { get }
}

class Circle: HasArea {
    
    let pi = 3.1415927
    
    var radius: Double
    
    var area: Double {
        
        return pi * radius * radius
    }
    
    init(radius: Double) {
        
        self.radius = radius
    }
}

class Country: HasArea {
    
    var area: Double
    
    init(area: Double) {
        
        self.area = area
    }
}

class Animal {
    
    var legs: Int
    
    init(legs: Int) {
        
        self.legs = legs
    }
}

let objects: [AnyObject] = [Circle(radius: 2.0),
    
                            Country(area: 243_610),
    
                            Animal(legs: 4)]

for object in objects {
    
    if let objectWithArea = object as? HasArea {
        
        print("Area is \(objectWithArea.area)")
    
    } else {
        
        print("Something that doesn't have an area")
    }
}

@objc protocol CounterDataSource {
    
    optional func incrementForCount(count: Int) -> Int
    
    optional var fixedIncrement: Int { get }
}

class Counter {
    
    var count = 0
    
    var dataSource: CounterDataSource?
    
    func increment() {
        
        if let amount = dataSource?.incrementForCount?(count) {
            
            count += amount
        
        } else if let amount = dataSource?.fixedIncrement {
            
            count += amount
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    
    let fixedIncrement = 3
}

var counter = Counter()

counter.dataSource = ThreeSource()

for _ in 1...4 {
    
    counter.increment()
    
    print(counter.count)
}

@objc class FunctionSource: NSObject, CounterDataSource {
    
    func incrementForCount(count: Int) -> Int {
        
        if count == 0 {
            
            return 0
        
        } else if count < 0 {
            
            return 1
        
        } else {
            
            return -1
        }
    }
}

counter.count = -4

counter.dataSource = FunctionSource()

for _ in 1...5 {
    
    counter.increment()
    
    print(counter.count)
}

// Protocol Extensions

extension RandomNumberGenerator {
    
    func randomBool() -> Bool {
        
        return random() > 0.5
    }
}

//let generator = LinearCongruentialGenerator()

print("\(generator.random())")

print("\(generator.randomBool())")

// Adding Constraints to Protocol Extensions

extension CollectionType where Generator.Element: TextRepresentable {
    
    var textualDescriptoon: String {
        
        let itemsAsText = self.map { $0.textualDescription }
        
        return "[" + itemsAsText.joinWithSeparator(", ") + "]"
    }
}

let murrayTheHamster = Hamster(name: "Murray")

let morganTheHamster = Hamster(name: "Morgan")

let mauriceTheHamster = Hamster(name: "Maurice")

let hamster = [murrayTheHamster, morganTheHamster, mauriceTheHamster]

print(hamster.textualDescriptoon)























