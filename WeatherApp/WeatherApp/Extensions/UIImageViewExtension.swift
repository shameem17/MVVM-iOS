//
//  UIImageViewExtension.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import UIKit
import Kingfisher

extension UIImageView{
    func setImage(with urlString: String){
        guard let url = URL(string: urlString) else{
            return
        }
        self.kf.setImage(with: url)
    }
}

