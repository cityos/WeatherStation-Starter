//
//  WeatherStationFactory.swift
//  WeatherStationFactory
//
//  Created by Said Sikira on 3/23/16.
//  Copyright © 2016 CityOS. All rights reserved.
//

import CoreCityOS

public final class WeatherFactory: FactoryType {
    
    public static var sharedInstance: WeatherFactory = WeatherFactory()
    
    /// Requests latest data from backend server
    public func getLatestData(completion: (data: DeviceType?, error: ErrorType?) -> ()) {
        Backend.requestLatestData {
            data, error in
            if error == nil {
                if let data = data {
                    let weatherStationDevice = WeatherStation(deviceID: data["id"] as! String)
                    
                    let temperature = data["temperature"] as! Double
                    let humidity = data["humidity"] as! Double
                    let pm10 = data["pm10"] as! Double
                    
                    weatherStationDevice.dataCollection[.Temperature]?.addDataPoint(DataPoint(value: temperature))
                    weatherStationDevice.dataCollection[.Humidity]?.addDataPoint(DataPoint(value: humidity))
                    weatherStationDevice.dataCollection[.ParticleMatter10]?.addDataPoint(DataPoint(value: pm10))
                    print(weatherStationDevice.dataCollection.allReadings)
                    completion(data: weatherStationDevice, error: nil)
                }
            } else {
                completion(data: nil, error: error)
            }
        }
    }
}
