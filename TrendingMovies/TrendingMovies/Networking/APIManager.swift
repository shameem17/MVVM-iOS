//
//  APIManager.swift
//  TrendingMovies
//
//  Created by Shameem on 25/1/24.
//

import Foundation
import Alamofire

typealias Handler = (Result<TrendingMovies, APIDataError>) -> Void


final class APIManager{
    public static let shared = APIManager()
    
    private init() {}
    
    func getMovies(completion: @escaping(Handler) ){
        
        let urlString = "\(Constants.API.baseUrl)\(Constants.API.path)\(Constants.API.apiKey)"
        guard let url = URL(string: urlString) else{
            completion(.failure(.invalidUrl))
            return
        }
        AF.request(url).validate().responseDecodable(of: TrendingMovies.self){ result in
            switch result.result{
            case .failure(let error):
                completion(.failure(.error(error)))
                break
            case .success(let movies):
                completion(.success(movies))
            }
            
        }
    }
}
