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
    
    @IBOutlet weak var languageLabel: UILabel!
    
    public static var identifier: String {
        return "HomeTableViewCell"
    }
    
    public static func register() -> UINib {
        return UINib(nibName: "HomeTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //backView.backgroundColor = .lightGray
        backView.border(color: .label, width: 1)
        backView.round(10)
        movieImageLabel.round(5)
    }
    
    func setupCell(movie: HomeTableViewMovie){
        self.movieNameLabel.text = movie.title
        self.movieDateLabel.text = "Release Date: " + movie.releaseDate
        self.movieRatingLabel.text = stars(from: movie.ratings, outOf: 10)
        self.languageLabel.text = "Language: \(movie.language)"
        self.movieImageLabel.setImage(with: movie.imageUrl)
    }
    
    private func stars(from rating: Double, outOf total: Int = 5) -> String {
        let fullStars = Int(rating)
        let hasHalfStar = rating - Double(fullStars) >= 0.5
        let emptyStars = total - fullStars - (hasHalfStar ? 1 : 0)
        
        return String(repeating: "★", count: fullStars)
            + (hasHalfStar ? "⯨" : "") // Optional: use a half-star symbol if you want
            + String(repeating: "☆", count: emptyStars)
    }
    
}
