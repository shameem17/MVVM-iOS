//
//  CitiesViewModel.swift
//  WeatherApp
//
//  Created by Shameem on 10/1/26.
//

import Foundation

final class CitiesViewModel {
    
    var isLoading: Observer<Bool> = Observer(false)
    var cities: [City] = []
    var cityModels: [CityModel] = []
    var countryName: String = ""
    var countryCode: String = ""
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowInSection(in section: Int) -> Int {
        return self.cityModels.count
    }
    
    func getCities(countryCode: String, countryName: String) {
        if isLoading.value ?? true {
            return
        }
        self.countryCode = countryCode
        self.countryName = countryName
        isLoading.value = true
        
        APIManager.shared.request(modelType: [City].self, endPointType: .city(countryCode: countryCode)) { [weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let cities):
                print("Cities=\(cities.count)")
                self?.cities = cities
                self?.mapCities(cities)
                break
            case .failure(let error):
                print("Error =\(error)")
                break
            }
        }
    }
    
    func mapCities(_ cities: [City]) {
        self.cityModels = cities.compactMap({ CityModel($0) })
    }
}
