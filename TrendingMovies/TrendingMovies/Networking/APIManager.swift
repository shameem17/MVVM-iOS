//
//  APIManager.swift
//  TrendingMovies
//
//  Created by Shameem on 25/1/24.
//

import Foundation


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
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else{
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  200...299 ~= response.statusCode else{
                completion(.failure(.invalidResponse))
                return
            }
            do{
                let movies = try JSONDecoder().decode(TrendingMovies.self, from: data)
                completion(.success(movies))
            }catch{
                completion(.failure(.parsingError))
                print(error)
            }
        }.resume()
    }
}
