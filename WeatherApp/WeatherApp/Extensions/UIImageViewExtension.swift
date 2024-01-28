//
//  UIImageViewExtension.swift
//  WeatherApp
//
//  Created by Shameem on 28/1/24.
//

import UIKit
import Kingfisher
import SDWebImage

extension UIImageView{
    func setImage(with urlString: String){
        guard let url = URL.init(string: urlString) else{
            return
        }
      //  let resource = KF.ImageResource(downloadURL: url)
        let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
    
    func set_image(with urlString: String){
        guard let url = URL(string: urlString) else{
            return
        }
        self.sd_setImage(with: url)
    }
}

