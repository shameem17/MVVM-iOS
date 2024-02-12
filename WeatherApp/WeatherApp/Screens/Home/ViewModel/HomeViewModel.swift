//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import Foundation

final class HomeViewModel{
    
    var isLoading: Observer<Bool> = Observer(false)
    
    var countries: [Country] = []
    var homeCountryModel: [HomeCountryModel] = []
    
    func numberOfSections() -> Int{
        return 1
    }
    func numberOfRowInSection(in section: Int) -> Int{
        return self.countries.count
    }
    
    func getCountries(){
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APIManager.shared.request(modelType: [Country].self, endPointType: .contry) { [weak self] result in
            self?.isLoading.value = false
            switch result{
            case .success(let countries):
                self?.countries = countries
                self?.mapCountry(countries)
                break
            case .failure(let error):
                print("Error =\(error)")
                break
                
            }
        }
        
    }
    
    func mapCountry(_ countries: [Country]){
        self.homeCountryModel = countries.compactMap({ HomeCountryModel($0) })
    }
    
    func getCities(){
       // let body: [String: Any] = ["": "bd"]
        //EndPoints.city.body = body
        APIManager.shared.request(modelType: [City].self, endPointType: .city) { response in
            switch response{
            case .success(let cities):
                print("Cities=\(cities.count)")
            case .failure(let error):
                print(error)
            }
        }
    }
}

