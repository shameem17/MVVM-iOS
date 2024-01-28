//
//  Observer.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import Foundation

final class Observer<T> {
    var value: T?{
        didSet{
            DispatchQueue.main.async{
                self.listener?(self.value)
            }
        }
    }
    
    init(_ value: T?){
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func binding(_ listener: @escaping ((T? ) -> Void)){
        listener(value)
        self.listener = listener
    }
}
