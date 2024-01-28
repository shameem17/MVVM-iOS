//
//  UIViewExtension.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import UIKit

extension UIView{
    func round(_ cornerRadious: CGFloat){
        self.layer.cornerRadius = cornerRadious
    }
    
    func border(color: UIColor, width: CGFloat){
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
