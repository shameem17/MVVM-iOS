//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import Foundation

final class HomeViewModel{
    
    var countries: [Country] = []
    
    func numberOfSections() -> Int{
        return 1
    }
    func numberOfRowInSection(in section: Int) -> Int{
        return self.countries.count
    }
    
    func getCountries(){
        APIManager.shared.getCountry { [weak self] result in
            switch result{
            case .success(let countries):
                self?.countries = countries
                break
            case .failure(let error):
                print("Error =\(error)")
                break
                
            }
        }
    }
}

