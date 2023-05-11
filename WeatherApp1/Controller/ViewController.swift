//
//  ViewController.swift
//  WeatherApp1
//
//  Created by Mantiz on 25/03/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController{
    

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
    
    
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    let date = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        weatherManager.delegate = self
        searchField.delegate = self
        
        day1.text = "mon"
        imageDay1.image = UIImage(named: "sun")
        temp1.text = "30"
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
            self.humidityLabel.text = weather.humidityString
            self.windLabel.text = weather.windSpeedString
            self.rainFallLabel.text = weather.feelslikeString
        }
    }
    
    func didFailWithError(error: Error) {
        print (error)
    }
}

//MARK: - ForecastManagerDelegate

//MARK: - Location

extension ViewController: CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
               }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Failed to get users location.")
        }
}

