//
//  HomeTableViewMovie.swift
//  TrendingMovies
//
//  Created by Shameem on 25/1/24.
//

import Foundation

class HomeTableViewMovie{
    let id: Int
    let title: String
    let overView: String
    let releaseDate: String
    let ratings: Double
    let imageUrl: String
    
    init(movie: Movie){
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? ""
        self.overView = movie.overview
        self.releaseDate = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.ratings = movie.voteAverage
        self.imageUrl = "\(Constants.API.imageUrl)\(movie.backdropPath)"
    }
}
