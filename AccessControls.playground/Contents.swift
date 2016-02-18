//: Playground - noun: a place where people can play

import UIKit

public class SomePublicClass {

    public var somePublicProperty = 0
    
    var someInternalProperty = 0
    
    private func somePrivateMethod() {}
}

internal class SomeInternalClass {

    var someInternalProperty = 0
    
    private func somePrivateMethod() {}
}

private class SomePrivateClass {

    var somePrivateProperty = 0
    
    func somePrivateMethod() {}
}

public var somePublicVariable = 0

internal let someInternalConstant = 0

private func somePrivateFunction() {}

var internalInstance = SomeInternalClass()

private var privateInstance = SomePrivateClass()

private func someFunction() -> (SomeInternalClass) {
    
    return internalInstance
}

public enum CompassPoint {
    
    case North
    
    case South
    
    case East
    
    case West
}

public class A {
    
    private func someMethod() {}
}

internal class B: A {
    
    override internal func someMethod() {
    
        super.someMethod()
    }
}

public struct TrackedString { // struct is internal -> public
    
    public private(set) var numberOfEdits = 0 // numberOfEdits Setter is private, but Getter is Internal -> Public
    
    public var value: String = "" { // value is internal -> public
        
        didSet {
            
            numberOfEdits++
        }
    }
    
    public init() {}
}

var str = TrackedString()

str.value = "5"

str.value = "8"

str.value = "20"

print(str.numberOfEdits)


























