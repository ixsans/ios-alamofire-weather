//
//  CurrentWeather.swift
//  Alamofire-Weather
//
//  Created by Ikhsan on 22/11/17.
//  Copyright © 2017 Ikhsan. All rights reserved.
//

import Foundation


class CurrentWeather
{
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    let icon: String?
    var city: String? // mutable property
    
    struct WeatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let city = "city"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
        static let icon = "icon"
    }
    
    init(weatherDictionary: [String : Any])
    {
        self.temperature =  weatherDictionary[WeatherKeys.temperature] as! Int?
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Double {
            humidity = Int(humidityDouble * 100)
        }else{
            humidity = nil
        }
        
        if let precipDouble = weatherDictionary[WeatherKeys.precipProbability] as? Double {
           precipProbability = Int(precipDouble * 100 )
        }else{
           precipProbability = nil
        }
        
        self.summary =  weatherDictionary[WeatherKeys.summary] as! String?
        self.icon = weatherDictionary[WeatherKeys.icon] as! String?

    }
    
    
}
