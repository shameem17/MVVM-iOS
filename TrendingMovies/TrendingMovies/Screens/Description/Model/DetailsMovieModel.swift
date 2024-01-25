//
//  DetailsMovieModel.swift
//  TrendingMovies
//
//  Created by Shameem on 25/1/24.
//

import Foundation

class DetailsMovieModel{
    let id: Int
    let title: String
    let overView: String
    let releaseDate: String
    let ratings: Double
    let imageUrl: String
    
    init(movie: HomeTableViewMovie){
        self.id = movie.id
        self.title = movie.title
        self.overView = movie.overView
        self.releaseDate = movie.releaseDate
        self.ratings = movie.ratings
        self.imageUrl = movie.imageUrl
    }
}
