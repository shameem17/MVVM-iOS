//
//  UIImageViewExtension.swift
//  TrendingMovies
//
//  Created by Shameem on 25/1/24.
//


import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlStirng: String){
        let url = URL(string: urlStirng)
        guard let url = url else{
            return
        }
       // let resource = ImageResource(name: url, bundle: urlStirng)
        kf.indicatorType = .activity
        self.kf.setImage(with: url)
        
    }
}
