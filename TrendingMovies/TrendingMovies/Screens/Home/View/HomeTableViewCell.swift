//
//  HomeTableViewCell.swift
//  TrendingMovies
//
//  Created by Shameem on 25/1/24.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var movieImageLabel: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    
    public static var identifier: String {
        return "HomeTableViewCell"
    }
    
    public static func register() -> UINib {
        return UINib(nibName: "HomeTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.backgroundColor = .lightGray
        backView.border(color: .label, width: 1)
        backView.round(10)
        movieImageLabel.round(5)
    }
    
    func setupCell(movie: HomeTableViewMovie){
        self.movieNameLabel.text = movie.title
        self.movieDateLabel.text = movie.releaseDate
        self.movieRatingLabel.text = "\(movie.ratings)/10"
        
        self.movieImageLabel.setImage(with: movie.imageUrl)
    }
    
}
