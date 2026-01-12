//
//  CityViewModel.swift
//  WeatherApp
//
//  Created by Shameem on 10/1/26.
//


final class CityViewModel{
    
    var isLoading: Observer<Bool> = Observer(false)
    var cities: Observer<[City]> = Observer(nil)
    
}
extension CityViewModel{
    func getCities(countryCode: String){
        print("coding=\(countryCode)")
        self.isLoading.value = true
        APIManager.shared.request(modelType: [City].self, endPointType: .city(countryCode: countryCode)) { response in
            self.isLoading.value = false
            switch response{
            case .success(let cities):
                print("Cities=\(cities.count)")
                self.cities.value = cities
            case .failure(let error):
                print(error)
            }
        }
    }
    func getCity(for index: Int) -> City?{
        guard let cities = cities.value, index < cities.count else{
            return nil
        }
        return cities[index]
    }
}
