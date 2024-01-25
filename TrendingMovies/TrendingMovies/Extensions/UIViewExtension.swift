//
//  UIViewExtension.swift
//  TrendingMovies
//
//  Created by Shameem on 25/1/24.
//

import UIKit
import Foundation

extension UIView{
    func round(_ cornerRadious: CGFloat){
        self.layer.cornerRadius = cornerRadious
    }
    
    func border(color: UIColor, width: CGFloat){
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
