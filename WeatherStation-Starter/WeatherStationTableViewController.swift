//
//  WeatherStationTableViewController.swift
//  WeatherStation-Starter
//
//  Created by Said Sikira on 3/26/16.
//  Copyright © 2016 CityOS. All rights reserved.
//

import UIKit
import CoreCityOS
import WeatherStationFactory

class WeatherStationTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Weather Station"
        self.tableView.rowHeight = 60
        self.tableView.estimatedRowHeight = 60
    
        WeatherFactory.sharedInstance.getLatestData {
            device, error in
            print(device?.dataCollection)
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - Table view data source
extension WeatherStationTableViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("sensorCell", forIndexPath: indexPath)
        
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Sensors"
    }
}
