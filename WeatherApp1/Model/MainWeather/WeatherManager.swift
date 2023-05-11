//
//  WeatherManager.swift
//  WeatherApp1
//
//  Created by Mantiz on 29/03/23.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=54d176cbcf5f38995fc23d633dd4ab76&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather (cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with:urlString)
    }
    func fetchWeather (latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest (with urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let sesion = URLSession(configuration: .default)
            
            let task = sesion.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = parseJSON (safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
            }
        }
    func parseJSON (_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodedData.weather[0].id
            let weatherMain = decodedData.weather[0].main
            let name = decodedData.name
            let temp = decodedData.main.temp
            let humidity = decodedData.main.humidity
            let feelsLike = decodedData.main.feels_like
            let tempMin = decodedData.main.temp_min
            let tempMax = decodedData.main.temp_max
            let windSpeed = decodedData.wind.speed
            let country = decodedData.sys.country
            let lat = decodedData.coord.lat
            let lon = decodedData.coord.lat
            
            let weather = WeatherModel(conditionId: id, cityName: name, countryName: country, weatherMain: weatherMain, temperature: temp, mainHumidity: humidity, mainFeelsLike: feelsLike, tempMin: tempMin, tempMax: tempMax, windSpeed: windSpeed, longitude: lon, latitude: lat)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
