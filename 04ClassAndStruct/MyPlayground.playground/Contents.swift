import UIKit

// MARK: - Class

/// 1) Class: can hold properties and methods
/// Properties: stored properties (or computed properties)
/// Methods: declare with func keyword, parameters, and return value
    
/// 2) Static vs Instances
/// Static property lives on the class type itself
/// Instance property lives on an instance/object of the class

/// 3) Class are reference type

/// 4) Classes can use inheritance
/// Override functions
    
/// 5) Initializing A Class
/// Properties without initial values needs to be given a value by an initializer
/// Optional properties are automatically set to nil
/// Can have multiple init functions
   

// MARK: - Struct

/// 1) same as class
/// 2) same as class

/// 3) Structs are value type

/// 3b) Structs are immutable by default, have to use keyword "mutating" to change properties

/// 4) Structs does not have OOP inheritances, uses protocol inheritance/conformance

/// 5) auto-generated initializer, don't have to write init func
    

// MARK: - Summary
/// What is a Value Type?
/// Struct: faster and more performant
/// - accessed in "stack" memory (faster)
/// - classes/references lives in "heap" memory (look up time)
/// value type: passed by copy
/// Copy-on-write
/// When changed, needs to be var (not let)
