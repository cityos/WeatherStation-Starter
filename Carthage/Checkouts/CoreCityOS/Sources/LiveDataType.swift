/*
This source file is part of the CoreCityOS open source project

Copyright (c) 2016 CityOS LLC
Licensed under Apache License v2.0

See https://cityos.io/ios/LICENCE.txt for license information
*/

/**
Structures conforming live data type can be used to represent live data.

To see example implementation of this protocol refer to the `LiveData`
*/
public protocol LiveDataType {
    
    /// JSON key under which data value is stored
    var jsonKey: String { get }
    
    /// Data type with identifier, for example Temperature or Humidity
    var type: DataType { get }
    
    /// Unit identifier, for example % or MpH
    var unitNotation: String { get }
    
    /// Holds all readings for data type
    var dataPoints: [DataPoint] { get set }
}

extension LiveDataType {
    
    /// Returns current data point from the `dataPoints` array.
    /// The newest data point is always the first element in the array
    public var currentDataPoint: DataPoint? {
        return dataPoints.first
    }
    
    /**
        Insert data point to the `dataPoints` array at index 0.
        
        - parameter point: DataPoint to add
    */
    public mutating func addDataPoint(point: DataPoint) {
        dataPoints.insert(point, atIndex: 0)
    }
}

extension LiveDataType {
    /**
        Returns full data specifier with value and unit notation

        - returns: String data specifier, for ex. `3 Mhw`
    */
    public func fullDataReadingSpecifier() -> String {
        return "\(self.currentDataPoint) \(self.unitNotation)"
    }
    
    /// Returns date from the last data point that is added to `dataPoints` array
    public var lastUpdateDate: NSDate? {
        return currentDataPoint?.timestamp
    }
}

//MARK: Custom operator definition

infix operator <~ {
associativity left
precedence 100
}

/**
    Use operator `<~` to add `DataPoint` to the `dataPoints` array.
    Operator has the same functionality as the `addDataPoint:` on `LiveDataType`
    protocol instance
*/
public func <~ <T: LiveDataType>(inout lhs: T, rhs: DataPoint) {
    lhs.addDataPoint(rhs)
}

public func <~ <T: LiveDataType>(inout lhs: T, rhs: [DataPoint]) {
    for dataPoint in rhs {
        lhs.addDataPoint(dataPoint)
    }
}
