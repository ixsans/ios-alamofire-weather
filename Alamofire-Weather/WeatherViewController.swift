//
//  WeatherViewController.swift
//  Alamofire-Weather
//
//  Created by Ikhsan on 23/11/17.
//  Copyright © 2017 Ikhsan. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureScaleLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    
    let forecastApiKey = "0219438e3cdb6ce669997794f88d907c"
    var weatherService: WeatherService!
    var coordinate: (lat: Double, lng: Double) = (7.803249,110.3398254) //Yogyakarta
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        weatherService = WeatherService(ApiKey: forecastApiKey)
        weatherService.getForecastedWeather(latitude: coordinate.lat, longitude: coordinate.lng, completion: {
            (currentWeather) in
            if let currentWeather = currentWeather {
                DispatchQueue.main.async {
                    if let temperature = currentWeather.temperature{
                        self.temperatureLabel.text = "\(self.fahrenheitToCalcius(value: temperature))°"
                    }else{
                        self.temperatureLabel.text = "-"
                    }
                    
                    if let city = currentWeather.city {
                        self.cityLabel.text = city
                    }else{
                        self.cityLabel.text = "-"
                    }
                    
                    if let icon = currentWeather.icon {
                        self.weatherIcon.image = UIImage(named: icon)
                        print("icon:\(icon)")
                    }else{
                        self.weatherIcon.isHidden = true
                    }
                    
                    if let summary = currentWeather.summary{
                        self.summaryLabel.text = summary
                    }
                }
            }
        })
    }
    
    func fahrenheitToCalcius(value: Int) -> Int
    {
        return (Int) (Double(value-32) * 0.5556)
    }

    

}
