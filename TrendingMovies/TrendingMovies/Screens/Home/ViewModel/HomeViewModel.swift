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
    
    func numberOfSections() ->Int{
        return 1
    }
    
    func numberOfRowsInSection(in section: Int) -> Int{
        print("called")
        return self.trendingMovies.value?.count ?? 0
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
                print("Movies count = \(movies.results.count)")
                self?.trendingMovies.value = movies.results
                self?.movieList = movies.results
                break
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
    
}
