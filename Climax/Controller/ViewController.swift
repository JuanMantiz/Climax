//
//  ViewController.swift
//  Climax
//
//  Created by Mantiz on 25/03/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController{
    

    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var weatherMainLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var rainFallLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var day1: UILabel!
    @IBOutlet weak var imageDay1: UIImageView!
    @IBOutlet weak var temp1: UILabel!
    @IBOutlet weak var day2Label: UILabel!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var temp2Label: UILabel!
    @IBOutlet weak var day3Label: UILabel!
    @IBOutlet weak var imageDay3: UIImageView!
    @IBOutlet weak var tempDay3: UILabel!
    @IBOutlet weak var day4Label: UILabel!
    @IBOutlet weak var imageDay4: UIImageView!
    @IBOutlet weak var tempDay4: UILabel!
    @IBOutlet weak var day5Label: UILabel!
    @IBOutlet weak var tempDay5: UILabel!
    @IBOutlet weak var imageDay5: UIImageView!
    
  
    @IBOutlet weak var nextDay1View: UIView!
    @IBOutlet weak var nextDay2View: UIView!
    @IBOutlet weak var nextDay3View: UIView!
    @IBOutlet weak var nextDay4View: UIView!
    @IBOutlet weak var nextDay5View: UIView!
    
    
    @IBOutlet weak var humidityRowView: UIView!
    @IBOutlet weak var feelsLikeRowView: UIView!
    @IBOutlet weak var windRowView: UIView!

    var forecastManager = ForecastManager()
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
  
    private var daysOfTheWeek : [String] = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        weatherManager.delegate = self
        forecastManager.forecastDelegate = self
        searchField.delegate = self
        
        nextDay1View.backgroundColor = UIColor(white: 1, alpha: 0.5)
        nextDay2View.backgroundColor = UIColor(white: 1, alpha: 0.5)
        nextDay3View.backgroundColor = UIColor(white: 1, alpha: 0.5)
        nextDay4View.backgroundColor = UIColor(white: 1, alpha: 0.5)
        nextDay5View.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        humidityRowView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        windRowView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        feelsLikeRowView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        searchField.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        let date = Date()
        let format = "E, d MMM"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format

        dateLabel.text = dateFormatter.string(from: date)
        let dayPrefix = dateFormatter.string(from: date)
        
        sortToCurrentDay(currentDay: String(dayPrefix.prefix(3)), weekDays: daysOfTheWeek)
        
        day1.text = daysOfTheWeek[1]
        day2Label.text = daysOfTheWeek[2]
        day3Label.text = daysOfTheWeek[3]
        day4Label.text = daysOfTheWeek[4]
        day5Label.text = daysOfTheWeek[5]
        
    }

    @IBAction func locationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    
    @IBOutlet weak var background: UIImageView!
}

//MARK: - UITextViewDelegate

extension ViewController: UITextFieldDelegate {
    @IBAction func searchButton(_ sender: UIButton) {
        searchField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchField.text {
            weatherManager.fetchWeather(cityName: city)
            forecastManager.fetchForecast(cityName: city)
        }
        searchField.text = ""
    }
}
    
    //MARK: - WeatherManagerDelegate
extension ViewController: WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.countryLabel.text = weather.countryName
            self.temperatureLabel.text = weather.temperatureString
            self.weatherMainLabel.text = weather.weatherMain
            self.humidityLabel.text = "\(weather.humidityString)%"
            self.windLabel.text = "\(weather.windSpeedString)km/h"
            self.rainFallLabel.text = "\(weather.feelslikeString)°C"
            self.conditionImage.image = UIImage(named: weather.conditionName)
        }
    }

    func didFailWithError(error: Error) {
        print (error)
    }
}

//MARK: - ForecastManagerDelegate
extension ViewController: ForecastManagerDelegate{

    func didUpdateForecast(_ forecastManager: ForecastManager, forecast: ForecastModel) {
        DispatchQueue.main.async {
            self.imageDay1.image = UIImage(named: forecast.conditionName1)
            self.imageView2.image = UIImage(named: forecast.conditionName2)
            self.imageDay3.image = UIImage(named: forecast.conditionName3)
            self.imageDay4.image = UIImage(named: forecast.conditionName4)
            self.imageDay5.image = UIImage(named: forecast.conditionName5)
            self.temp1.text = "\(forecast.forecasteTemperatureString1)°C"
            self.temp2Label.text = "\(forecast.forecasteTemperatureString2)°C"
            self.tempDay3.text = "\(forecast.forecasteTemperatureString3)°C"
            self.tempDay4.text = "\(forecast.forecasteTemperatureString4)°C"
            self.tempDay5.text = "\(forecast.forecasteTemperatureString5)°C"
        }
    }
    func didFailWithErrorForecast(error: Error) {
        print("ForecastError")
    }
    
}

//MARK: - Location

extension ViewController: CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
            forecastManager.fetchForecast(latitude: lat, longitude: lon)
               }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Failed to get users location.")
        }
}

//MARK: - Date Controller

extension ViewController {
   
    func sortToCurrentDay(currentDay: String, weekDays: [String]) {
        while currentDay != daysOfTheWeek[0] {
            daysOfTheWeek.append(daysOfTheWeek[0])
            daysOfTheWeek.remove(at: 0)
        }
        }
    
}
