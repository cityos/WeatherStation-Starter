//
//  WeatherStationDataCollection.swift
//  WeatherStationFactory
//
//  Created by Said Sikira on 3/23/16.
//  Copyright © 2016 CityOS. All rights reserved.
//

import CoreCityOS

public class WeatherStationDataCollection: LiveDataCollectionType {
    public var creationDate: NSDate
    public var deviceData: DeviceData
    public var allReadings: [LiveDataType] = []
    
    public var temperature: LiveDataType {
        return LiveData(
            dataType: .Temperature,
            jsonKey: "temperature",
            unitNotation: "C"
        )
    }
    
    public var humidity: LiveDataType {
        return LiveData(
            dataType: .Humidity,
            jsonKey: "humidity",
            unitNotation: "%"
        )
    }
    
    public var pm10: LiveDataType {
        return LiveData(
            dataType: .ParticleMatter10,
            jsonKey: "pm",
            unitNotation: "ug"
        )
    }
    
    public init(deviceID: String) {
        self.creationDate = NSDate()
        self.deviceData = DeviceData(deviceID: deviceID)
        self.allReadings = [
            temperature,
            humidity,
            pm10
        ]
    }
}
