//
//  ForecastManager.swift
//  WeatherApp1
//
//  Created by Mantiz on 17/04/23.
//

import Foundation

import CoreLocation

protocol ForecastManagerDelegate {
    func didUpdateForecast(_ forecastManager: ForecastManager, forecast: ForecastModel)
    func didFailWithErrorForecast(error: Error)
}

struct ForecastManager {
    
    let forecastURL = "https://api.openweathermap.org/data/2.5/forecast?appid=54d176cbcf5f38995fc23d633dd4ab76&units=metric"
    
    var forecastDelegate: ForecastManagerDelegate?
    
    func fetchForecast(cityName: String){
        let urlString = "\(forecastURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    func fetchForecast(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(forecastURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    
    func performRequest(with urlString: String){
        
        if let url = URL(string: urlString) {
        let sesion = URLSession(configuration: .default)
        
        let task = sesion.dataTask(with: url) { data, response, error in
            if error != nil {
                self.forecastDelegate?.didFailWithErrorForecast(error: error!)
                print(error!)
                return
            }
            if let safeData = data {
                if let forecast = parseForecastJSON (safeData) {
                    self.forecastDelegate?.didUpdateForecast(self, forecast: forecast)
                }
            }
        }
        task.resume()
        }

    }
    
    func parseForecastJSON (_ forecastData: Data) -> ForecastModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(ForecastData.self, from: forecastData)
            
            let id1 = decodedData.list[0].weather[0].id
            let id2 = decodedData.list[1].weather[0].id
            let id3 = decodedData.list[2].weather[0].id
            let id4 = decodedData.list[3].weather[0].id
            let id5 = decodedData.list[4].weather[0].id
            
            let temp1 = decodedData.list[0].main.temp
            let temp2 = decodedData.list[1].main.temp
            let temp3 = decodedData.list[2].main.temp
            let temp4 = decodedData.list[3].main.temp
            let temp5 = decodedData.list[4].main.temp
            
            let forecast = ForecastModel(forecastTemperature1: temp1, forecastTemperature2: temp2, forecastTemperature3: temp3, forecastTemperature4: temp4, forecastTemperature5: temp5, conditionId1: id1, conditionId2: id2, conditionId3: id3, conditionId4: id4, conditionId5: id5)
            
            return forecast
        }
        catch {
            forecastDelegate?.didFailWithErrorForecast(error: error)
        }
        return nil
    }
}
