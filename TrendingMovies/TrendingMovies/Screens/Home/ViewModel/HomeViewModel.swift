//
//  HomeViewModel.swift
//  TrendingMovies
//
//  Created by Shameem on 25/1/24.
//

import Foundation

final class HomeViewModel{
    
    var isLoading: Observer<Bool> = Observer(false)
    var trendingMovies: Observer<[Movie]> = Observer(nil)
    var movieList: [Movie] = []
    var homeTableViewMovie: [HomeTableViewMovie] = [] 
    func numberOfSections() ->Int{
        return 1
    }
    
    func numberOfRowsInSection(in section: Int) -> Int{
        return self.trendingMovies.value?.count ?? 0
    }
    
    func getMovieName(for movie: Movie?) -> String{
        guard let movie = movie else{
            return ""
        }
        return movie.name ?? movie.title ?? ""
    }
    
    func getMovieList(){
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APIManager.shared.getMovies { [weak self] resutl in
            self?.isLoading.value = false
            switch resutl{
            case .success(let movies):
                DispatchQueue.main.async{
                    
                    print("Movies count = \(movies.results.count)")
                    self?.trendingMovies.value = movies.results
                    self?.movieList = movies.results
                    self?.mapMovie()
                }
                break
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
    
    func mapMovie(){
        self.homeTableViewMovie = self.movieList.compactMap({ HomeTableViewMovie(movie: $0) })
        //print(homeTableViewMovie)
    }
    
}
