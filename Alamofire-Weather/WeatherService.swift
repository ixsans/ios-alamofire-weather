//
//  WeatherService.swift
//  Alamofire-Weather
//
//  Created by Ikhsan on 22/11/17.
//  Copyright © 2017 Ikhsan. All rights reserved.
//

import Foundation 
import Alamofire

class WeatherService
{
    let forecastApiKey: String
    let forecastApiBaseUrl: String
    
    init(ApiKey: String)
    {
        self.forecastApiKey = ApiKey
        forecastApiBaseUrl = "https://api.darksky.net/forecast/\(ApiKey)"
    }
    
    func getForecastedWeather(latitude: Double, longitude: Double, completion: @escaping (CurrentWeather?) -> Void)
    {
        if let url = URL(string:  "\(forecastApiBaseUrl)/\(latitude),\(longitude)")
        {
            Alamofire.request(url).responseJSON { response in
                if let jsonDictionary = response.result.value as? [String : Any]
                {
                    
                    if let currentWeatherDict = jsonDictionary["currently"] as? [String: Any]
                    {
                        let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDict)
                        
                        if let city = jsonDictionary["timezone"] as? String
                        {
                            currentWeather.city = city
                        }
                        completion(currentWeather)
                    }else
                    {
                        completion(nil)
                    }
                }
                
            }
        }
        
    }
    
}
