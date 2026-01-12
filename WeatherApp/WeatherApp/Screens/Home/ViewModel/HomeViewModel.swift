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
    var homeCountryModel: Observer<[HomeCountryModel]> = Observer(nil)
    
    func numberOfSections() -> Int{
        return 1
    }
    func numberOfRowInSection(in section: Int) -> Int{
        return self.homeCountryModel.value?.count ?? 0
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
               // print("countries=\(countries)")
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
        self.homeCountryModel.value = countries.compactMap({ HomeCountryModel($0) })
    }
    
    func getCCA(country: HomeCountryModel?)->String?{
        if country?.cca2 != nil{
            return country?.cca2
        }
        let flag = country?.flags?.png ?? ""
        let code = flag
            .components(separatedBy: "/")
            .last?
            .components(separatedBy: ".")
            .first

        return code
    }
    
    func searchForCountry(with text: String){
        if text.isEmpty{
            mapCountry(self.countries)
            return
        }
        let countries = homeCountryModel.value
        homeCountryModel.value = countries?.filter({
            $0.name?.lowercased().contains(text.lowercased()) ?? false
        })
        
    }
}
