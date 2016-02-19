//: Playground - noun: a place where people can play

import UIKit

// Bitwise NOT: invert the bits

let initialBits: UInt8 = 0b00001111

let invertedBits = ~initialBits

print(invertedBits)

// Bitwise AND: set to 1 if both inputs are 1

let firstSixBits: UInt8 = 0b11111100

let lastSixBits: UInt8 = 0b00111111

let middleSixBits = firstSixBits & lastSixBits

// Bitwise OR: set to 1 if either inputs is 1.

let middleSixBitsOr = firstSixBits | lastSixBits

// Bitwise XOR: set to 1 if inputs are different, and set to 0 if inputs are the same.

let middleSixBitsXor = firstSixBits ^ lastSixBits

// Shifting Operators

let shiftBits: UInt8 = 4 // 00000100 in the binary

shiftBits << 1 // 00001000

shiftBits << 2 // 00010000

shiftBits << 3 // 00100000

shiftBits << 5 // 10000000

shiftBits >> 2 // 00000001

// Shifting Behavior for Un-signed Interger

let pink: UInt32 = 0xCC6699 // Each pair of characters in a HEXADECIMAL number use 8 BITs.

let red = (pink & 0xFF0000) >> 16

let green = (pink & 0x00FF00) >> 8

let blue = (pink & 0x0000FF)

// Overflow Operators

// Signed Integer Overflow

var potentialOverflow = Int16.max

potentialOverflow &+ 1

var potentialOverflowMin = Int16.min

potentialOverflowMin &- 1

// Unsigned Integer Overflow

var unsignedOverflow = UInt8.max

unsignedOverflow &+ 1

var unsignedOverflowMin = UInt8.min

unsignedOverflowMin &- 1

// Operator Functions

struct Vector2D {
    
    var x = 0.0, y = 0.0
}

func + (left: Vector2D, right: Vector2D) -> Vector2D {
    
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let vector = Vector2D(x: 1.0, y: 2.0)

let anotherVector = Vector2D(x: 3.0, y: 2.0)

let combinedVector = vector + anotherVector

print(combinedVector)

prefix func - (vector: Vector2D) -> Vector2D {
    
    return Vector2D(x: -vector.x, y: -vector.y)
}

let positive = Vector2D(x: 3.0, y: 4.0)

let negative = -positive

print(negative)

func += (inout left: Vector2D, right: Vector2D) {
    
    left = left + right
}

var original = Vector2D(x: 1.0, y: 2.0)

var vectorToAdd = Vector2D(x: 3.0, y: 4.0)

original += vectorToAdd

print(original)

postfix func ++ (inout vector: Vector2D) -> Vector2D {
    
    vector += Vector2D(x: 1.0, y: 1.0)
    
    return vector
}

var toIncrement = Vector2D(x: 3.0, y: 4.0)

let afterIncrement = toIncrement++

print(toIncrement)

print(afterIncrement)

// Equivalence Operators

func == (left: Vector2D, right: Vector2D) -> Bool {
    
    return (left.x == right.x) && (left.y == right.y)
}

func != (left: Vector2D, right: Vector2D) -> Bool {
    
    return !(left == right)
}

let vectorOne = Vector2D(x: 1.0, y: 2.0)

let vectorTwo = Vector2D(x: 1.0, y: 3.0)

if vectorOne == vectorTwo {
    
    print("These two vectors are equivalent")

} else {
    
    print("These are not equivalent")
}

// Custom Operators

prefix operator +++ {}

prefix func +++ (inout vector: Vector2D) -> Vector2D {
    
    vector += vector
    
    return vector
}

var vectorDouble = Vector2D(x: 2.0, y: 4.0)

+++vectorDouble

print(vectorDouble)

// Precedence and Associativity for Custom Infix Operators

infix operator +- { associativity left precedence 140 }

func +- (left: Vector2D, right: Vector2D) -> Vector2D {
    
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
}

let firstVector = Vector2D(x: 1.0, y: 2.0)

let secondVector = Vector2D(x: 3.0, y: 4.0)

let thirdVector = firstVector +- secondVector

print(thirdVector)


















