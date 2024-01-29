//
//  APIManager.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import Foundation
import Alamofire

typealias ResultHandler<T> = ((Result<T, APIError>) -> Void )


final class APIManager{
    public static let shared = APIManager()
    
    private init() {}
    
    //generic api call
    func request<T: Codable>(
        modelType: T.Type,
        endPointType: EndPoints,
        compilation: @escaping (ResultHandler<T>)
    ){
        guard let url = endPointType.url else{
            compilation(.failure(.invalidUrl))
            return
        }
        
        let method = endPointType.method
        AF.request(url, method: method).validate().responseDecodable(of: modelType.self) { response in
            switch response.result{
            case .success(let resultData):
                compilation(.success(resultData))
            case .failure(let error):
                compilation(.failure(.error(error)))
            }
        }
    }
    
}
