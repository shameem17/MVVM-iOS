//
//  APIManager.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import Foundation
import Alamofire

final class APIManager{
    public static let shared = APIManager()
    
    private init() {}
    
    func getCountry(completion: @escaping ((Result<[Country], APIError>) -> Void )){
        let url = URL(string: Constants.API.CountryAPI.baseUrl)
        
        guard let url = url else{
            completion(.failure(.invalidUrl))
            return
        }
        
        AF.request(url).validate().responseDecodable(of: [Country].self) { response in
            switch response.result{
            case .success(let countries):
                completion(.success(countries))
                break
            case .failure(let error):
                completion(.failure(.error(error)))
            }
        }
    }
}
