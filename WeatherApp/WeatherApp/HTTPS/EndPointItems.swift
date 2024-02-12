//
//  EndPointItems.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import Foundation
import Alamofire


protocol EndPointItems{
    var baseUrl: String { get }
    var path:String { get }
    var apiKey: String? { get }
    var url: URL? { get }
    var method: HTTPMethod { get }
    var body: [String: Any]? { get set }
    var header: HTTPHeaders? { get }
    var queryParameters: [String: String]? { get }
}
