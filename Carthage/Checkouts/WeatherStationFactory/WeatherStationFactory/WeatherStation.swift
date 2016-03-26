//
//  WeatherStation.swift
//  WeatherStationFactory
//
//  Created by Said Sikira on 3/23/16.
//  Copyright © 2016 CityOS. All rights reserved.
//

import CoreCityOS

public class WeatherStation: DeviceType {
    public var deviceData: DeviceData
    public var creationDate: NSDate?
    public var location: DeviceLocation?
    public var dataCollection: LiveDataCollectionType
    
    public init(deviceID: String, location: DeviceLocation? = nil) {
        self.deviceData = DeviceData(deviceID: deviceID)
        self.location = location
        self.dataCollection = WeatherStationDataCollection(deviceID: deviceID)
    }
}
