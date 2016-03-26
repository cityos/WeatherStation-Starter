//
//  Backend.swift
//  WeatherStationFactory
//
//  Created by Said Sikira on 3/24/16.
//  Copyright © 2016 CityOS. All rights reserved.
//

import Foundation

public class Backend {

   public class func requestLatestData(completion: (data: Dictionary<String, AnyObject>?, error: ErrorType?) -> ()) {
        let session = NSURLSession.sharedSession()
        let token = "GpXWXBrhxMrBfxmf1bfhqm1sbMLG"
        
        let address = "https://api.flowthings.io/v0.1/ceco/drop/f56f445be5bb70953a92d1379?limit=1&hints=0"
        let escapedAddress = address.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
    
        let url = NSURL(string: escapedAddress!)!
        let request = NSMutableURLRequest(URL: url)
        request.setValue(token, forHTTPHeaderField: "X-Auth-Token")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = session.dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                completion(data: nil, error: error!)
            } else {
                do {
                    let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: [])
                    
                    if let jsonData = jsonData as? [String: AnyObject] {
                        if let body = jsonData["body"] as? [[String:AnyObject]] {
                            if let elems = body[0]["elems"] as? [String:AnyObject]{
                                
                                completion(data: elems, error: nil)
                            }
                        }
                    }
                } catch {
                    completion(data: nil, error: error)
                }
            }
            
        }
        task.resume()
    }
}