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
        queryParameters: [String: Any]? = nil,
        compilation: @escaping (ResultHandler<T>)
    ){
        
        guard let url = endPointType.url else{
            compilation(.failure(.invalidUrl))
            return
        }
        print("called for \(url)")
        
        let method = endPointType.method
        let body = endPointType.body
        let header = endPointType.header
      
        AF.request(url, method: method, parameters: body, headers: header)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: modelType.self) { response in
            switch response.result{
            case .success(let resultData):
                compilation(.success(resultData))
            case .failure(let error):
                compilation(.failure(.error(error)))
            }
        }
    }
    
}
