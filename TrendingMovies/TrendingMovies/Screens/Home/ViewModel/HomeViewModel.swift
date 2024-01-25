//
//  HomeViewModel.swift
//  TrendingMovies
//
//  Created by Shameem on 25/1/24.
//

import Foundation

final class HomeViewModel{
    
    var trendingMovies: TrendingMovies?
    var movieList: [Movie] = []
    
    func numberOfSections() ->Int{
        return 1
    }
    
    func numberOfRowsInSection(in section: Int) -> Int{
        return self.trendingMovies?.results.count ?? 0
    }
    
    func getMovieList(){
        APIManager.shared.getMovies { [weak self] resutl in
            switch resutl{
            case .success(let movies):
                print("Movies count = \(movies.results.count)")
                self?.trendingMovies = movies
                self?.movieList = movies.results
                break
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
    
}
