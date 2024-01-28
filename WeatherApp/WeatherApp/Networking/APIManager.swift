//
//  APIManager.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import Foundation

final class APIManager{
    public static let shared = APIManager()
    
    private init() {}
    
    func getCountry(completion: @escaping ((Result<[Country], APIError>) -> Void )){
        let url = URL(string: Constants.API.CountryAPI.baseUrl)
        
        guard let url = url else{
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data , error == nil else{
                completion(.failure(.invalidData))
                return
            }
            
            do{
                let countries = try JSONDecoder().decode([Country].self, from: data)
                print(countries.count)
                completion(.success(countries))
            }catch{
                completion(.failure(.parsingError))
                
            }
            
        }.resume()
        
    }
}
