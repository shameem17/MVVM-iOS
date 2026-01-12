//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Shameem on 10/1/26.
//


final class WeatherViewModel{
    var weather: Observer<WeatherResponse> = Observer(nil)
    
    func getWeather(coordinate:(Double, Double)){
        APIManager.shared.request(modelType: WeatherResponse.self, endPointType: .weatherByLatlong(lat: coordinate.0, long: coordinate.1)) { response in
            switch response{
            case .success(let weather):
                print("weather =\(weather)")
                self.weather.value = weather
            case .failure(let error):
                print(error)
            }
        }
    }
}
